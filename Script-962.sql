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
	and mee."data" <= '2025-08-13'
group by
	mes.id_estudante,
	mee.id_matricula_estudante_serie ),
estudantes_por_turma as (
select
	em.id_turma_serie,
	COUNT(em.id_matricula_discente_serie) as total_estudantes
from
	(
	select
		distinct mes.id_matricula_discente_serie,
		mes.id_turma_serie
	from
		basico.matricula_estudante_serie mes
	left join (
		select
			id_matricula_discente_serie,
			MIN(data_solicitacao) as data_solicitacao
		from
			matricula.solicitacao_transferencia
		where
			id_status = 4
		group by
			id_matricula_discente_serie ) st on
		st.id_matricula_discente_serie = mes.id_matricula_discente_serie
	left join (
		select
			id_matricula_estudante_serie,
			MIN(coalesce(data_solicitacao, data)) as ultima_data
		from
			matricula.movimentacao_estudante_escola
		where
			ativo
			and id_tipo_sol_transferencia = 1
			and "data" <= '2025-08-13'
		group by
			id_matricula_estudante_serie ) mee_interna on
		mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	left join (
		select
			id_matricula_estudante_serie
		from
			ultima_data_movimentacao
		group by
			id_matricula_estudante_serie ) mee_externa on
		mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	where
		mes.ano_calendario = 2025
		and mes.id_turma_serie is not null
		and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1, 6 )
			and coalesce(mes.data_matricula_turma, mes.data_cadastro) <= '2025-08-13'
				and not ( coalesce(mes.data_matricula_turma, mes.data_cadastro) <= '2025-08-13'
					and ( mee_interna.ultima_data is not null
						or mee_externa.id_matricula_estudante_serie is not null ) ) ) em
group by
	em.id_turma_serie )
select
	distinct u.id_unidade as id_dired,
	u.nome as dired,
	tue.descricao as tipo_unidade_escolar,
	e.nome as escola,
	e.codigo_inep as codigo_inep,
	tue.id_tipo_unidade_escolar,
	e.id_escola,
	m.id_municipio,
	m.nome as municipio,
	ee.id_etapa_ensino,
	ee.denominacao as etapa,
	se.descricao as serie,
	tu.descricao as turno,
	s.siape,
	s.digito_siape,
	s.siape || '/' || coalesce(s.digito_siape, '') as identificador,
	s.id_ativo,
	coalesce(p.nome, 'NÃO INFORMADO') as docente,
	ts.id_turma_serie,
	ts.nome as turma_serie,
	mo.id_modulo,
	mo.denominacao as modulo,
	me.denominacao as modalidade,
	ne.denominacao as nivel,
	t.id_turma,
	t.codigo as turma,
	cc.nome as componente,
	dt.ch_dedicada_periodo,
	t.grupo,
	ts.capacidade_aluno,
	coalesce(ept.total_estudantes, 0) as estudantes,
	coalesce(cb_turma_serie.codigo, 'NÃO INFORMADO') as codigo_curriculo
from
	ensino.turma t
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
	and to_char(ts.data_cadastro, 'yyyy-mm-dd') <= '2025-08-13'
join basico.serie se on
	se.id_serie = ts.id_serie
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = se.id_etapa_ensino
join ensino.turno tu on
	tu.id_turno = ts.id_turno
join escola.escola e on
	e.id_escola = ts.id_escola
left join escola.tipo_unidade_escolar tue on
	e.id_tipo_unidade_escolar = tue.id_tipo_unidade_escolar
join basico.modalidade_ensino_basico me on
	me.id_modalidade_ensino_basico = ee.id_modalidade
join basico.nivel_etapa_ensino ne on
	ne.id_nivel_etapa_ensino = ee.id_nivel_etapa
left join comum.municipio m on
	m.id_municipio = e.id_municipio
left join basico.curriculo_basico cb_turma_serie on
	cb_turma_serie.id_curriculo_basico = ts.id_curriculo_medio
join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
left join ensino.componente_curricular cc on
	cc.id_componente_curricular = t.id_disciplina
left join basico.curriculo_basico cb_turno on
	cb_turno.id_serie = se.id_serie
	and cb_turno.ativo is true
	and cb_turno.id_turno = ts.id_turno
left join basico.curriculo_basico cb_geral on
	cb_geral.id_serie = se.id_serie
	and cb_geral.ativo is true
	and cb_geral.id_turno is null
left join basico.curriculo_basico_componente cbc on
	cbc.id_componente_curricular = t.id_disciplina
	and coalesce(cb_turno.id_curriculo_basico, cb_geral.id_curriculo_basico) = cbc.id_curriculo_basico
	and case
		when t.id_modulo is null then cbc.id_modulo is null
		else cbc.id_modulo = t.id_modulo
	end
left join basico.modulo mo on
	mo.id_modulo = cbc.id_modulo
left join ensino.docente_turma dt on
	dt.id_turma = t.id_turma
	and dt.ativo = true
	and dt.data_fim > '13/08/2025'
left join rh.servidor s on
	s.id_servidor = dt.id_docente
left join comum.pessoa p on
	p.id_pessoa = s.id_pessoa
left join estudantes_por_turma ept on
	ept.id_turma_serie = ts.id_turma_serie
where
	t.id_situacao_turma in(2, 3, 1, 7, 8, 10, -1)
	and t.tipo <> 4
	and ts.ativo = true
	and ts.progressao_parcial = false
	and ts.ano = 2025
	and ts.id_tipo_turma_serie in ( 1, 3, 5, 4 )
	and coalesce(coalesce(cb_turno.tipo_diario, cb_geral.tipo_diario) not in ( 1, 2, 4, 9, 11, 21, 22, 26, 20, 24, 25, 29, 31, 34, 35, 38, 39, 42, 44, 45, 50, 53, 54, 57, 58, 61, 62 ) or cc.id_tipo_componente <> 2 or cbc.permite_alocacao_adjunto, false)
order by
	u.id_unidade,
	m.id_municipio,
	tue.descricao,
	e.nome,
	ee.denominacao,
	se.descricao,
	tu.descricao,
	ts.nome,
	mo.denominacao,
	t.grupo,
	cc.nome;