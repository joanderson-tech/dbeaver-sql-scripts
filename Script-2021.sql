WITH consulta_bruta AS (
    with pessoas_nee as (
select pne.id_pessoa, max(tne.quantidade_vaga) as quantidade_vaga
from comum.pessoa_necessidade_especial pne
join comum.tipo_necessidade_especial tne on
	tne.id_tipo_necessidade_especial = pne.id_necessidade_especial
where tne.ativo
group by
	pne.id_pessoa ), estudantes_nee as (
select eine.id_estudante_inscrito, max(tne.quantidade_vaga) as quantidade_vaga
from matricula.estudante_inscrito_necessidade_especial eine
join comum.tipo_necessidade_especial tne on
	tne.id_tipo_necessidade_especial = eine.id_tipo_necessidade
where tne.ativo
group by
	eine.id_estudante_inscrito )
select distinct *
from(
	select ee.denominacao as etapa, s.descricao as serie, t.descricao as turno, coalesce(rm.numero_renovacao, st.numero, ei.numero_inscricao) as num_solicitacao,mes.id_situacao_matricula_serie,mes.id_matricula_discente_serie,  tov.denominacao as tipo_ocupacao,eip.regra_processamento, p.nome as estudante, exists (
		select *
from pessoas_nee p_nee
where p_nee.id_pessoa = p.id_pessoa) as nee,(
		select coalesce(max(p_nee.quantidade_vaga), 1)
from pessoas_nee p_nee
where p_nee.id_pessoa = p.id_pessoa ) as qtd_vaga, vs.vagas_validadas, cm.data_inicio_remanescentes, cm.prazo_validade_vaga_concedida, 'EFETIVADO' as situacao_efetivacao, vs.id_vaga_serie, tov.id_tipo_ocupacao_vaga, vs.periodo, p.data_nascimento, d.id_discente
from basico.matricula_estudante_serie mes
join matricula.calendario_matricula cm on		cm.ano = mes.ano_calendario
join discente d on		d.id_discente = mes.id_estudante
join comum.pessoa p on		p.id_pessoa = d.id_pessoa
join escola.escola_etapa_ensino_serie eees on		eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join matricula.vaga_serie vs on		vs.id_calendario_matricula = cm.id_calendario_matricula
and vs.ano_letivo = cm.ano
and vs.vagas_validadas > 0
and vs.id_escola = eees.id_escola
and vs.id_serie = eees.id_serie
and vs.id_turno = mes.id_turno
and vs.periodo = mes.periodo
join basico.serie s on 		s.id_serie = vs.id_serie
join basico.etapa_ensino ee on		ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno t on		t.id_turno = vs.id_turno
left join matricula.estudante_inscrito ei on		ei.id_estudante = mes.id_estudante
and ei.id_calendario_matricula = cm.id_calendario_matricula
and id_status not in (5, 8, 13)
left join matricula.estudante_inscrito_processamento eip on		eip.id_estudante_inscrito = ei.id_estudante_inscrito
	and eip.id_status not in(5, 8, 13)
left join matricula.estudante_inscrito_opcao_escola eioe on			eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
		and eioe.id_vaga_serie = vs.id_vaga_serie
	left join matricula.listagem_processamento_matricula lpm on				lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
		and eioe.id_estudante_inscrito_opcao_escola is not null
	left join matricula.renovacao_matricula rm on
				rm.id_nova_serie = mes.id_matricula_discente_serie
		and rm.id_calendario_matricula = cm.id_calendario_matricula
		and id_registro_cancelamento is null
	left join matricula.renovacao_matricula_resultado rmr on
				rmr.id_renovacao_matricula = rm.id_renovacao_matricula
	left join matricula.listagem_processamento_renovacao_matricula lpr on
				lpr.id_listagem_processamento_renovacao_matricula = rmr.id_listagem_processamento_renovacao_matricula
	left join matricula.solicitacao_transferencia st on
				st.id_matricula_discente_serie_gerado = mes.id_matricula_discente_serie
		and st.id_calendario_matricula = cm.id_calendario_matricula
		and st.id_status <> 6
	left join matricula.solicitacao_transferencia_processamento stp on
				stp.id_solicitacao_transferencia = st.id_solicitacao_transferencia
	left join matricula.listagem_solicitacao_transferencia_processamento lstp on
				lstp.id_listagem_solicitacao_transferencia_processamento = stp.id_listagem_solicitacao_transferencia_processamento
	left join matricula.tipo_ocupacao_vaga tov on
				tov.id_tipo_ocupacao_vaga = coalesce(lpr.id_tipo_ocupacao_vaga, lstp.id_tipo_ocupacao_vaga, lpm.id_tipo_ocupacao_vaga)
			or tov.id_tipo_ocupacao_vaga = case
						when rm.id_renovacao_matricula is not null then 2
					end
		where mes.id_situacao_matricula_serie not in (4, 5, 6, 9, 12)
				and vs.id_escola = 52232851
				and cm.ano = 2026
				and vs.removida = false
				--and mes.id_estudante = 1446009
				and not exists (
						select 1
			from matricula.operacao_vaga_serie ope
			where ope.id_vaga_serie = vs.id_vaga_serie
				and tipo = 'EXCLUÍDA')    
		  ) as result
order by
	etapa, serie, turno, periodo, tipo_ocupacao, estudante, situacao_efetivacao
),
dados_limpos AS (
    SELECT DISTINCT ON (id_discente) *
    FROM consulta_bruta
)
SELECT * FROM dados_limpos
ORDER BY etapa, serie, turno, periodo, tipo_ocupacao, estudante, situacao_efetivacao;