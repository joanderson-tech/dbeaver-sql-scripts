	with afastamentoValidos as (
select
	distinct data_inicio,
	data_fim,
	aa.id_servidor,
	case
		when af.id_tipo_afastamento = 1 then tl.descricao
		else af.descricao
	end as tipoAfastamento
from
	rh.afastamento aa
inner join rh.tipo_afastamento af on
	af.id_tipo_afastamento = aa.id_tipo
left join pessoas.periodo_gozo pg on
	pg.id_afastamento = aa.id_afastamento
left join pessoas.licenca l on
	l.id_licenca = pg.id_licenca
left join pessoas.tipo_licenca tl on
	tl.id_tipo_licenca = l.id_tipo_licenca
where
	(data_fim > now()
		or data_fim is null)
	and aa.ativo = true
	and case
		when id_tipo = 1 then (
		select
			extract (day
		from
			(data_fim - data_inicio)) + 1) >= 30
		and not exists (
		select
			*
		from
			rh.afastamento a2
		where
			a2.id_servidor = aa.id_servidor
			and a2.id_tipo <> 1
			and (a2.data_fim > now()
				or a2.data_fim is null)
			and a2.ativo = true )
		else id_tipo <> 1
	end ) ,
alocacaoAdministrativa as (
select
	id_servidor,
	at.descricao as funcao
from
	pessoas.vaga_administrativa vg
join rh.atividade at on
	at.id_atividade = vg.id_atividade
where
	vg.ativo = true
	and id_servidor > 0 ) ,
alocacaoAcademica as (
select
	dt_sub.id_docente as id_servidor,
	ee_sub.denominacao as etapa,
	s_sub.descricao as serie,
	t2_sub.descricao as turno,
	t_sub.codigo as turma,
	cc_sub.nome as disciplina,
	cast('SALA DE AULA' as varchar) as funcao,
	e_sub.nome as escola_alocacao,
	e_sub.codigo_inep
from
	ensino.docente_turma dt_sub
inner join ensino.turma t_sub on
	t_sub.id_turma = dt_sub.id_turma
inner join basico.turma_serie ts_sub on
	ts_sub.id_turma_serie = t_sub.id_turma_serie
inner join escola.escola e_sub on
	e_sub.id_escola = ts_sub.id_escola
inner join ensino.turno t2_sub on
	t2_sub.id_turno = ts_sub.id_turno
inner join basico.serie s_sub on
	s_sub.id_serie = ts_sub.id_serie
inner join basico.etapa_ensino ee_sub on
	ee_sub.id_etapa_ensino = s_sub.id_etapa_ensino
inner join ensino.componente_curricular cc_sub on
	cc_sub.id_componente_curricular = t_sub.id_disciplina
where
	now() between dt_sub.data_inicio and dt_sub.data_fim
	and dt_sub.ativo = true ) ,
graduacoes as (
select
	distinct id_pessoa,
	string_agg(distinct cast(coalesce(q.descricao,
	fa.descricao_curso,
	'Não Informado') as varchar),
	', ') as graduacao
from
	pessoas.formacao_academica fa
left join pessoas.qualificacao q
		using (id_qualificacao)
where
	fa.ativo is true
	and fa.id_tipo_qualificacao = 2
group by
	id_pessoa ) ,
pos_graduacoes as (
select
	distinct id_pessoa,
	string_agg(distinct cast(coalesce(q.descricao,
	fa.descricao_curso,
	'Não Informado') as varchar),
	', ') as pos_graduacao
from
	pessoas.formacao_academica fa
left join pessoas.qualificacao q
		using (id_qualificacao)
where
	fa.ativo is true
	and fa.id_tipo_qualificacao = 3
group by
	id_pessoa ) ,
docentesComPendencia as(
select
	distinct dt.id_docente
from
	ensino.docente_turma dt
join ensino.turma t on
	t.id_turma = dt.id_turma
left join ava.plano_anual_ensino pae on
	pae.id_turma = t.id_turma
	and id_situacao_acompanhamento_pedagogico = 4
left join ava.plano_aula pa on
	pa.id_turma = t.id_turma
left join ava.plano_aula_categoria pac on
	pac.id_plano_aula = pa.id_plano_aula
	and pac.id_situacao_acompanhamento_pedagogico = 4
left join ava.avaliacao_registro_aula ara on
	ara.id_turma = t.id_turma
	and ara.id_situacao_acompanhamento_pedagogico = 4
left join ava.avaliacao_nota_frequencia anf on
	anf.id_turma = t.id_turma
	and anf.id_situacao_acompanhamento_pedagogico = 4
where
	dt.ativo
	and (pae is not null
		or pac is not null
		or ara is not null
		or anf is not null) )
