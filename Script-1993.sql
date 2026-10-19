SELECT distinct cb.*
FROM basico.curriculo_basico cb
JOIN basico.turma_serie ts ON ts.id_curriculo_medio = cb.id_curriculo_basico 
JOIN basico.matricula_estudante_serie mes ON  mes.id_turma_serie = ts.id_turma_serie  
WHERE cb.id_curriculo_basico IN (51896712)
AND ts.ativo;
/*51880990 BERÇÁRIO I  NÃO TEM TURMA EIM1INT;
 
51896095 BERÇÁRIO I*/

BEGIN;

-- Auto-generated SQL script #202603171501
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51896712 WHERE id_matricula_discente_serie IN (1320065, 1320064, 1317355, 1317356, 1320066, 1317410, 1317411, 1317415, 1317362, 1319975, 1319890, 1319889, 1319887, 1319888);
UPDATE basico.turma_serie SET id_curriculo_medio = 51896712 WHERE id_turma_serie IN (51896181, 51896571);

COMMIT;

UPDATE basico.matricula_estudante_serie 	SET id_curriculo_medio=51880983 WHERE id_matricula_discente_serie IN (1320065,1320064,1317355,1317356,1320066,1317410,1317411,1317415,1317362,1319975,1319890,1319889,1319887,1319888);

UPDATE basico.turma_serie SET id_curriculo_medio = 51880983 WHERE id_turma_serie IN (51896181, 51896571);



UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=31	WHERE id_curriculo_basico IN (51896095, 51886491, 51880997, 51886498, 51880990, 51881004, 51881011);
UPDATE basico.curriculo_basico SET tipo_diario_diversificado = 31, possui_parte_diversificada = TRUE WHERE id_curriculo_basico = 51896712;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51896712 WHERE id_matricula_discente_serie IN (1320065, 1320064, 1317355, 1317356, 1320066, 1317410, 1317411, 1317415, 1317362, 1319975, 1319890, 1319889, 1319887, 1319888);
UPDATE basico.turma_serie SET id_curriculo_medio = 51896712 WHERE id_turma_serie IN (51896181, 51896571);




--51896712

--completo;
SELECT cb.*
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (51880983, 51896712);


51880997


BEGIN;

ROLLBACK;

--SOLUÇÃO
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=31	WHERE id_curriculo_basico IN (51880983, 51896095, 51886491, 51886498, 51881004, 51881011);

--BACKUP
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=31	WHERE id_curriculo_basico IN (51896095, 51886491, 51886498, 51881004, 51881011);



--ID CURRICULO 51880983 EIBINT DIFERENTE


SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_configuracao_relatorio  IN (47);


-- Auto-generated SQL script #202603171436
UPDATE basico.curriculo_basico
SET tipo_diario_diversificado = 31, possui_parte_diversificada = TRUE
WHERE id_curriculo_basico = 51880983;

--backup
UPDATE basico.curriculo_basico SET tipo_diario_diversificado = NULL, possui_parte_diversificada = FALSE WHERE id_curriculo_basico = 51880983;

51880983


/*51880990 BERÇÁRIO I

51896095 BERÇÁRIO I*/