SELECT *
FROM basico.turma_serie ts
WHERE ts.permite_disciplina_contraturno = TRUE
AND ativo AND ts.ano = 2026;