select
	distinct u.nome as dired,
	m.nome as municipio,
	coalesce(ac.escola_alocacao,
	e.nome,
	uni.nome) as escola,
	(case
		when s.id_categoria = 1 then (case
			when dcp is not null then 'Professor com pendências pedagógicas'
			else 'Professor sem pendências pedagógicas'
		end)
		else ''
	end) as pendencia,
	p.data_nascimento as nascimento,
	coalesce(p.sexo,
	'') as sexo,
	coalesce(ad.descricao,
	'') as areaAdministrativa,
	p.nome,
	s.siape,
	s.digito_siape,
	p.cpf_cnpj,
	s.id_ativo as ativo,
	c.denominacao as cargo,
	coalesce(vg.funcao,
	ac.funcao) as funcao,
	ac.disciplina as disciplina,
	a.data_inicio,
	a.data_fim,
	a.tipoAfastamento,
	tipo_vinculo,
	s.admissao,
	s.data_desligamento,
	forma_vacancia,
	coalesce(g.graduacao,
	'') as graduacao,
	coalesce(pg.pos_graduacao,
	'') as pos_graduacao,
	coalesce(s.ds_referencia,
	'') as classe,
	coalesce(p.email,
	p.email_alternativo,
	'') as email,
	coalesce(p.telefone_celular,
	p.telefone_fixo) as telefone,
	case
		when coalesce(TRIM(p.endereco),
		'') <> '' then p.endereco || coalesce(', ' || p.bairro,
		'')|| ' - ' || m.nome
		else ''
	end as endereco,
	case
		when cs.id_cessao is not null then case
			when cs.com_onus then 'COM ÔNUS'
			else 'SEM ÔNUS'
		end
		else ''
	end as tipo_orgao,
	case
		when cs.id_cessao is not null then cs.unidade_destino
		else ''
	end as orgao,
	p.codigo_inep,
	s.regime_trabalho,
	replace(tcs.descricao,
	'/',
	' de ') as fator_alocacao,
	ac.etapa,
	ac.serie,
	ac.turno,
	ac.turma,
	coalesce(ac.codigo_inep,
	e.codigo_inep) as codigo_inep_escola,
	case
		when (s.numero_contrato_1 is not null
			and s.numero_contrato_2 is not null) then (s.numero_contrato_1 || '-' || s.numero_contrato_2)
		else ''
	end as numero_contrato
from
	rh.servidor s
inner join comum.pessoa p on
	p.id_pessoa = s.id_pessoa
inner join rh.tipo_contrato_servidor tcs on
	tcs.id_tipo_contrato_servidor = s.id_tipo_contrato_servidor
left join rh.cargo c on
	c.id_cargo = s.id_cargo
left join rh.escolaridade esc on
	esc.id_escolaridade = p.id_escolaridade
left join pessoas.formacao_academica fca on
	fca.id_pessoa = p.id_pessoa
left join pessoas.qualificacao q on
	q.id_qualificacao = fca.id_qualificacao
left join pessoas.cessao cs on
	cs.id_servidor = s.id_servidor
left join pessoas.vaga_administrativa va on
	va.id_servidor = s.id_servidor
left join pessoas.area_administrativa ad on
	ad.id_area_administrativa = va.id_area_administrativa
left join afastamentoValidos a on
	a.id_servidor = s.id_servidor
left join alocacaoAdministrativa vg on
	vg.id_servidor = s.id_servidor
left join escola.escola e on
	e.id_unidade_escola = s.id_unidade
left join comum.unidade uni on
	uni.id_unidade = s.id_unidade
left join comum.municipio m on
	m.id_municipio = uni.id_municipio
left join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
left join alocacaoAcademica ac on
	ac.id_servidor = s.id_servidor
left join graduacoes g on
	g.id_pessoa = s.id_pessoa
left join pos_graduacoes pg on
	pg.id_pessoa = s.id_pessoa
left join docentesComPendencia dcp on
	dcp.id_docente = s.id_servidor
where
	1 = 1
	and e.id_escola in (52232930)
	and c.id_cargo in (2884)
	and ( c.id_cargo in (2884)
		and s.tipo_vinculo in ('1') )
