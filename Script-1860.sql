BEGIN;

-- Criar mapeamento de IDs de Disciplina
CREATE TEMPORARY TABLE map_disciplinas (id_cc_correto INT, id_cc_erro INT);
INSERT INTO map_disciplinas VALUES 
(517, 223), (512, 225), (515, 222), (519, 238), (518, 230), (513, 224), 
(537, NULL), (538, NULL), (539, NULL), (540, NULL), (541, NULL);

-- Criar mapeamento de currículos
CREATE TEMPORARY TABLE map_curriculo (
    id_ts BIGINT, 
    id_novo_curriculo BIGINT,
    id_antigo_curriculo BIGINT,
    novo_tipo_diario INT
);
INSERT INTO map_curriculo VALUES 
(52588000, 52506698, 52840465, 31),
(52588087, 52506715, 52840478, 31),
(52588088, 52506715, 52840478, 31),
(52586119, 52506730, 52840901, 57);

-- Correlacionar as turmas de acordos com suas disciplinas, quando houver, para preservar os dados
CREATE TEMPORARY TABLE de_para_turmas AS
SELECT 
    t_erro.id_turma AS id_turma_com_erro,
    t_correta.id_turma AS id_turma_correta,
    COALESCE(t_erro.id_situacao_turma, 1) AS situacao_original, -- Se não houver erro, assume Ativa (1)
    t_correta.id_situacao_turma AS situacao_atual
FROM ensino.turma t_correta
JOIN map_curriculo mc ON t_correta.id_turma_serie = mc.id_ts
JOIN map_disciplinas md ON md.id_cc_correto = t_correta.id_disciplina
LEFT JOIN ensino.turma t_erro ON t_erro.id_turma_serie = t_correta.id_turma_serie
    AND t_erro.id_disciplina = md.id_cc_erro
    AND t_erro.id_situacao_turma IN (1, 3)
WHERE t_correta.id_turma_serie IN (SELECT id_ts FROM map_curriculo);

-- Mapear as matricula_componente para que sejam ajustadas mais a frente.
CREATE TEMPORARY TABLE de_para_matriculas AS
SELECT 
    mc_erro.id_matricula_componente AS id_mc_erro,
    mc_correta.id_matricula_componente AS id_mc_correta,
    COALESCE(mc_erro.id_situacao_matricula, 2) AS situacao_origem,
    dp.id_turma_correta
FROM de_para_turmas dp
JOIN ensino.matricula_componente mc_correta ON mc_correta.id_turma = dp.id_turma_correta
LEFT JOIN ensino.matricula_componente mc_erro ON mc_erro.id_turma = dp.id_turma_com_erro
    AND mc_erro.id_discente = mc_correta.id_discente;

/* =============================================================================
   BLOCO DE BACKUP - EXECUTE E SALVE O RESULTADO ANTES DO COMMIT
   =============================================================================
*/

-- 1. Backup de currículo da turma-serie
SELECT 'UPDATE basico.turma_serie SET id_curriculo_medio = ' || id_curriculo_medio || ', tipo_diario = ' || tipo_diario || ', id_turno = ' || id_turno || ' WHERE id_turma_serie = ' || id_turma_serie || ';' 
FROM basico.turma_serie WHERE id_turma_serie IN (SELECT id_ts FROM map_curriculo);

-- 2. Backup de currículo das MES
SELECT 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';'
FROM basico.matricula_estudante_serie mes 
JOIN map_curriculo mc ON mes.id_turma_serie = mc.id_ts;

-- 3. Backup de situação das turmas
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || id_situacao_turma || ' WHERE id_turma = ' || id_turma || ';'
FROM ensino.turma 
WHERE id_turma IN (SELECT id_turma_correta FROM de_para_turmas) 
   OR id_turma IN (SELECT id_turma_com_erro FROM de_para_turmas WHERE id_turma_com_erro IS NOT NULL);

-- 4. Backup de matricula_componente
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || id_situacao_matricula || ', id_turma = ' || id_turma || ' WHERE id_matricula_componente = ' || id_matricula_componente || ';'
FROM ensino.matricula_componente 
WHERE id_turma IN (SELECT id_turma_correta FROM de_para_turmas) 
   OR id_turma IN (SELECT id_turma_com_erro FROM de_para_turmas WHERE id_turma_com_erro IS NOT NULL);

-- 5. Backup de nota_unidade (migração entre matrículas)
SELECT 'UPDATE ensino.nota_unidade SET id_matricula_componente = ' || nu.id_matricula_componente || ' WHERE id_nota_unidade = ' || nu.id_nota_unidade || ';'
FROM ensino.nota_unidade nu 
JOIN de_para_matriculas dm ON nu.id_matricula_componente = dm.id_mc_erro 
WHERE dm.id_mc_erro IS NOT NULL;

-- 6. Backup de Frequência, Docente, Horários e AVA
SELECT 'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia = ' || fa.id_frequencia || ';'
FROM ensino.frequencia_aluno fa 
JOIN de_para_turmas dp ON fa.id_turma = dp.id_turma_com_erro 
WHERE dp.id_turma_com_erro IS NOT NULL;

SELECT 'UPDATE ensino.docente_turma SET id_turma = ' || dt.id_turma || ' WHERE id_docente_turma = ' || dt.id_docente_turma || ';'
FROM ensino.docente_turma dt 
JOIN de_para_turmas dp ON dt.id_turma = dp.id_turma_com_erro 
WHERE dp.id_turma_com_erro IS NOT NULL;

