84521253,
84521254,
84521255,
84521256,
84521257,
84521258

-- Auto-generated SQL script #202602271656
UPDATE basico.turma_serie
	SET id_curriculo_medio=61639644
	WHERE id_turma_serie IN (84521157,84521159,84521158,84521218,84521219,84521253,84521254,84521255,84521256,84521257,84521258);

BEGIN;
ROLLBACK;



SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo = 'EMEITIM2'; 61639644

--Grupo 4 
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_nova 
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876342,72766316,51876342)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869714;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_nova;