order by
	1,
	2,
	3,
	4;
	
	with afastamentoValidos as (
select
	distinct data_inicio,
	data_fim,
	aa.id_servidor,
	case
		when af.id_tipo_afastamento = 1 then tl.descricao
		else af.descricao
	end as tipoAfastamento
from
	rh.afastamento aa
inner join rh.tipo_afastamento af on
	af.id_tipo_afastamento = aa.id_tipo
left join pessoas.periodo_gozo pg on
	pg.id_afastamento = aa.id_afastamento
left join pessoas.licenca l on
	l.id_licenca = pg.id_licenca
left join pessoas.tipo_licenca tl on
	tl.id_tipo_licenca = l.id_tipo_licenca
where
	(data_fim > now()
		or data_fim is null)
	and aa.ativo = true
	and case
		when id_tipo = 1 then (
		select
			extract (day
		from
			(data_fim - data_inicio)) + 1) >= 30
		and not exists (
		select
			*
		from
			rh.afastamento a2
		where
			a2.id_servidor = aa.id_servidor
			and a2.id_tipo <> 1
			and (a2.data_fim > now()
				or a2.data_fim is null)
			and a2.ativo = true )
		else id_tipo <> 1
	end ) ,
alocacaoAdministrativa as (
select
	id_servidor,
	at.descricao as funcao
from
	pessoas.vaga_administrativa vg
join rh.atividade at on
	at.id_atividade = vg.id_atividade
where
	vg.ativo = true
	and id_servidor > 0 ) ,
alocacaoAcademica as (
select
	dt_sub.id_docente as id_servidor,
	ee_sub.denominacao as etapa,
	s_sub.descricao as serie,
	t2_sub.descricao as turno,
	t_sub.codigo as turma,
	cc_sub.nome as disciplina,
	cast('SALA DE AULA' as varchar) as funcao,
	e_sub.nome as escola_alocacao,
	e_sub.codigo_inep
from
	ensino.docente_turma dt_sub
inner join ensino.turma t_sub on
	t_sub.id_turma = dt_sub.id_turma
inner join basico.turma_serie ts_sub on
	ts_sub.id_turma_serie = t_sub.id_turma_serie
inner join escola.escola e_sub on
	e_sub.id_escola = ts_sub.id_escola
inner join ensino.turno t2_sub on
	t2_sub.id_turno = ts_sub.id_turno
inner join basico.serie s_sub on
	s_sub.id_serie = ts_sub.id_serie
inner join basico.etapa_ensino ee_sub on
	ee_sub.id_etapa_ensino = s_sub.id_etapa_ensino
inner join ensino.componente_curricular cc_sub on
	cc_sub.id_componente_curricular = t_sub.id_disciplina
where
	now() between dt_sub.data_inicio and dt_sub.data_fim
	and dt_sub.ativo = true ) ,
graduacoes as (
select
	distinct id_pessoa,
	string_agg(distinct cast(coalesce(q.descricao,
	fa.descricao_curso,
	'Não Informado') as varchar),
	', ') as graduacao
from
	pessoas.formacao_academica fa
left join pessoas.qualificacao q
		using (id_qualificacao)
where
	fa.ativo is true
	and fa.id_tipo_qualificacao = 2
group by
	id_pessoa ) ,
pos_graduacoes as (
select
	distinct id_pessoa,
	string_agg(distinct cast(coalesce(q.descricao,
	fa.descricao_curso,
	'Não Informado') as varchar),
	', ') as pos_graduacao
from
	pessoas.formacao_academica fa
left join pessoas.qualificacao q
		using (id_qualificacao)
where
	fa.ativo is true
	and fa.id_tipo_qualificacao = 3
group by
	id_pessoa ) ,
docentesComPendencia as(
select
	distinct dt.id_docente
from
	ensino.docente_turma dt
join ensino.turma t on
	t.id_turma = dt.id_turma
left join ava.plano_anual_ensino pae on
	pae.id_turma = t.id_turma
	and id_situacao_acompanhamento_pedagogico = 4
left join ava.plano_aula pa on
	pa.id_turma = t.id_turma
left join ava.plano_aula_categoria pac on
	pac.id_plano_aula = pa.id_plano_aula
	and pac.id_situacao_acompanhamento_pedagogico = 4
left join ava.avaliacao_registro_aula ara on
	ara.id_turma = t.id_turma
	and ara.id_situacao_acompanhamento_pedagogico = 4
left join ava.avaliacao_nota_frequencia anf on
	anf.id_turma = t.id_turma
	and anf.id_situacao_acompanhamento_pedagogico = 4
where
	dt.ativo
	and (pae is not null
		or pac is not null
		or ara is not null
		or anf is not null) )