SELECT 'UPDATE ensino.horario_turma SET id_turma = ' || ht.id_turma || ' WHERE id_horario_turma = ' || ht.id_horario_turma || ';'
FROM ensino.horario_turma ht 
JOIN de_para_turmas dp ON ht.id_turma = dp.id_turma_com_erro 
WHERE dp.id_turma_com_erro IS NOT NULL;

SELECT 'UPDATE ava.topico_aula SET id_turma = ' || ta.id_turma || ' WHERE id_topico_aula = ' || ta.id_topico_aula || ';'
FROM ava.topico_aula ta 
JOIN de_para_turmas dp ON ta.id_turma = dp.id_turma_com_erro 
WHERE dp.id_turma_com_erro IS NOT NULL;

SELECT 'UPDATE ava.aula_extra SET id_turma = ' || ae.id_turma || ' WHERE id = ' || ae.id || ';'
FROM ava.aula_extra ae 
JOIN de_para_turmas dp ON ae.id_turma = dp.id_turma_com_erro 
WHERE dp.id_turma_com_erro IS NOT NULL;

/* =============================================================================
   FIM BLOCO DE BACKUP
   ============================================================================
*/

-- Inativar as turmas que estavam com erro
UPDATE ensino.turma t
SET id_situacao_turma = 4 
WHERE t.id_turma_serie IN (SELECT id_ts FROM map_curriculo)
  AND (
      t.id_turma IN (SELECT id_turma_com_erro FROM de_para_turmas WHERE id_turma_com_erro IS NOT NULL)
      OR 
      (t.id_disciplina IN (SELECT id_cc_erro FROM map_disciplinas WHERE id_cc_erro IS NOT NULL) 
       AND t.id_situacao_turma IN (1, 3))
  )
  AND t.id_turma NOT IN (SELECT id_turma_correta FROM de_para_turmas);

-- 1. Atualizar estrutura das turma-série
UPDATE basico.turma_serie ts
SET id_curriculo_medio = mc.id_novo_curriculo,
    tipo_diario = mc.novo_tipo_diario,
    id_turno = 1
FROM map_curriculo mc
WHERE ts.id_turma_serie = mc.id_ts;

-- 2. Atualizar MES
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = mc.id_novo_curriculo
FROM map_curriculo mc
WHERE mes.id_turma_serie = mc.id_ts
  AND mes.id_curriculo_medio = mc.id_antigo_curriculo;

-- 3. Atualizar matricula_componente de acordo com as estratégias
-- Estratégia A: Reativar matrículas que já existem na turma correta
UPDATE ensino.matricula_componente mc
SET id_situacao_matricula = dm.situacao_origem 
FROM de_para_matriculas dm
WHERE mc.id_matricula_componente = dm.id_mc_correta
  AND mc.id_situacao_matricula = 7;

-- Estratégia B: Mover o aluno da turma erro para a correta
UPDATE ensino.matricula_componente mc
SET id_turma = dp.id_turma_correta,
    id_situacao_matricula = dm.situacao_origem
FROM de_para_turmas dp
JOIN de_para_matriculas dm ON dm.id_mc_erro = dm.id_mc_erro
WHERE mc.id_matricula_componente = dm.id_mc_erro
  AND mc.id_turma = dp.id_turma_com_erro
  AND dp.id_turma_com_erro IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 FROM ensino.matricula_componente sub 
      WHERE sub.id_turma = dp.id_turma_correta 
      AND sub.id_discente = mc.id_discente
  );

-- Excluir as matrículas que restaram nas turmas-erro (situação -> 7)
UPDATE ensino.matricula_componente mc
SET id_situacao_matricula = 7
FROM de_para_turmas dp
WHERE mc.id_turma = dp.id_turma_com_erro
  AND dp.id_turma_com_erro IS NOT NULL;

-- 4. Migrar Frequência para as turmas corretas
UPDATE ensino.frequencia_aluno fa
SET id_turma = dp.id_turma_correta
FROM de_para_turmas dp
WHERE fa.id_turma = dp.id_turma_com_erro;

-- 5. Migrar docente-turma
UPDATE ensino.docente_turma dt
SET id_turma = dp.id_turma_correta
FROM de_para_turmas dp
WHERE dt.id_turma = dp.id_turma_com_erro;

-- 6. Migrar horários
UPDATE ensino.horario_turma ht
SET id_turma = dp.id_turma_correta
FROM de_para_turmas dp
WHERE ht.id_turma = dp.id_turma_com_erro;

-- 7. Migrar tópicos de aula
UPDATE ava.topico_aula ta
SET id_turma = dp.id_turma_correta
FROM de_para_turmas dp
WHERE ta.id_turma = dp.id_turma_com_erro;

-- 8. Migrar aulas extra
UPDATE ava.aula_extra ae
SET id_turma = dp.id_turma_correta
FROM de_para_turmas dp
WHERE ae.id_turma = dp.id_turma_com_erro;

-- 9. Migrar notas
UPDATE ensino.nota_unidade nu
SET id_matricula_componente = dm.id_mc_correta
FROM de_para_matriculas dm
WHERE nu.id_matricula_componente = dm.id_mc_erro;

-- 10. Restaurar a situação da Turma
UPDATE ensino.turma t
SET id_situacao_turma = dp.situacao_original
FROM de_para_turmas dp
WHERE t.id_turma = dp.id_turma_correta
  AND t.id_situacao_turma = 4
  AND dp.situacao_atual = 4;

COMMIT;