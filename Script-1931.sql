BEGIN;

UPDATE ensino.turma SET id_situacao_turma = 4 WHERE id_turma IN (686584, 686582, 686583);
UPDATE ensino.matricula_componente
	SET id_situacao_matricula=7
	WHERE id_matricula_componente IN (17089876,17089880,17089873,17089879,17089872,17089874,17089875,17089877,17089878);


COMMIT;


SELECT id_turma_serie, * FROM  ensino.turma WHERE id_turma_serie  IN (52285581);