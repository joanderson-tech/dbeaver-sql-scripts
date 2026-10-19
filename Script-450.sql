with pessoas_nee as (
select
	distinct pne.id_pessoa
from
	comum.pessoa_necessidade_especial pne ),
data_referencia_periodo as (
select
	case
		when 0 = 0 then pda.data_referencia_dignostico_inicial
		when 0 = 1 then pda.data_referencia_bim_1
		when 0 = 2 then pda.data_referencia_bim_2
		when 0 = 3 then pda.data_referencia_bim_3
		when 0 = 4 then pda.data_referencia_bim_4
	end as data_referencia
from
	ava.periodo_diagnostico_alfabetizacao pda
join basico.calendario_escolar ce on
	ce.id_calendario_escolar = pda.id_calendario_escolar
where
	ce.ano = 2025 ),
ultima_data_movimentacao as (
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
		and mee."data" <= (
		select
			data_referencia
		from
			data_referencia_periodo)
	group by
		mes.id_estudante,
		mee.id_matricula_estudante_serie ),
estudantes_matriculados as (
select
	distinct mes.id_matricula_discente_serie,
	mes.id_estudante,
	mes.id_turma_serie,
	mes.id_turma_serie_multisseriado
from
	basico.matricula_estudante_serie mes
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
			and mee."data" <= (
			select
				data_referencia
			from
				data_referencia_periodo)
		group by
			mee.id_matricula_estudante_serie ) as mee_interna on
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
left join (
	select
		mes_t.id_estudante,
		(cast(to_char(coalesce(mes_t.data_matricula_turma,
		mes_t.data_cadastro),
		'yyyy-mm-dd') as date) + interval '0 hours') as data_matricula,
		mes_t.id_turma_serie,
		mes_t.id_serie_escola
	from
		basico.matricula_estudante_serie mes_t
	left join matricula.solicitacao_transferencia st_t on
		st_t.id_matricula_discente_serie = mes_t.id_matricula_discente_serie
	left join matricula.movimentacao_estudante_escola mee_t on
		mee_t.id_matricula_estudante_serie = mes_t.id_matricula_discente_serie
	where
		mes_t.id_situacao_matricula_serie = 6
		and mes_t.ano_calendario = 2025
		and mes_t.id_turma_serie is not null
		and (st_t.data_analise > (
		select
			data_referencia
		from
			data_referencia_periodo)
		or mee_t."data" > (
		select
			data_referencia
		from
			data_referencia_periodo)) ) as mes_transf_volta on
	mes_transf_volta.id_estudante = mes.id_estudante
	and mes_transf_volta.id_turma_serie = mes.id_turma_serie
	and mes_transf_volta.id_serie_escola = mes.id_serie_escola
where
	mes.ano_calendario = 2025
	and mes.id_turma_serie is not null
	and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1, 6 )
		and coalesce(to_char(mes.data_matricula_turma,
		'yyyy-mm-dd'),
		to_char(mes.data_cadastro,
		'yyyy-mm-dd')) <= cast((
		select
			data_referencia
		from
			data_referencia_periodo) as text)
		and not ( coalesce(to_char(mes.data_matricula_turma,
		'yyyy-mm-dd'),
		to_char(mes.data_cadastro,
		'yyyy-mm-dd')) <= cast((
		select
			data_referencia
		from
			data_referencia_periodo) as text)
		and (coalesce(to_char(mee_interna.ultima_data,
		'yyyy-mm-dd'),
		to_char(mee_externa.ultima_data,
		'yyyy-mm-dd')) is not null
			and coalesce(to_char(mee_interna.ultima_data,
			'yyyy-mm-dd'),
			to_char(mee_externa.ultima_data,
			'yyyy-mm-dd')) <= cast((
			select
				data_referencia
			from
				data_referencia_periodo) as text)) ) ) ,
levantamento_respostas as (
select
	da.id_matricula_estudante_serie,
	ts.id_turma_serie,
	ts.id_escola,
	ts.id_serie,
	da.id_configuracao_diagnostico_alfabetizacao,
	dar.id as id_diagnostico_alfabetizacao_resposta,
	coalesce(darm.id_configuracao_diagnostico_alfabetizacao_nivel_topico,
	dar.id_configuracao_diagnostico_alfabetizacao_nivel_topico) as id_configuracao_diagnostico_alfabetizacao_nivel_topico,
	cdant.id_topico_diagnostico_alfabetizacao,
	case
		when cdan.marcacao_unica
			and cdant.id is not null then cdant.nivel_estudante_alfabetizado
			else false
		end as nivel_estudante_alfabetizado,
		cdan.marcacao_unica,
		cdan.id as id_nivel,
		cdan.ordem as ordem_nivel
	from
		ava.diagnostico_alfabetizacao da
	join ava.configuracao_diagnostico_alfabetizacao_nivel cdan on
		cdan.id_configuracao_diagnostico_alfabetizacao = da.id_configuracao_diagnostico_alfabetizacao
	join ava.diagnostico_alfabetizacao_resposta dar on
		dar.id_diagnostico_alfabetizacao = da.id
		and dar.id_configuracao_diagnostico_alfabetizacao_nivel = cdan.id
	join estudantes_matriculados mes on
		mes.id_matricula_discente_serie = da.id_matricula_estudante_serie
	join basico.turma_serie ts on
		ts.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
		mes.id_turma_serie)
	left join ava.diagnostico_alfabetizacao_resposta_multipla darm on
		darm.id_diagnostico_alfabetizacao_resposta = dar.id
	left join ava.configuracao_diagnostico_alfabetizacao_nivel_topico cdant on
		cdant.id = coalesce(darm.id_configuracao_diagnostico_alfabetizacao_nivel_topico,
		dar.id_configuracao_diagnostico_alfabetizacao_nivel_topico)
	where
		dar.periodo = 0 ),
