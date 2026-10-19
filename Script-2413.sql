SELECT *
FROM escola.escola_etapa_ensino_serie
WHERE id_escola = 51870396
AND id_serie IN (1005218, 1005219, 1005220, 1005221, 1005222);

SELECT t.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE id_escola = 51870396
AND id_serie IN (1005218, 1005219, 1005220, 1005221, 1005222)
AND t.id_situacao_turma NOT IN (4);

SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%scola Municipal de Educação Básica Semeão Nunes%'
-- Auto-generated SQL script #202606020822

UPDATE escola.escola_etapa_ensino_serie
SET ativo = FALSE
WHERE id_escola_etapa_ensino_serie IN (51873136, 51873135, 51873137, 51873134, 51873133);
---=========================================================================

SELECT EXISTS ( SELECT 1
FROM escola.escola_etapa_ensino_serie eees
JOIN basico.serie s ON
s.id_serie = eees.id_serie
JOIN basico.turma_serie ts ON
ts.id_serie = s.id_serie
AND ts.id_escola = eees.id_escola
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.ativo
AND ts.ano IN ( SELECT ano
FROM basico.calendario_escolar
WHERE vigente
UNION SELECT ano
FROM matricula.calendario_matricula
WHERE vigente )
AND eees.id_escola_etapa_ensino_serie = 51873137
AND t.id_situacao_turma NOT IN (4) );



SELECT ts.*
FROM escola.escola_etapa_ensino_serie eees
JOIN basico.serie s ON
s.id_serie = eees.id_serie
JOIN basico.turma_serie ts ON
ts.id_serie = s.id_serie
AND ts.id_escola = eees.id_escola
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
WHERE ts.ativo
AND eees.id_escola_etapa_ensino_serie = 51873137





