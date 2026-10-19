BEGIN;

ROLLBACK;

CREATE TEMP TABLE temp_escolas AS SELECT * FROM( VALUES (52232943),(70107728),(52232997)) AS t(id_escola);

SELECT nextval('basico.escola_curriculo_sequence') AS id_insert, cb.id_curriculo_basico, te.id_escola
INTO TEMP curriculo_estruturas
FROM basico.curriculo_basico cb
CROSS JOIN temp_escolas te
-- Isso faz cada currículo repetir para cada escola
WHERE cb.codigo IN ('EMEITIB2', 'EMEITIM1', 'EMEITIM2', 'EMEITIP1', 'EMEITIP2');


-- 3. Geramos os comandos de INSERT e DELETE (Backup)
SELECT 'INSERT INTO basico.escola_curriculo (id, ativo, id_curriculo_basico, id_escola, data_cadastro) ' ||
    'VALUES (' || id_insert || ', true, ' || id_curriculo_basico || ', ' || id_escola || ', ''' || now() || ''');' AS SOLUCAO, 
    'DELETE FROM basico.escola_curriculo WHERE id = ' || id_insert || ';' AS BACKUP
FROM curriculo_estruturas;

--############
--Grupo 1
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG1
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876300)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869716;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61640186 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG1;

--############
--Grupo 2
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG2
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876318)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869713;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639524 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG2;

--############
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
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639553 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO
FROM turma_serie_novaG3;

--############
--Grupo 4 
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG4 
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (51876342,72766316,51876342)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869714;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639644 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS BACKUP
FROM turma_serie_novaG4;

--############

--Grupo 5
SELECT ts.id_turma_serie, ts.id_curriculo_medio 
INTO TEMP turma_serie_novaG5
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio in (72759255,51876354, 72759255)
AND ts.ano = 2026
AND ts.id_escola IN (52232943,70107728,52232997)
AND ts.ativo 
AND ts.id_serie = 51869715;

SELECT
'UPDATE basico.turma_serie	SET id_curriculo_medio= 61639761 WHERE id_turma_serie = ' || id_turma_serie || ';' AS SOLUCAO,
'UPDATE basico.turma_serie	SET id_curriculo_medio= '||id_curriculo_medio||' WHERE id_turma_serie = ' || id_turma_serie || ';' AS BACKUP
FROM turma_serie_novaG5;

--ROLLBACK;
COMMIT;