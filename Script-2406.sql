SELECT EXISTS ( SELECT 1
FROM escola.escola_etapa_ensino_serie eees
JOIN basico.serie s ON
s.id_serie = eees.id_serie
JOIN basico.turma_serie ts ON
ts.id_serie = s.id_serie
AND ts.id_escola = eees.id_escola
JOIN ensino.turma t ON 
t.id_turma_serie = ts.id_turma_serie
WHERE ts.ativo
AND ts.ano IN ( SELECT ano
FROM basico.calendario_escolar
WHERE vigente
UNION SELECT ano
FROM matricula.calendario_matricula
WHERE vigente )
AND eees.id_escola_etapa_ensino_serie = 51873136
AND t.id_situacao_turma NOT IN (4) )



SELECT ts
FROM escola.escola_etapa_ensino_serie eees
JOIN basico.serie s ON
s.id_serie = eees.id_serie
JOIN basico.turma_serie ts ON
ts.id_serie = s.id_serie
AND ts.id_escola = eees.id_escola
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
WHERE ts.ativo
AND eees.id_escola_etapa_ensino_serie = 51873136;

SELECT EXISTS (SELECT 1
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON
vs.id_escola = eees.id_escola
AND eees.id_serie = vs.id_serie
WHERE vs.removida = FALSE
AND vs.vagas_validadas > 0
AND vs.ano_letivo IN ( SELECT ano
FROM basico.calendario_escolar
WHERE vigente
UNION SELECT ano
FROM matricula.calendario_matricula
WHERE vigente )
AND vs.vagas_ocupadas > 0
AND eees.id_escola_etapa_ensino_serie = 51873136);



SELECT vs
FROM escola.escola_etapa_ensino_serie eees
JOIN matricula.vaga_serie vs ON
vs.id_escola = eees.id_escola
AND eees.id_serie = vs.id_serie
WHERE vs.removida = FALSE
AND vs.vagas_validadas > 0
AND eees.id_escola_etapa_ensino_serie = 51873136;

AND vs.ano_letivo 
