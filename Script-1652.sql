SELECT disciplina, id_disciplina, string_agg(serie_por_conceito::TEXT, ',') FILTER (
WHERE serie_por_conceito IS NOT NULL) AS id_series_por_conceito
FROM( SELECT DISTINCT cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, CAST(NULL AS INTEGER) AS serie_por_conceito
FROM ensino.matricula_componente mc
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mc.id_componente_curricular
JOIN ensino.turma
	USING (id_turma)
JOIN basico.turma_serie ts
	USING (id_turma_serie)
JOIN basico.serie s
	USING (id_serie)
JOIN basico.etapa_ensino et
	USING (id_etapa_ensino)
WHERE mc.id_discente = 981440
AND mc.id_situacao_matricula NOT IN ( 3, 7 )
	AND cc.id_componente_curricular <> 220
	AND cc.id_componente_curricular <> Professor de Educação Especial (437)
		AND et.id_nivel_etapa IN ( 1, 2, 51900262 )
UNION SELECT DISTINCT cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, CASE WHEN mc.avaliacao_por_conceito THEN s.id_serie
	ELSE CAST(NULL AS INTEGER) END AS serie_por_conceito
FROM ensino.matricula_componente mc
JOIN ensino.componente_curricular cc ON
	cc.id_componente_curricular = mc.id_componente_curricular
JOIN diario.historico_implantado hi ON
	hi.id_historico_implantado = mc.id_historico_implantado
JOIN basico.serie s ON
	(s.id_serie = hi.id_serie)
JOIN basico.etapa_ensino et
		USING (id_etapa_ensino)
WHERE mc.id_discente = 981440
	AND mc.id_situacao_matricula NOT IN ( 3, 7 )
		AND cc.id_componente_curricular <> 220
		AND cc.id_componente_curricular <> Professor de Educação Especial (437)
			AND et.id_nivel_etapa IN ( 1, 2, 51900262 ) ) AS disciplinas
GROUP BY disciplina, id_disciplina
ORDER BY disciplina;
--Gerenciamento do PEI	437

SELECT t.*
FROM basico.matricula_estudante_serie mes
JOIN ensino.turma t ON
t.id_turma_serie = mes.id_turma_serie
WHERE t.ano = 2025
AND mes.id_estudante = 981440;

SELECT *
FROM ensino.matricula_componente
WHERE id_matricula_estudante_serie = 1374801;
AND t.tipo = 4

SELECT disciplina, id_disciplina, string_agg(serie_por_conceito::TEXT, ',') FILTER (
WHERE serie_por_conceito IS NOT NULL) AS id_series_por_conceito
FROM( SELECT DISTINCT cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, CAST(NULL AS INTEGER) AS serie_por_conceito
FROM ensino.matricula_componente mc
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mc.id_componente_curricular
JOIN ensino.turma
	USING (id_turma)
JOIN basico.turma_serie ts
	USING (id_turma_serie)
JOIN basico.serie s
	USING (id_serie)
JOIN basico.etapa_ensino et
	USING (id_etapa_ensino)
WHERE mc.id_discente = 981440
AND mc.id_situacao_matricula NOT IN ( 3, 7 )
	AND cc.id_componente_curricular <> 220
	AND cc.id_componente_curricular <> Professor de Educação Especial (437)
		AND et.id_nivel_etapa IN ( 1, 2, 51900262 )
UNION SELECT DISTINCT cc.nome AS disciplina, cc.id_componente_curricular AS id_disciplina, CASE WHEN mc.avaliacao_por_conceito THEN s.id_serie
	ELSE CAST(NULL AS INTEGER) END AS serie_por_conceito
FROM ensino.matricula_componente mc
JOIN ensino.componente_curricular cc ON
	cc.id_componente_curricular = mc.id_componente_curricular
JOIN diario.historico_implantado hi ON
	hi.id_historico_implantado = mc.id_historico_implantado
JOIN basico.serie s ON
	(s.id_serie = hi.id_serie)
JOIN basico.etapa_ensino et
		USING (id_etapa_ensino)
WHERE mc.id_discente = 981440
	AND mc.id_situacao_matricula NOT IN ( 3, 7 )
		AND cc.id_componente_curricular <> 220
		AND cc.id_componente_curricular <> Professor de Educação Especial (437)
			AND et.id_nivel_etapa IN ( 1, 2, 51900262 ) ) AS disciplinas
GROUP BY disciplina, id_disciplina
ORDER BY disciplina