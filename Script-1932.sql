SELECT *
--cb.codigo, cb.tipo_diario_diversificado 
FROM basico.curriculo_basico cb
WHERE id_curriculo_basico IN (52030949, 52030965);

SELECT * FROM ensino.turma t where t.id_turma_serie = 51899432;

BEGIN;

ROLLBACK; 

--PASSO 01 ----- CRIAÇÃO DE TURMA COMPONENTE
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
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico  IN (52030949, 52030965)
AND tsa.id_turma_serie IN (51899432, 51899431, 51899576, 51955883, 51899577, 51901646)
WHERE tsa.ativo
AND NOT EXISTS (
    SELECT 1
FROM ensino.turma t_existente
WHERE t_existente.id_turma_serie = tsa.id_turma_serie
AND t_existente.id_disciplina = cbc.id_componente_curricular
);

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE id_curriculo_basico IN (52030949);

SELECT * FROM tc_para_adicionar;

---BACKUP
-- #1 backup  das TURMA COMPONENTE
SELECT
    'DELETE FROM ensino.turma WHERE id_turma = '|| id_turma || ';' 
FROM tc_para_adicionar;

-- #1 insert das TURMAS COMPONENTE 

INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, processada, processada_rematricula
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), id_turma_serie, ordem, NULL, id_turma_agrupadora, FALSE, FALSE
FROM tc_para_adicionar;


-- --PASSO 02 Criação de Novas Matrículas Componentes
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


SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');' 
FROM novas_mc sub where sub.id_componente_curricular IN  (518, 521);


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


--ROLLBACK;
COMMIT;