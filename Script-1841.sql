BEGIN;
--## TODOS ESSES PASSOS SÃO TABELA TEMPORARIA ATÉ CHEGAR NA SOLUÇÃO ##--

----PASSO 01 ----- CRIAÇÃO DA TABELA TEMPORARIA PARA MUDAR O CURRICULO ANTIGO PARA O NOVO
SELECT id_turma_serie, id_curriculo_medio AS id_antigo, tipo_diario, CASE 
WHEN id_curriculo_medio = 51880851 THEN 51895174
WHEN id_curriculo_medio = 51880867 THEN 51895190
WHEN id_curriculo_medio = 51880817 THEN 51895209
WHEN id_curriculo_medio = 51880834 THEN 51895225
    END AS id_novo_simulado
    INTO TEMP curriculo_novo
FROM basico.turma_serie
WHERE id_curriculo_medio IN (51880851, 51880867, 51880817, 51880834)
ORDER BY id_curriculo_medio ASC;

----PASSO 02 ----- CRIAÇÃO DA TABELA TEMPORARIA PARA MUDAR O STATUS DA TURMA COMPONENTE
SELECT t.id_turma, t.id_situacao_turma 
INTO TEMP mudarStatusTurma
FROM ensino.turma t
WHERE t.id_turma_serie IN (SELECT id_turma_serie
FROM curriculo_novo)
AND t.id_disciplina IN (518, 520);

----PASSO 03 ----- CRIAÇÃO DA TABELA TEMPORARIA PARA MUDAR O STATUS DA MATRICULA COMPONENTE
SELECT mc.id_matricula_componente, mc.id_situacao_matricula
INTO TEMP mudarStatusComponente
FROM ensino.matricula_componente mc
INNER JOIN mudarStatusTurma nt ON
nt.id_turma = mc.id_turma
WHERE mc.id_situacao_matricula <> 7;

--PASSO 04 ----- CRIAÇÃO DA TABELA TEMPORARIA DA TURMA COMPONENTE
SELECT DISTINCT 
    nextval('ensino.turma_seq') id_turma,(
        SELECT t.id_turma
FROM ensino.turma t
WHERE t.id_turma_serie = tsa.id_turma_serie
AND t.id_disciplina = 220
LIMIT 1
    ) AS id_turma_agrupadora, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, NULL observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, NULL
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico IN (51895174) 
AND tsa.id_turma_serie IN (51894960,51887638,51887688,51894949,51894924,51894937,51894983,51894973,51887731,51887730,51895002)
AND cbc.id_componente_curricular  IN (521)
WHERE tsa.ativo
AND NOT EXISTS (
    SELECT 1
FROM ensino.turma t_existente
WHERE t_existente.id_turma_serie = tsa.id_turma_serie
AND t_existente.id_disciplina = cbc.id_componente_curricular
);

--PASSO 05 -----CRIAÇÃO DA TABELA TEMPORARIA DAS NOVAS MATRICULA COMPONENTE, DO COMPONENTE 521
WITH criar_MC AS (
 SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente, CASE 
               WHEN mes.id_situacao_matricula_serie = 1 THEN 2
WHEN mes.id_situacao_matricula_serie = 2 THEN 5
WHEN mes.id_situacao_matricula_serie = 3 THEN 6
WHEN mes.id_situacao_matricula_serie = 4
	OR mes.id_situacao_matricula_serie = 9 THEN 4
	WHEN mes.id_situacao_matricula_serie = 5 THEN 3
	WHEN mes.id_situacao_matricula_serie = 6 THEN 9
	ELSE 2
           END AS id_situacao_matricula, ts.id_turma, ts.id_disciplina AS id_componente_curricular, mes.id_estudante AS id_discente, ts.ano, ts.periodo, ts.id_turma_serie, mes.id_matricula_discente_serie id_matricula_estudante_serie
FROM tc_para_adicionar ts
JOIN basico.matricula_estudante_serie mes ON
	mes.id_turma_serie = ts.id_turma_serie
WHERE 1 = 1
	AND ts.id_situacao_turma <> 4)
    SELECT DISTINCT *
    INTO TEMP novas_mc
FROM criar_MC tm
WHERE NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = tm.id_turma
AND mc.ano = tm.ano
AND mc.id_situacao_matricula = tm.id_situacao_matricula
AND mc.id_discente = tm.id_discente
);

--##SOLUÇÃO E BACKUP DAS ALTERAÇÃO 

-- 00 Alteração do curriculo na mes
SELECT 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || 
       ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie  || ';' AS backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN (51880851, 51880867, 51880817, 51880834);

UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN ts.id_curriculo_medio = 51880851 THEN 51895174
    WHEN ts.id_curriculo_medio = 51880867 THEN 51895190
    WHEN ts.id_curriculo_medio = 51880817 THEN 51895209
    WHEN ts.id_curriculo_medio = 51880834 THEN 51895225
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
AND ts.id_curriculo_medio IN (51880851, 51880867, 51880817, 51880834);


-- 01 BACKUP 
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || id_situacao_matricula || ' WHERE id_matricula_componente = ' || id_matricula_componente || ';' AS backup
FROM mudarStatusComponente;

-- 01 SOLUÇÃO DIRETA PARA MUDAR O STATUS DA MATRICULA COMPONENTE
UPDATE ensino.matricula_componente mc
SET id_situacao_matricula = 7
FROM mudarStatusComponente msc
WHERE mc.id_matricula_componente = msc.id_matricula_componente;

-- 02 BACKUP 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || id_situacao_turma || ' WHERE id_turma = ' || id_turma || ';' AS backup
FROM mudarStatusTurma;

-- 02 SOLUÇÃO DIRETA PARA MUDAR O STATUS DA TURMA COMPONENTE
UPDATE ensino.turma t SET id_situacao_turma = 4 FROM mudarStatusTurma mst WHERE t.id_turma = mst.id_turma;

-- 03 BACKUP  
SELECT 'UPDATE basico.turma_serie SET id_curriculo_medio = ' || id_antigo || ' WHERE id_turma_serie = ' || id_turma_serie || ';' AS backup
FROM curriculo_novo;

-- 03 SOLUÇÃO DIRETA MUDAR O CURRICULO ANTIGO PARA O NOVO
UPDATE basico.turma_serie ts SET id_curriculo_medio = cn.id_novo_simulado FROM curriculo_novo cn WHERE ts.id_turma_serie = cn.id_turma_serie;

-- #4 backup  
SELECT 'DELETE FROM ensino.turma WHERE id_turma IN ( ' || string_agg(id_turma::TEXT,',') || ');' FROM tc_para_adicionar WHERE id_disciplina IN  (521);

-- #4 SOLUÇÃO DIRETA DAS TURMAS, APENAS DO COMPONENTE 521
INSERT INTO ensino.turma (id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, processada, processada_rematricula)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), id_turma_serie, ordem, NULL, id_turma_agrupadora, FALSE, FALSE
FROM tc_para_adicionar;

-- #5 backup
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');' FROM novas_mc sub where sub.id_componente_curricular IN  (521);

-- #5 SOLUÇÃO DIRETA DAS MATRICULA COMPONENTE, APENAS DO COMPONENTE 521
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo, id_matricula_estudante_serie
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = tm.id_turma
AND mc.ano = tm.ano
AND mc.id_situacao_matricula = tm.id_situacao_matricula
AND mc.id_discente = tm.id_discente
);

--ROLLBACK;
COMMIT;







