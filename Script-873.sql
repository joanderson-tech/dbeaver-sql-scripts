WITH ultima_data_movimentacao AS ( 
	SELECT 
		mee.id_matricula_estudante_serie, 
		max(COALESCE(mee.data_solicitacao, mee."data")) AS ultima_data, 
		mes.id_estudante 
	FROM matricula.movimentacao_estudante_escola mee 
	JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie 
	WHERE mee.ativo 
	AND mee.id_tipo_sol_transferencia IN (3, 5) 
	AND mee."data" <= :dataRelatorio 
	GROUP BY mes.id_estudante, mee.id_matricula_estudante_serie  
), 
estudantes_matriculados AS ( 
	SELECT 
		DISTINCT  
		mes.id_matricula_discente_serie, 
		mes.id_turma_serie 
	FROM basico.matricula_estudante_serie mes 
	LEFT JOIN ( 
		SELECT 
			st_sub.id_matricula_discente_serie, 
			min(data_solicitacao) AS data_solicitacao 
		FROM matricula.solicitacao_transferencia st_sub 
		WHERE st_sub.id_status = 4   
		GROUP BY st_sub.id_matricula_discente_serie  
	) st ON st.id_matricula_discente_serie = mes.id_matricula_discente_serie 
	LEFT JOIN ( 
		SELECT 
			mee.id_matricula_estudante_serie, 
			min(COALESCE(mee.data_solicitacao, mee.data)) AS ultima_data 
		FROM matricula.movimentacao_estudante_escola mee 
		WHERE mee.ativo 
			AND mee.id_tipo_sol_transferencia IN ( 1 ) 
			AND mee."data" <= :dataRelatorio
			GROUP BY mee.id_matricula_estudante_serie 
	) AS mee_interna ON mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
		AND mes.id_situacao_matricula_serie = 6  
	LEFT JOIN ( 
		SELECT 
			max(udm.id_matricula_estudante_serie) AS id_matricula_estudante_serie, 
			udm.ultima_data 
		FROM ultima_data_movimentacao udm 
		GROUP BY udm.id_estudante, udm.ultima_data  
	) AS mee_externa ON mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
		AND mes.id_situacao_matricula_serie = 6   
	LEFT JOIN ( 
		SELECT 
			mes_t.id_estudante, 
			(CAST(to_char(COALESCE(mes_t.data_matricula_turma, mes_t.data_cadastro), 'yyyy-mm-dd') AS date) + INTERVAL '0 hours') AS data_matricula, 
			mes_t.id_turma_serie, 
			mes_t.id_serie_escola 
		FROM basico.matricula_estudante_serie mes_t 
		LEFT JOIN matricula.solicitacao_transferencia st_t ON st_t.id_matricula_discente_serie = mes_t.id_matricula_discente_serie 
		LEFT JOIN matricula.movimentacao_estudante_escola mee_t ON mee_t.id_matricula_estudante_serie = mes_t.id_matricula_discente_serie 
		WHERE mes_t.id_situacao_matricula_serie = 6
		AND (mes_t.ano_calendario = 2025)-- or mes_t.ano_calendario = 2024)
		AND mes_t.id_turma_serie IS NOT NULL 
		AND (st_t.data_analise > :dataRelatorio OR mee_t."data" > :dataRelatorio)  
	) AS mes_transf_volta ON mes_transf_volta.id_estudante = mes.id_estudante 
		AND mes_transf_volta.id_turma_serie = mes.id_turma_serie 
		AND mes_transf_volta.id_serie_escola = mes.id_serie_escola 
	WHERE (mes.ano_calendario = 2025)-- or mes.ano_calendario = 2024)   
	AND mes.id_turma_serie IS NOT NULL 
	AND mes.id_situacao_matricula_serie IN (1, 2, 3, 6, 7, 8, 10)
	AND COALESCE(to_char(mes.data_matricula_turma, 'yyyy-mm-dd'), to_char(mes.data_cadastro, 'yyyy-mm-dd')) <= :dataRelatorio
	AND NOT ( 
		COALESCE(to_char(mes.data_matricula_turma, 'yyyy-mm-dd'), to_char(mes.data_cadastro, 'yyyy-mm-dd')) <= :dataRelatorio
		AND  
		(COALESCE(to_char(mee_interna.ultima_data, 'yyyy-mm-dd'), to_char(mee_externa.ultima_data, 'yyyy-mm-dd')) IS NOT NULL 
			AND COALESCE(to_char(mee_interna.ultima_data, 'yyyy-mm-dd'), to_char(mee_externa.ultima_data, 'yyyy-mm-dd')) <= :dataRelatorio)
	)
) 
SELECT 
e.nome as "Escola",
count(em) as "24/07/2025"
FROM estudantes_matriculados em 
JOIN basico.matricula_estudante_serie mes ON em.id_matricula_discente_serie = mes.id_matricula_discente_serie
JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
JOIN escola.escola e ON e.id_escola = eees.id_escola
group by e.nome
ORDER BY e.nome;