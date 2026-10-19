BEGIN;

UPDATE basico.curriculo_basico SET permite_multiplos_professores_polivalente = true WHERE id_curriculo_basico IN (58381382, 58381388, 58381394);
UPDATE ensino.turma
SET permite_multiplos_professores = TRUE
WHERE id_disciplina = 220
AND codigo IN ('EICRINTN3A', 'EICRINTN3B', 'EICRINTN1A', 'EICRINTN1B', 'EICRINTN2B', 'EICRINTN2A' )
AND ano = 2026;

COMMIT;