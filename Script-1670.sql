WITH idadeAluno AS ( SELECT EXTRACT(YEAR FROM age('Tue Mar 31 00:00:00 GMT-03:00 2026', 'Sun Oct 09 21:00:00 GMT-03:00 2005')) AS idadeComCorte, EXTRACT(YEAR FROM age(current_date, 'Sun Oct 09 21:00:00 GMT-03:00 2005')) AS idadeSemCorte ), etapaPeriodo AS ( SELECT DISTINCT pnaee.id_etapa_ensino
FROM matricula.periodo_novos_alunos pna
JOIN matricula.periodo_novos_alunos_etapa_ensino pnaee ON
pnaee.id_periodo_novos_alunos = pna.id
WHERE pna.id_calendario_matricula = 51899707
AND current_date BETWEEN pna.data_inicio AND pna.data_fim ) SELECT DISTINCT nee.*
FROM matricula.vaga_serie vs
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = vs.id_calendario_matricula
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN escola.escola e ON
vs.id_escola = e.id_escola
JOIN comum.municipio mu ON
e.id_municipio = mu.id_municipio
JOIN basico.modalidade_ensino_basico meb ON
ee.id_modalidade = meb.id_modalidade_ensino_basico
JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
WHERE vs.removida IS FALSE
AND vs.id_calendario_matricula = 51899707
AND mu.id_municipio = :idMunicipio
AND (COALESCE((current_date BETWEEN cm.data_inicio_novos_alunos_nee AND cm.data_fim_novos_alunos_nee), FALSE)
	OR (ee.id_etapa_ensino IN (SELECT ep_sub.id_etapa_ensino
FROM etapaPeriodo ep_sub)))
AND ((SELECT idadeComCorte
FROM idadeAluno) >= 6
OR s.id_serie IN ( SELECT fes.id_serie
FROM basico.faixa_etaria_serie fes
WHERE( CASE WHEN fes.desconsiderar_data_corte THEN (SELECT idadeSemCorte
FROM idadeAluno)
ELSE (SELECT idadeComCorte
FROM idadeAluno) END ) BETWEEN fes.idade_minima AND fes.idade_maxima ))



 SELECT DISTINCT meb.*
FROM matricula.vaga_serie vs
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN escola.escola e ON
vs.id_escola = e.id_escola
JOIN comum.municipio mu ON
e.id_municipio = mu.id_municipio
JOIN basico.modalidade_ensino_basico meb ON
ee.id_modalidade = meb.id_modalidade_ensino_basico
WHERE vs.removida = FALSE
AND vs.vagas_validadas > 0
AND vs.id_calendario_matricula = :idCalendarioMatricula
AND mu.id_municipio = :idMunicipio