select
	distinct u.nome as dired,
	m.nome as municipio,
	coalesce(ac.escola_alocacao,
	e.nome,
	uni.nome) as escola,
	(case
		when s.id_categoria = 1 then (case
			when dcp is not null then 'Professor com pendências pedagógicas'
			else 'Professor sem pendências pedagógicas'
		end)
		else ''
	end) as pendencia,
	p.data_nascimento as nascimento,
	coalesce(p.sexo,
	'') as sexo,
	coalesce(ad.descricao,
	'') as areaAdministrativa,
	p.nome,
	s.siape,
	s.digito_siape,
	p.cpf_cnpj,
	s.id_ativo as ativo,
	c.denominacao as cargo,
	coalesce(vg.funcao,
	ac.funcao) as funcao,
	ac.disciplina as disciplina,
	a.data_inicio,
	a.data_fim,
	a.tipoAfastamento,
	tipo_vinculo,
	s.admissao,
	s.data_desligamento,
	forma_vacancia,
	coalesce(g.graduacao,
	'') as graduacao,
	coalesce(pg.pos_graduacao,
	'') as pos_graduacao,
	coalesce(s.ds_referencia,
	'') as classe,
	coalesce(p.email,
	p.email_alternativo,
	'') as email,
	coalesce(p.telefone_celular,
	p.telefone_fixo) as telefone,
	case
		when coalesce(TRIM(p.endereco),
		'') <> '' then p.endereco || coalesce(', ' || p.bairro,
		'')|| ' - ' || m.nome
		else ''
	end as endereco,
	case
		when cs.id_cessao is not null then case
			when cs.com_onus then 'COM ÔNUS'
			else 'SEM ÔNUS'
		end
		else ''
	end as tipo_orgao,
	case
		when cs.id_cessao is not null then cs.unidade_destino
		else ''
	end as orgao,
	p.codigo_inep,
	s.regime_trabalho,
	replace(tcs.descricao,
	'/',
	' de ') as fator_alocacao,
	ac.etapa,
	ac.serie,
	ac.turno,
	ac.turma,
	coalesce(ac.codigo_inep,
	e.codigo_inep) as codigo_inep_escola,
	case
		when (s.numero_contrato_1 is not null
			and s.numero_contrato_2 is not null) then (s.numero_contrato_1 || '-' || s.numero_contrato_2)
		else ''
	end as numero_contrato
from
	rh.servidor s
inner join comum.pessoa p on
	p.id_pessoa = s.id_pessoa
inner join rh.tipo_contrato_servidor tcs on
	tcs.id_tipo_contrato_servidor = s.id_tipo_contrato_servidor
left join rh.cargo c on
	c.id_cargo = s.id_cargo
left join rh.escolaridade esc on
	esc.id_escolaridade = p.id_escolaridade
left join pessoas.formacao_academica fca on
	fca.id_pessoa = p.id_pessoa
left join pessoas.qualificacao q on
	q.id_qualificacao = fca.id_qualificacao
left join pessoas.cessao cs on
	cs.id_servidor = s.id_servidor
left join pessoas.vaga_administrativa va on
	va.id_servidor = s.id_servidor
left join pessoas.area_administrativa ad on
	ad.id_area_administrativa = va.id_area_administrativa
left join afastamentoValidos a on
	a.id_servidor = s.id_servidor
left join alocacaoAdministrativa vg on
	vg.id_servidor = s.id_servidor
left join escola.escola e on
	e.id_unidade_escola = s.id_unidade
left join comum.unidade uni on
	uni.id_unidade = s.id_unidade
left join comum.municipio m on
	m.id_municipio = uni.id_municipio
left join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
left join alocacaoAcademica ac on
	ac.id_servidor = s.id_servidor
left join graduacoes g on
	g.id_pessoa = s.id_pessoa
left join pos_graduacoes pg on
	pg.id_pessoa = s.id_pessoa
left join docentesComPendencia dcp on
	dcp.id_docente = s.id_servidor
where
	1 = 1
	and e.id_escola in (52232930)
order by
	1,
	2,
	3,
	4;