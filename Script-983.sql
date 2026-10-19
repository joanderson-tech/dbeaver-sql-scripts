  with ultima_data_movimentacao as (
select
	mee.id_matricula_estudante_serie,
	max(coalesce(mee.data_solicitacao, mee.data)) as ultima_data,
	mes.id_estudante
from
	matricula.movimentacao_estudante_escola mee
join basico.matricula_estudante_serie mes on
	mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
where
	mee.ativo
	and mee.id_tipo_sol_transferencia in (3, 5)
	and mee."data" <= :dataSelecionada
group by
	mes.id_estudante,
	mee.id_matricula_estudante_serie )
select
	distinct discente.id_discente,
	discente.matricula,
	mes.id_matricula_discente_serie,
	(cast(to_char(mes.data_cadastro, 'yyyy-mm-dd') as DATE) + interval '0 hours') as data_cadastro,
	(cast(to_char(mes.data_matricula_turma, 'yyyy-mm-dd') as DATE) + interval '0 hours') as data_matricula_turma,
	pessoa.id_pessoa,
	pessoa.nome,
	(
	select
		count(*) > 0
	from
		comum.pessoa_necessidade_especial pne
	where
		pne.id_pessoa = pessoa.id_pessoa) as nee,
	mes.num_chamada,
	estudante.participa_bolsa_familia,
	mes.id_situacao_matricula_serie,
	case
		when mes.id_situacao_matricula_serie not in ( 2, 3, 1, 7, 8, 10,-1 ) then (cast(to_char(st.data_solicitacao, 'yyyy-mm-dd') as DATE) + interval '0 hours')
		else null
	end as data_solicitacao,
	case
		when mes.id_situacao_matricula_serie not in ( 2, 3, 1, 7, 8, 10,-1 ) then coalesce(mee_interna.ultima_data, mee_externa.ultima_data) + interval '0 hours'
		else null
	end as data_transferencia
from
	ensino.matricula_componente mc
join ensino.turma t
		using (id_turma)
join basico.turma_serie ts
		using (id_turma_serie)
join basico.serie s
		using(id_serie)
join basico.matricula_estudante_serie mes on
	mes.id_estudante = mc.id_discente
	and ( (mes.id_turma_serie = ts.id_turma_serie
		and s.tipo_diario <> 16 )
	or s.tipo_diario = 16 )
left join (
	select
		st_sub.id_matricula_discente_serie,
		min(data_solicitacao) as data_solicitacao
	from
		matricula.solicitacao_transferencia st_sub
	where
		st_sub.id_status = 4
	group by
		st_sub.id_matricula_discente_serie ) st on
	st.id_matricula_discente_serie = mes.id_matricula_discente_serie
left join (
	select
		mee.id_matricula_estudante_serie,
		min(coalesce(mee.data_solicitacao, mee.data)) as ultima_data
	from
		matricula.movimentacao_estudante_escola mee
	where
		mee.ativo
		and mee.id_tipo_sol_transferencia in (1)
			and mee."data" <= :dataSelecionada
		group by
			mee.id_matricula_estudante_serie) as mee_interna on
	mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	and mes.id_situacao_matricula_serie = 6
left join (
	select
		max(udm.id_matricula_estudante_serie) as id_matricula_estudante_serie,
		udm.ultima_data
	from
		ultima_data_movimentacao udm
	group by
		udm.id_estudante,
		udm.ultima_data ) as mee_externa on
	mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	and mes.id_situacao_matricula_serie = 6
join public.discente discente on
	discente.id_discente = mc.id_discente
join basico.estudante estudante on
	estudante.id_estudante = discente.id_discente
join comum.pessoa pessoa on
	pessoa.id_pessoa = discente.id_pessoa
where
	mc.id_turma = :idTurma
	and mc.ano = :ano
	and mc.id_situacao_matricula in ( 5, 6, 2, 8, 4, 9 )
	and mes.ano_calendario = :ano
	and (mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
		and mes.id_matricula_discente_serie not in (
		select
			mes_t.id_matricula_discente_serie
		from
			basico.matricula_estudante_serie mes_t
		left join matricula.solicitacao_transferencia st_t on
			st_t.id_matricula_discente_serie = mes_t.id_matricula_discente_serie
		left join matricula.movimentacao_estudante_escola mee_t on
			mee_t.id_matricula_estudante_serie = mes_t.id_matricula_discente_serie
		where
			mes_t.id_situacao_matricula_serie = 6
			and mes_t.ano_calendario = :ano
			and mes_t.id_turma_serie is not null
			and (st_t.data_solicitacao <= :dataSelecionada
				or mee_t.data_solicitacao <= :dataSelecionada) )
		or (mes.id_situacao_matricula_serie = 4
			and (
			select
				max(me.data_ocorrencia)
			from
				basico.movimentacao_estudante me
			where
				me.id_discente = mc.id_discente
				and me.ativo
				and me.id_tipo_movimentacao_estudante = 3
				and ano_escolar = :ano
			group by
				me.id_discente ) >= :dataSelecionada)
		or (mes.id_situacao_matricula_serie = 6
			and coalesce(st.data_solicitacao, mee_externa.ultima_data) is not null
				and not exists (
				select
					1
				from
					basico.matricula_estudante_serie mes2
				where
					mes2.id_estudante = mes.id_estudante
					and mes2.id_turma_serie = mes.id_turma_serie
					and mes2.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 ) )) )
order by
	mes.num_chamada,
	pessoa.nome asc