levantamento_niveis as (
select
	lr.*,
	cdand.id_configuracao_diagnostico_alfabetizacao_nivel_topico is not null as desejavel
from
	levantamento_respostas lr
join ava.configuracao_diagnostico_alfabetizacao_serie cdas on
	cdas.id_configuracao_diagnostico_alfabetizacao = lr.id_configuracao_diagnostico_alfabetizacao
	and cdas.id_serie = lr.id_serie
left join ava.configuracao_diagnostico_alfabetizacao_nivel_desejavel cdand on
	cdand.id_configuracao_diagnostico_alfabetizacao_nivel_topico = lr.id_configuracao_diagnostico_alfabetizacao_nivel_topico
	and cdand.id_configuracao_diagnostico_alfabetizacao_serie = cdas.id
where
	lr.marcacao_unica ),
levantamento_respostas_diagnostico as (
select
	lr.id_matricula_estudante_serie,
	every(lr.id_configuracao_diagnostico_alfabetizacao_nivel_topico is not null
		and lr.id_topico_diagnostico_alfabetizacao <> 1) as avaliado,
	every(lr.nivel_estudante_alfabetizado = true) filter (
	where lr.marcacao_unica) as alfabetizado
from
	levantamento_respostas lr
group by
	lr.id_matricula_estudante_serie )
select
	cda.id as id_configuracao,
	cda.nome as nome_configuracao,
	e.nome as nome_escola,
	ee.denominacao as etapa,
	s.descricao as serie,
	count(distinct mes.id_matricula_discente_serie) as estudantes,
	count(distinct pne.id_pessoa) as nee,
	count(lrd.id_matricula_estudante_serie) filter (
	where lrd.avaliado) as avaliados,
	count(lrd.id_matricula_estudante_serie) filter (
	where lrd.alfabetizado) as alfabetizados,
	cdan.id as id_configuracao_nivel,
	count(distinct ln.id_matricula_estudante_serie) filter (
	where ln.desejavel) as nivel_desejado
from
	ava.configuracao_diagnostico_alfabetizacao cda
join ava.configuracao_diagnostico_alfabetizacao_nivel cdan on
	cdan.id_configuracao_diagnostico_alfabetizacao = cda.id
join ava.configuracao_diagnostico_alfabetizacao_serie cdas on
	cdas.id_configuracao_diagnostico_alfabetizacao = cda.id
join basico.serie s on
	s.id_serie = cdas.id_serie
	and s.id_etapa_ensino = cdas.id_etapa_ensino
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = cdas.id_etapa_ensino
join basico.turma_serie ts on
	ts.id_serie = s.id_serie
	and ts.ativo
	and ts.ano = 2025
	and ts.id_tipo_turma_serie <> 4
	and to_char(ts.data_cadastro,
	'yyyy-mm-dd') <= cast((
	select
		data_referencia
	from
		data_referencia_periodo) as text)
join escola.escola e on
	e.id_escola = ts.id_escola
join estudantes_matriculados mes on
	coalesce(mes.id_turma_serie_multisseriado,
	mes.id_turma_serie) = ts.id_turma_serie
join public.discente d on
	d.id_discente = mes.id_estudante
left join pessoas_nee pne on
	pne.id_pessoa = d.id_pessoa
left join levantamento_respostas_diagnostico lrd on
	lrd.id_matricula_estudante_serie = mes.id_matricula_discente_serie
left join levantamento_niveis ln on
	ln.id_nivel = cdan.id
	and ln.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	and ln.id_serie = s.id_serie
	and ln.id_escola = e.id_escola
where
	ee.id_etapa_ensino in (9)
	and cda.ativo
	and cdan.ativo
	and cdan.marcacao_unica
group by
	cda.id,
	e.id_escola,
	ee.id_etapa_ensino,
	s.id_serie,
	cdan.id,
	cdan.ordem
order by
	cda.nome,
	e.nome,
	ee.denominacao,
	s.descricao,
	cdan.ordem;
