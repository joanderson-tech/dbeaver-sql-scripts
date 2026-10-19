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
group by
	mes.id_estudante,
	mee.id_matricula_estudante_serie ),
matriculas_dispensa_unidade as (
select
	distinct sde.id_matricula_estudante_serie,
	sdeu.unidade
from
	ensino.turma t
join basico.matricula_estudante_serie mes on
	t.id_turma = 688217
	and t.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
	mes.id_turma_serie)
join ensino.solicitacao_dispensa_estudante sde on
	sde.ativo
		and sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	join ensino.solicitacao_dispensa_estudante_componente sdec on
		sdec.ativo
		and sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
	join ensino.solicitacao_dispensa_estudante_unidade sdeu on
		sdeu.ativo
		and sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
	where
		sdec.id_componente_curricular = t.id_disciplina
		and mes.id_situacao_matricula_serie <> 7
		and sde.id_status_solicitacao_dispensa_estudante = 2)
select
	distinct results.*
from
	(
	select
		distinct d.matricula,
		p.nome,
		cast (extract ('day'
	from
		f."data") as integer) as dia,
		cast(extract ('month'
	from
		f."data") as integer) as mes,
		f.frequencia,
		f.id_frequencia,
		f.abonada,
		false as alterado,
		0 as maxFaltas,
		d.id_discente,
		f."data" as data_frequencia,
		case
			when m.id_situacao_matricula = 3 then true
			else false
		end as situacao,
		mes.id_matricula_discente_serie,
		case
			when aet.data_entrada_escola is not null then (cast(to_char(aet.data_entrada_escola,
			'yyyy-mm-dd') as DATE) + interval '0 hours')
			when mes.data_matricula_turma is not null then (cast(to_char(mes.data_matricula_turma,
			'yyyy-mm-dd') as DATE) + interval '0 hours')
			else (cast(to_char(mes.data_cadastro,
			'yyyy-mm-dd') as DATE) + interval '0 hours')
		end as data_matricula_turma,
		case
			when st.id_status = 4 then true
			when mee_externa.ultima_data is not null then true
			else false
		end as transferido,
		(f.id_event_log is not null) as reconhecimento_facial,
		case
			when mes.id_situacao_matricula_serie not in ( 2, 3, 1, 7, 8, 10,-1 ) then coalesce(mee_interna.ultima_data,
			st.data_solicitacao,
			mee_externa.ultima_data) + interval '0 hours'
			else null
		end as data_transferencia,
		mes.id_situacao_matricula_serie,
		date((
		select
			max(me.data_ocorrencia)
		from
			basico.movimentacao_estudante me
		where
			me.id_discente = mes.id_estudante
			and me.ativo
			and me.id_tipo_movimentacao_estudante = 3
			and me.ano_escolar = mes.ano_calendario )) as data_abandono,
		(
		select
			count(*) > 0
		from
			comum.pessoa_necessidade_especial pne
		where
			pne.id_pessoa = p.id_pessoa) as nee
	from
		discente d
	join ensino.matricula_componente m on
		m.id_discente = d.id_discente
		and m.id_situacao_matricula in ( 5, 6, 2, 8, 4, 9 )
	join ensino.turma t
			using (id_turma)
	join basico.matricula_estudante_serie mes on
		mes.id_estudante = d.id_discente
			and mes.id_turma_serie = t.id_turma_serie
		join comum.pessoa p
				using (id_pessoa)
		left join ensino.avaliacao_estudante_transferido aet on
			aet.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		left join ensino.frequencia_aluno f on
			f.id_discente = d.id_discente
				and f.id_turma = 688217
				and f.ativo
				and f.data between :dataInicio and :dataFim
			left join matricula.solicitacao_transferencia st on
				(st.id_matricula_discente_serie = mes.id_matricula_discente_serie
					and st.id_status = 4)
			left join (
				select
					mee.id_matricula_estudante_serie,
					min(coalesce(mee.data_solicitacao, mee.data)) as ultima_data
				from
					matricula.movimentacao_estudante_escola mee
				where
					mee.ativo
					and mee.id_tipo_sol_transferencia in (1)
				group by
					mee.id_matricula_estudante_serie ) as mee_interna on
				mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
				and mes.id_situacao_matricula_serie = 6
			left join ultima_data_movimentacao as mee_externa on
				mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
				and mes.id_situacao_matricula_serie = 6
			left join matriculas_dispensa_unidade mdu on
				mdu.id_matricula_estudante_serie = mes.id_matricula_discente_serie
				and mdu.unidade = 1
			where
				m.id_turma = 688217
				and mdu.id_matricula_estudante_serie is null
				and m.nao_optou is false ) results
join (
	select
		distinct mes.id_matricula_discente_serie
	from
		basico.matricula_estudante_serie mes
	left join matricula.solicitacao_transferencia st on
		(st.id_matricula_discente_serie = mes.id_matricula_discente_serie
			and st.id_status = 4)
	left join (
		select
			mee.id_matricula_estudante_serie,
			min(coalesce(mee.data_solicitacao, mee.data)) as ultima_data
		from
			matricula.movimentacao_estudante_escola mee
		where
			mee.ativo
			and mee.id_tipo_sol_transferencia in (1)
		group by
			mee.id_matricula_estudante_serie ) as mee_interna on
		mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		and mes.id_situacao_matricula_serie = 6
	left join ultima_data_movimentacao as mee_externa on
		mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	left join (
		select
			max(udm.id_matricula_estudante_serie) as id_matricula_estudante_serie,
			udm.ultima_data
		from
			ultima_data_movimentacao udm
		group by
			udm.id_estudante,
			udm.ultima_data ) as um on
		um.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		and mes.id_situacao_matricula_serie = 6
	join ensino.turma t
			using (id_turma_serie)
	where
		t.id_turma = 688217
		and (mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			or (mes.id_situacao_matricula_serie = 6
				and coalesce(st.data_solicitacao,
				um.ultima_data) is not null
					or (mes.id_situacao_matricula_serie = 4
						and (
						select
							count(*)
						from
							basico.movimentacao_estudante me
						where
							me.id_discente = mes.id_estudante
							and me.ativo
							and me.id_tipo_movimentacao_estudante = 3
							and me.ano_escolar = mes.ano_calendario ) > 0) ) ) ) mess on
	(results.id_matricula_discente_serie = mess.id_matricula_discente_serie)
where
	id_situacao_matricula_serie <> 6
	or (id_situacao_matricula_serie = 6
		and data_transferencia > :dataInicio)
order by
	results.nome,
	results.id_discente,
	results.data_frequencia,
	results.data_matricula_turma; 