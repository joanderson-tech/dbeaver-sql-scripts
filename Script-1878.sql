SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo = 'EICM2INT'; 61639644

BEGIN;
ROLLBACK;

--Grupo 3
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG3
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876684)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51876116;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61640186 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG3;



--GRUPO 1 51869716
--GRUPO 2 51869713
--GRUPO 3 51876116

