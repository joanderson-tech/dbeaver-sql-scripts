SELECT DISTINCT  t.id_disciplina 
FROM ensino.turma t
WHERE t.id_turma_serie IN (51899431)
AND t.id_situacao_turma =1;


SELECT *
FROM ensino.turma
WHERE id_disciplina = 524
AND id_turma_serie = 51899431
AND id_situacao_turma = 1;


BEGIN;

ROLLBACK;