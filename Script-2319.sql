BEGIN;
-- FEVEREIRO
UPDATE ensino.frequencia_turma SET ativo = false WHERE id_turma = 738263 AND "data" IN ('2026-02-10', '2026-02-11', '2026-02-12', '2026-02-13', '2026-02-19', '2026-02-20', '2026-02-24', '2026-02-25', '2026-02-26', '2026-02-27');
UPDATE ensino.frequencia_aluno SET ativo = false WHERE id_turma = 738263 AND "data" IN ('2026-02-10', '2026-02-11', '2026-02-12', '2026-02-13', '2026-02-19', '2026-02-20', '2026-02-24', '2026-02-25', '2026-02-26', '2026-02-27');
-- MARÇO
UPDATE ensino.frequencia_turma SET ativo = false WHERE id_turma = 738263 AND "data" = '2026-03-03';
UPDATE ensino.frequencia_aluno SET ativo = false WHERE id_turma = 738263 AND "data" = '2026-03-03';
COMMIT;