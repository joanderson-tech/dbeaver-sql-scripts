SELECT * FROM basico.curriculo_basico cb WHERE cb.ano_entrada_vigor = 2026; 
SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo  = '012026'; 

SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico   = 57258580;

SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 57258580;

SELECT * FROM basico.curriculo_basico cb  WHERE cb.id_curriculo_basico IN (54093183);


SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico IN (54093183, 51869718);

SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico IN (54093183, 51869718);

SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (57075314, 57075315, 57075316);

--54093183, 51869718

-- Id 57075313 --nome 012026  57249265

-- Id 57258580 --nome PREIIe1AI]



54093183, 51869718




57075314

57075315


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio  IN (57075313);

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie IN (57075314, 57075315, 57075316);

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie_agrupadora IN (57075314);

SELECT * 
FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie = 57075314;

BEGIN;


UPDATE basico.turma_serie SET id_curriculo_medio=57258580	WHERE id_turma_serie=57075314;
UPDATE basico.turma_serie 	SET id_curriculo_medio=54093183, tipo_diario = 39	WHERE id_turma_serie=57075315;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=57258580	WHERE id_matricula_discente_serie IN (1340976, 1340983, 1340979, 1340980, 1340977, 1340981, 1340978, 1340982, 1340974, 1340975);

COMMIT;


--backup
UPDATE basico.turma_serie SET id_curriculo_medio = 57075313 WHERE id_turma_serie = 57075314;
UPDATE basico.turma_serie SET id_curriculo_medio = 57075304 , tipo_diario = 34 WHERE id_turma_serie = 57075315;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 57075313 WHERE id_matricula_discente_serie IN (1340976, 1340983, 1340979, 1340980, 1340977, 1340981, 1340978, 1340982, 1340974, 1340975);


ROLLBACK ;