SELECT vs.vagas_validadas >
			( SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )), 0 )
			FROM matricula.renovacao_matricula r
			JOIN public.discente d ON
			d.id_discente = r.id_discente
			WHERE r.id_vaga_serie = vs.id_vaga_serie
			AND r.data_cancelamento IS NULL
			AND r.id_nova_serie IS NULL ) 
			--
			+ ( SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa )), 0 )
			FROM matricula.solicitacao_transferencia st
			INNER JOIN matricula.solicitacao_transferencia_opcao_escola topcao ON
			topcao.id_solicitacao = st.id_solicitacao_transferencia
			JOIN basico.matricula_estudante_serie mes ON
			mes.id_matricula_discente_serie = st.id_matricula_discente_serie
			JOIN public.discente d ON
			d.id_discente = mes.id_estudante
			WHERE st.id_status IN ( 2, 4, 8 )
				AND topcao.ordem = 1
				AND st.id_calendario_matricula = vs.id_calendario_matricula
				AND topcao.id_escola = vs.id_escola
				AND topcao.id_serie = vs.id_serie
				AND topcao.id_turno = vs.id_turno
				AND st.id_matricula_discente_serie_gerado IS NULL ) 
			--
			+ ( SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM matricula.estudante_inscrito_necessidade_especial eine JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade WHERE eine.id_estudante_inscrito = ei.id_estudante_inscrito )), 0 )
		FROM matricula.estudante_inscrito ei
		INNER JOIN matricula.estudante_inscrito_opcao_escola iopcao ON
		iopcao.id_estudante_inscrito = ei.id_estudante_inscrito
		INNER JOIN matricula.estudante_inscrito_processamento eip ON
		eip.id_estudante_inscrito = ei.id_estudante_inscrito
		AND eip.id_opcao_escola = iopcao.id_estudante_inscrito_opcao_escola
		WHERE iopcao.id_vaga_serie = vs.id_vaga_serie
		AND iopcao.ordem = 1
		AND ( ei.id_estudante = 0
			OR ei.id_estudante IS NULL )
		AND ei.id_status IN ( 1, 4, 6, 7 )
			AND eip.id_status IN ( 1, 4, 6, 7 ) ) 
			---
		+ ( SELECT COALESCE( sum(( SELECT COALESCE(max(tne.quantidade_vaga), 1) FROM comum.pessoa_necessidade_especial pne JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = pne.id_necessidade_especial WHERE pne.id_pessoa = d.id_pessoa)), 0 )
		FROM basico.matricula_estudante_serie mes
		INNER JOIN escola.escola_etapa_ensino_serie eees ON
		eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
		JOIN public.discente d ON
		d.id_discente = mes.id_estudante
		WHERE mes.id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 10, 11, 12 )
			AND mes.id_turno = vs.id_turno
			AND eees.id_escola = vs.id_escola
			AND eees.id_serie = vs.id_serie
			AND mes.ano_calendario = cm.ano
			AND mes.periodo = vs.periodo ) - 0
FROM matricula.vaga_serie vs
INNER JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = vs.id_calendario_matricula
WHERE vs.id_vaga_serie =  52346689;