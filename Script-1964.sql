BEGIN;

DROP TABLE IF EXISTS tc_apagar;
DROP TABLE IF EXISTS tc_para_adicionar;
DROP TABLE IF EXISTS novas_mc;

ROLLBACK ;

COMMIT;

--##1. Criação da tabela Para inativar as turmas antigas pois a nova é diferente.
SELECT  t.id_turma, t.id_disciplina , t.id_situacao_turma
INTO TEMP tc_apagar
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN ( 52030965, 52030949)
AND ts.ativo
AND t.id_disciplina <> 220
AND t.id_situacao_turma <> 4;

-- Backup 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = ' || t.id_situacao_turma ||  ' WHERE id_turma = ' || t.id_turma || '; '
FROM tc_apagar t;

-- 1. SOLUÇÃO Execução do UPDATE Turma
UPDATE ensino.turma SET id_situacao_turma = 4 FROM ( SELECT DISTINCT id_turma FROM tc_apagar ) AS fo WHERE ensino.turma.id_turma = fo.id_turma;

--##2. Criação da tabela TEMP mc_apagar das turma antigas
SELECT mc.id_matricula_componente , mc.id_situacao_matricula, mc.id_componente_curricular
INTO TEMP mc_apagar
FROM basico.turma_serie ts 
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON  mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie 
WHERE ts.id_curriculo_medio IN ( 52030965, 52030949)
AND ts.ativo 
AND mc.id_componente_curricular <> 220
AND mc.id_situacao_matricula <> 7;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = ' || mc.id_situacao_matricula || ' WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM mc_apagar mc;

-- 2. SOLUÇÃO Execução do UPDATE Matrícula Componente
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 FROM(
SELECT DISTINCT mc.id_matricula_componente FROM mc_apagar mc) AS fo
WHERE ensino.matricula_componente.id_matricula_componente = fo.id_matricula_componente;

--## 03 ----- CRIAÇÃO DE TURMA COMPONENTE 
SELECT DISTINCT 
    nextval('ensino.turma_seq') id_turma,(
        SELECT t.id_turma
FROM ensino.turma t
WHERE t.id_turma_serie = tsa.id_turma_serie
AND t.id_disciplina = 220
LIMIT 1
    ) AS id_turma_agrupadora, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno,cbc.id_categoria_componente, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, NULL observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, NULL
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico IN (52030965)
AND tsa.id_turma_serie IN (51899431, 51899576, 51955883, 51899577, 51901646,51899432)
WHERE tsa.ativo
AND NOT EXISTS (
    SELECT 1
FROM ensino.turma t_existente
WHERE t_existente.id_turma_serie = tsa.id_turma_serie
AND t_existente.id_disciplina = cbc.id_componente_curricular
AND t_existente.id_situacao_turma  <> 4
);

SELECT * FROM basico.curriculo_basico_componente cbc where cbc.id_curriculo_basico IN (52030965);

---BACKUP
SELECT
    'DELETE FROM ensino.turma WHERE id_turma = '|| id_turma || ';' 
FROM tc_para_adicionar;

--SOUÇÃO
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turno, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, processada, processada_rematricula
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), 1 , id_turma_serie, ordem, NULL, id_turma_agrupadora, FALSE, FALSE
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

--BACKUP
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');' 
FROM novas_mc sub;

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


ROLLBACK;

COMMIT;

SELECT * FROM novas_mc;


SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (51899431);

SELECT distinct mc.*  FROM ensino.turma t 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (51899431) AND t.id_situacao_turma = 1
AND mc.id_situacao_matricula <> 7;


SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie in (51899431, 51899576, 51955883, 51899577, 51901646,51899432);

UPDATE ensino.matricula_componente SET id_situacao_matricula = 2 WHERE id_matricula_componente IN (16997307,16997316,16997325,16997334,16997343,16997352,16997361,16997370,16997379,16997388,16997397,16997406,16997415,16997424,16997433,16997442,16997451,16997469,16997478,17079280,17026692,17083900,17068709,17068719,17068729,17068739,17068749,17068759,17068769,17068779,17068789,17068799,17068809,17068819,17068829,17068839,17068849,17068859,17068869,17068889,17068899,17073458,17074418,17076002,17076012,17079240,17084579,17026755,17084599,17026872,17036753,17027052,17036735,17091175,17070617,17037239,17065763,17026935,17037176,17027106,17065893,17084469,17036645,17027007,17036780,17065993,17027061,17084609,17026944,17084559,17036672,17065843,17065933,17065953,17036681,17037212,17027079,17074520,17072210,17026881,17084449,17036690,17026908,17084569,17037275,17026926,17026728,17037140,17037149,17036807,17083456,17084429,17081281,17027043,17026782,17084459,17073633,17069774,17026890,17037230,17084619,17037284,17037203,17036762,17027097,17036717,17083911,17037167,17084499,17065873,17027025,17037221,17084529,17065903,17036654,17036744,17026953,17027088,17084409,17026719,17027070,17036843,17026899,17075479,17065923,17026764,17065863,17088103,17065973,17037131,17037158,17037185,17026980,17026971,17026710,17026746,17072729,17036663,17084589,17066003,17026818,17065813,17036852,17036798,17026773,17026701,17065833,17084539,17027034,17065853,17026809,17084479,17090886,17037248,17037293,17084549,17026917,17026836,17065883,17037194,17086834,17084439,17037122,17026962,17084519,17084399,17081101,17036771,17026845,17073736,17065983,17026800,17092894,17065963,17071928,17084419,17065823,17083522,17027016,17037266,17083479,17036708,17065803,17065783,17026737,17084509,17036726,17036816,17026863,17026989,17036699,17069900,17036825,17036789,17036834,17026827,17065793,17084489,17090869,17027115,17084629,17070353,17065913,17026998,17037257,17074511,17065773,17071166,17026854,17026791,17065943);


ROLLBACK;

