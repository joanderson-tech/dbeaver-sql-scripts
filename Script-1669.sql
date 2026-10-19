WITH idadeAluno AS ( SELECT EXTRACT(YEAR FROM age('Tue Mar 31 00:00:00 GMT-03:00 2026', 'Mon Oct 10 21:00:00 GMT-03:00 2005')) AS idadeComCorte, EXTRACT(YEAR FROM age(current_date, 'Mon Oct 10 21:00:00 GMT-03:00 2005')) AS idadeSemCorte ), etapaPeriodo AS ( SELECT DISTINCT pnaee.id_etapa_ensino
FROM matricula.periodo_novos_alunos pna
JOIN matricula.periodo_novos_alunos_etapa_ensino pnaee ON
pnaee.id_periodo_novos_alunos = pna.id
WHERE pna.id_calendario_matricula = ?
AND current_date BETWEEN pna.data_inicio AND pna.data_fim ) SELECT DISTINCT s.id_serie AS idSerie, s.descricao AS serie, ee.denominacao AS etapa_ensino,(UPPER(s.descricao || ' - ' || ee.denominacao)) AS serieEtapa, fes.id_faixa_etaria_serie AS idFaixaEtaria, fes.idade_minima AS idadeMinima, fes.idade_maxima AS idadeMaxima, fes.idade_limite_distorcao AS idadeLimiteDistorcao, fes.idade_minima_conclusao AS idadeMinimaConclusao, COALESCE(fes.valida_idade_minima, FALSE) AS validaIdadeMinima, COALESCE(fes.valida_idade_maxima, FALSE) AS validaIdadeMaxima, ee.id_etapa_ensino
FROM matricula.vaga_serie vs
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = vs.id_calendario_matricula
JOIN ensino.turno tu ON
tu.id_turno = vs.id_turno
JOIN escola.escola e ON
e.id_escola = vs.id_escola
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN basico.modalidade_ensino_basico me ON
me.id_modalidade_ensino_basico = ee.id_modalidade
JOIN basico.nivel_etapa_ensino ne ON
ne.id_nivel_etapa_ensino = ee.id_nivel_etapa
JOIN matricula.matricula_unidade_escolar mue ON
mue.id_unidade_escolar = e.id_escola
AND mue.id_calendario_matricula = vs.id_calendario_matricula
JOIN comum.municipio m ON
m.id_municipio = e.id_municipio
LEFT JOIN basico.faixa_etaria_serie fes ON
fes.id_serie = s.id_serie
LEFT JOIN escola.bairro_escola be ON
be.id_bairro_escola = e.id_bairro_escola
WHERE vs.id_calendario_matricula = ?
AND vs.vagas_validadas > 0
AND vs.removida IS FALSE
AND ee.id_nivel_etapa = ?
AND ee.id_etapa_ensino = ?
AND m.id_municipio = ?
AND s.descricao NOT ILIKE '%(EE)%'
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
ORDER BY ee.id_etapa_ensino, s.descricao