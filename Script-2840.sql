BEGIN;
UPDATE basico.turma_serie SET ativo = TRUE WHERE id_turma_serie = 84831507;
UPDATE ensino.turma SET id_situacao_turma = 1 WHERE id_turma = 826788;
COMMIT;