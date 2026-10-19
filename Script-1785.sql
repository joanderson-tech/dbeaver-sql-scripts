BEGIN;


UPDATE basico.curriculo_basico 	SET id_turno=519283270 	WHERE id_curriculo_basico=35558311;
UPDATE basico.turma_serie SET id_turno=519283270 WHERE id_turma_serie IN (51878600, 51924842);


COMMIT;


ROLLBACK;