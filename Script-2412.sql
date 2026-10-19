SELECT *
FROM basico.turma_serie ts
WHERE ts.permite_disciplina_contraturno = TRUE
AND ativo AND ts.ano = 2026
AND ts.id_escola = 51870582;


SELECT *
FROM basico.turma_serie ts
WHERE ativo = TRUE
AND ts.ano = 2026
AND ts.permite_disciplina_contraturno = TRUE
AND ts.id_escola = 51870582;

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie = 	60184548;
