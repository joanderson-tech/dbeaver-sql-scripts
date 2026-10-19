WITH ultima_data_movimentacao AS ( SELECT mee.id_matricula_estudante_serie, max(COALESCE(mee.DATA, mee.data_solicitacao)) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
WHERE mee.ativo
AND mee.id_tipo_sol_transferencia IN (3, 5)
GROUP BY mes.id_estudante, mee.id_matricula_estudante_serie ), matriculas_dispensa_unidade AS ( SELECT DISTINCT sde.id_matricula_estudante_serie, sdeu.unidade
FROM ensino.turma t
JOIN basico.matricula_estudante_serie mes ON
t.id_turma = 682960
AND t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
JOIN ensino.solicitacao_dispensa_estudante sde ON
sde.ativo
	AND sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON
	sdec.ativo
	AND sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON
	sdeu.ativo
	AND sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
WHERE sdec.id_componente_curricular = t.id_disciplina
	AND mes.id_situacao_matricula_serie <> 7
	AND sde.id_status_solicitacao_dispensa_estudante = 2 ) SELECT DISTINCT results.*
FROM( SELECT DISTINCT d.matricula, p.nome, CAST (EXTRACT ('day'
FROM f."data") AS integer) AS dia, CAST(EXTRACT ('month' FROM f."data") AS integer) AS mes, f.frequencia, f.id_frequencia, f.abonada, FALSE AS alterado, 0 AS maxFaltas, d.id_discente, f."data" AS data_frequencia, CASE WHEN m.id_situacao_matricula = 3 THEN TRUE
ELSE FALSE END AS situacao, mes.id_matricula_discente_serie, CASE WHEN aet.data_entrada_escola IS NOT NULL THEN (CAST(to_char(aet.data_entrada_escola, 'yyyy-mm-dd') AS DATE))
WHEN mes.data_matricula_turma IS NOT NULL THEN (CAST(to_char(mes.data_matricula_turma, 'yyyy-mm-dd') AS DATE))
ELSE (CAST(to_char(mes.data_cadastro, 'yyyy-mm-dd') AS DATE)) END AS data_matricula_turma, CASE WHEN st.id_status = 4 THEN TRUE
WHEN mee_externa.ultima_data IS NOT NULL THEN TRUE
ELSE FALSE END AS transferido,(f.id_event_log IS NOT NULL) AS reconhecimento_facial, CASE WHEN mes.id_situacao_matricula_serie NOT IN ( 2, 3, 1, 7, 8, 10,-1 ) 
THEN COALESCE(mee_interna.ultima_data, st.data_solicitacao, mee_externa.ultima_data)
ELSE NULL END AS data_transferencia, mes.id_situacao_matricula_serie, date((SELECT max(me.data_ocorrencia) FROM basico.movimentacao_estudante me WHERE me.id_discente = mes.id_estudante AND me.ativo AND me.id_tipo_movimentacao_estudante = 3 AND me.ano_escolar = mes.ano_calendario)) AS data_abandono,(SELECT count(*) > 0
FROM comum.pessoa_necessidade_especial pne
WHERE pne.id_pessoa = p.id_pessoa) AS nee
FROM discente d
JOIN ensino.matricula_componente m ON
m.id_discente = d.id_discente
AND m.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 9 )
JOIN ensino.turma t
	USING (id_turma)
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
	AND mes.id_turma_serie = t.id_turma_serie
JOIN comum.pessoa p
		USING (id_pessoa)
LEFT JOIN ensino.avaliacao_estudante_transferido aet ON
	aet.id_matricula_estudante_serie = mes.id_matricula_discente_serie
LEFT JOIN ensino.frequencia_aluno f ON
	f.id_discente = d.id_discente
		AND f.id_turma = 682960
		AND f.ativo
		AND f.data BETWEEN '2026-01-08' AND '2026-01-08'
	LEFT JOIN matricula.solicitacao_transferencia st ON
		(st.id_matricula_discente_serie = mes.id_matricula_discente_serie
			AND st.id_status = 4)
	LEFT JOIN ( SELECT mee.id_matricula_estudante_serie, min(COALESCE(mee.DATA, mee.data_solicitacao)) AS ultima_data
	FROM matricula.movimentacao_estudante_escola mee
	WHERE mee.ativo
		AND mee.id_tipo_sol_transferencia IN (1)
	GROUP BY mee.id_matricula_estudante_serie ) AS mee_interna ON
		mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		AND mes.id_situacao_matricula_serie = 6
	LEFT JOIN ultima_data_movimentacao AS mee_externa ON
		mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		AND mes.id_situacao_matricula_serie = 6
	LEFT JOIN matriculas_dispensa_unidade mdu ON
		mdu.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		AND mdu.unidade = 1
	WHERE m.id_turma = 682960
		AND mdu.id_matricula_estudante_serie IS NULL
		AND (m.nao_optou IS FALSE
			OR m.nao_optou IS NULL) ) results
JOIN ( SELECT DISTINCT mes.id_matricula_discente_serie
FROM basico.matricula_estudante_serie mes
LEFT JOIN matricula.solicitacao_transferencia st ON
(st.id_matricula_discente_serie = mes.id_matricula_discente_serie
	AND st.id_status = 4)
LEFT JOIN ( SELECT mee.id_matricula_estudante_serie, min(COALESCE(mee.data)) AS ultima_data
FROM matricula.movimentacao_estudante_escola mee
WHERE mee.ativo
AND mee.id_tipo_sol_transferencia IN (1)
GROUP BY mee.id_matricula_estudante_serie ) AS mee_interna ON
mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
LEFT JOIN ultima_data_movimentacao AS mee_externa ON
mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
LEFT JOIN ( SELECT max(udm.id_matricula_estudante_serie) AS id_matricula_estudante_serie, udm.ultima_data
FROM ultima_data_movimentacao udm
GROUP BY udm.id_estudante, udm.ultima_data ) AS um ON
um.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
JOIN ensino.turma t
	USING (id_turma_serie)
WHERE t.id_turma = 682960
AND (mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
	OR (mes.id_situacao_matricula_serie = 6
		AND COALESCE(st.data_solicitacao, um.ultima_data) IS NOT NULL
			OR (mes.id_situacao_matricula_serie = 4
				AND (SELECT count(*)
			FROM basico.movimentacao_estudante me
			WHERE me.id_discente = mes.id_estudante
				AND me.ativo
				AND me.id_tipo_movimentacao_estudante = 3
				AND me.ano_escolar = mes.ano_calendario) > 0))) ) mess ON
(results.id_matricula_discente_serie = mess.id_matricula_discente_serie)
WHERE id_situacao_matricula_serie <> 6
OR (id_situacao_matricula_serie = 6
	AND data_transferencia > '2026-01-08')
ORDER BY results.nome, results.id_discente, results.data_frequencia, results.data_matricula_turma;



SELECT * FROM matricula.solicitacao_transferencia st; WHERE st.id_matricula_discente_serie = 1322804;

SELECT * FROM matricula.movimentacao_estudante_escola WHERE id_matricula_estudante_serie = 1322804;



-- Auto-generated SQL script #202604291026
UPDATE matricula.movimentacao_estudante_escola 	SET data_solicitacao='2026-01-08'	WHERE id_movimentacao_estudante_escola=51915384;

2026-05-02
