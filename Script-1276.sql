SELECT  * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico = 51883942;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51883942;

UPDATE basico.curriculo_basico
SET
permite_multiplos_professores_polivalente = TRUE
WHERE id_curriculo_basico = 51883942;

UPDATE basico.curriculo_basico_componente
SET
permite_multiplos_professores = TRUE
WHERE id_curriculo_basico_componente IN (51883943, 51883944, 51883945, 51883946, 51883947, 51884818);

UPDATE basico.curriculo_basico_componente
SET
permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente IN (51883943, 51883944, 51883945, 51883946, 51883947);


SELECT t.* FROM ensino.turma t 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
WHERE ts.id_curriculo_medio = 51883942
AND ts.id_escola = 51880604
