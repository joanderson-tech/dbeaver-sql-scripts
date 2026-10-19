BEGIN;

UPDATE basico.curriculo_basico cb
SET possui_parte_diversificada = FALSE,
	tipo_diario_diversificado = NULL
WHERE id_curriculo_basico IN (55456437,55456487,55456462,55456412);


COMMIT;