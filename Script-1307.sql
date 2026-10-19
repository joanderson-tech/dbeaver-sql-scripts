--solução
UPDATE basico.curriculo_basico_componente SET ch_ano=200 WHERE id_curriculo_basico_componente=51913149;
UPDATE basico.curriculo_basico_componente SET ch_ano=150 WHERE id_curriculo_basico_componente IN (51913150,51913151,51913152,51913153);

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), 51895123, 293, 800, NULL, NULL, now(), TRUE, NULL, 20, NULL, 5, TRUE, NULL, FALSE, 1, FALSE, FALSE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 7, 293, 1, 9000, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE);


----- ============================================
----- CRIAÇÃO DE TURMA COMPONENTE
----- ============================================

--drop table tc_para_adicionar;

-- #1 select das turmas para adicionar turma -
SELECT DISTINCT 
	nextval('ensino.turma_seq') id_turma, tsa.ano, tsa.periodo, 1 id_situacao_turma,
-- ABERTA
tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, cbc.id_categoria_componente
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
-- tsa: Turma Serie Adicionar
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293;

-- #2 insert das turmas 
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente 
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro::timestamp, id_turma_serie, ordem, id_categoria_componente
FROM tc_para_adicionar;

-- ## Criação de Novas Matrículas Componentes
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

--insert das Novas Matrículas Componentes
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

-- #1 backup  das turmas 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar;
-- #2 backup Matrículas Componentes
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM novas_mc mc;


COMMIT;