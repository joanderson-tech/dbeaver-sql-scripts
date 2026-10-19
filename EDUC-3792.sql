SELECT * FROM basico.curriculo_basico cb WHERE cb.ano_entrada_vigor = 2026; 
SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo  = '012026'; 

-- Id 57075313 --nome 012026

-- Id 57258580 --nome PREIIe1AI


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 57258580;

SELECT * 
FROM basico.matricula_estudante_serie mes WHERE mes.id_turma_serie = 57075314;

BEGIN;

--Solução
UPDATE basico.turma_serie SET id_curriculo_medio=57258580	WHERE id_turma_serie=57075314;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=57258580	WHERE id_matricula_discente_serie IN (1340976, 1340983, 1340979, 1340980, 1340977, 1340981, 1340978, 1340982, 1340974, 1340975);

COMMIT;
--backup
UPDATE basico.turma_serie SET id_curriculo_medio=57075313	WHERE id_turma_serie=57075314;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio=57075313	WHERE id_matricula_discente_serie IN (1340976, 1340983, 1340979, 1340980, 1340977, 1340981, 1340978, 1340982, 1340974, 1340975);


