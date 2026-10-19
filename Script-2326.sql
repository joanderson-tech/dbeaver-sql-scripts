SELECT *
FROM basico.turma_serie ts
JOIN basico.serie s ON s.id_serie = ts.id_serie AND s.multisseriada 
WHERE ts.tipo_diario = 11
AND ts.ano = 2026
AND s.ativo


SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie  = 84521969 OR ts.id_turma_serie_agrupadora = 84521969;


SELECT *
FROM ensino.turma t
WHERE t.id_turma_serie IN (84521969, 84521970, 84521971);
