 with numero_alunos as (
select
	e.id_unidade_escola,
	COUNT(distinct mes.id_estudante)::int numero_alunos
from
	escola.escola e
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola = e.id_escola
join basico.matricula_estudante_serie mes on
	mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
where
	mes.id_situacao_matricula_serie in ( 1, 2, 3, 7, 8, 10, 11, 12 )
	and mes.ano_calendario = 2024
group by
	1 ),
numero_turmas as (
select
	e.id_unidade_escola,
	COUNT(distinct ts.id_turma_serie)::int as numero_turmas
from
	escola.escola e
join basico.turma_serie ts
		using (id_escola)
join ensino.turma t on
	t.id_turma_serie = ts.id_turma_serie
		and t.id_situacao_turma <> (4)
	where
		ts.ativo
		and ts.progressao_parcial = false
		and ts.ano = 2024
		and t.tipo not in ( 4, 17, 9, 7 )
			and ts.id_tipo_turma_serie <> 2
		group by
			1 )
select
	'Administrativo' as tipo,
	uniResponsavel.nome as direc,
	m.nome as municipio,
	u.nome as unidade,
	a.descricao as areaAdministrativa,
	at.descricao as atividade,
	pe.nome as servidor,
	se.siape || '/' || se.digito_siape as siape,
	vg.dt_inicio as dataAlocacao,
	vg.dt_termino as dataFimAlocacao,
	c.denominacao as cargo,
	t.descricao as turno,
	at.codigo_rh as codigoFuncao ,
	ch_semanal as chAlocado,
	e.id_unidade_escola as idEscola,
	nt.numero_turmas as numeroTurmas,
	na.numero_alunos as numeroAlunos,
	se.admissao,
	0 as ord1,
	0 as ord2,
	t.ordem as ord3
from
	pessoas.vaga_administrativa vg
inner join comum.unidade u on
	u.id_unidade = vg.id_unidade
inner join pessoas.area_administrativa a on
	a.id_area_administrativa = vg.id_area_administrativa
inner join rh.atividade at on
	at.id_atividade = vg.id_atividade
left join numero_turmas nt on
	nt.id_unidade_escola = u.id_unidade
left join numero_alunos na on
	na.id_unidade_escola = u.id_unidade
left join comum.unidade uniResponsavel on
	uniResponsavel.id_unidade = u.id_responsavel
left join comum.municipio m on
	m.id_municipio = u.id_municipio
left join rh.servidor se on
	se.id_servidor = vg.id_servidor
left join comum.pessoa pe on
	pe.id_pessoa = se.id_pessoa
left join rh.cargo c on
	c.id_cargo = se.id_cargo
left join ensino.turno t on
	t.id_turno = vg.id_turno
left join escola.escola e on
	e.id_unidade_escola = u.id_unidade
where
	vg.ativo = true
	and ( e.id_escola is null
		or e.id_situacao_funcionamento = 1 )
	and ( vg.dt_inicio <= 'Thu Aug 29 00:00:00 BRT 2024'
		or vg.dt_inicio is null )
union all
select
	'Administrativo' as tipo,
	uniResponsavel.nome as direc,
	m.nome as municipio,
	u.nome as unidade,
	a.descricao as areaAdministrativa,
	at.descricao as atividade,
	pe.nome as servidor,
	se.siape || '/' || se.digito_siape as siape,
	vh.data_inicio as dataAlocacao,
	vh.data_fim as dataFimAlocacao,
	c.denominacao as cargo,
	t.descricao as turno,
	at.codigo_rh as codigoFuncao,
	vh.ch_semanal as chAlocado,
	na.id_unidade_escola as idEscola,
	nt.numero_turmas as numeroTurmas,
	na.numero_alunos as numeroAlunos,
	se.admissao ,
	0 as ord1,
	0 as ord2,
	t.ordem as ord3
from
	pessoas.vaga_historico vh
join pessoas.vaga_administrativa vg on
	vg.id_vaga_administrativa = vh.id_vaga_administrativa
inner join comum.unidade u on
	u.id_unidade = vg.id_unidade
inner join pessoas.item_grupo_ordenacao igo on
	igo.id_tipo_unidade = u.tipo
inner join pessoas.grupo_ordenacao gor on
	gor.id_grupo_ordenacao = igo.id_grupo_ordenacao
left join numero_turmas nt on
	nt.id_unidade_escola = u.id_unidade
left join numero_alunos na on
	na.id_unidade_escola = u.id_unidade
inner join comum.unidade uniResponsavel on
	uniResponsavel.id_unidade = u.id_responsavel
left join comum.municipio m on
	m.id_municipio = u.id_municipio
inner join pessoas.area_administrativa a on
	a.id_area_administrativa = vg.id_area_administrativa
inner join pessoas.ordenacao_area_administrativa oad on
	oad.id_area_administrativa = a.id_area_administrativa
	and oad.id_grupo_ordenacao = gor.id_grupo_ordenacao
inner join rh.atividade at on
	at.id_atividade = vg.id_atividade
inner join pessoas.ordenacao_atividade oa on
	oa.id_atividade = vg.id_atividade
	and oa.id_grupo_ordenacao = gor.id_grupo_ordenacao
left join rh.servidor se on
	se.id_servidor = vh.id_servidor
left join comum.pessoa pe on
	pe.id_pessoa = se.id_pessoa
left join rh.cargo c on
	c.id_cargo = se.id_cargo
left join ensino.turno t on
	t.id_turno = vg.id_turno
where
	'Thu Aug 29 00:00:00 BRT 2024' between vh.data_inicio and vh.data_fim
union all
select
	'Sala de Aula' as tipo,
	uniResponsavel.nome as direc,
	m.nome as municipio,
	u.nome as unidade,
	ee.denominacao as areaAdministrativa,
	cc.nome as atividade,
	pe.nome as servidor,
	se.siape || '/' || se.digito_siape as siape,
	dt.data_inicio as dataAlocacao ,
	dt.data_fim as dataFimAlocacao,
	c.denominacao,
	t.descricao as turno,
	0 as codigoFuncao,
	sum(ch_dedicada_periodo) as chAlocado,
	esc.id_unidade_escola as idEscola,
	nt.numero_turmas as numeroTurmas,
	na.numero_alunos as numeroAlunos,
	se.admissao ,
	ee.id_etapa_ensino as ord1,
	0 as ord2,
	t.ordem as ord3
from
	ensino.docente_turma dt
inner join ensino.turma tu on
	tu.id_turma = dt.id_turma
inner join basico.turma_serie ts on
	ts.id_turma_serie = tu.id_turma_serie
inner join escola.escola esc on
	esc.id_escola = ts.id_escola
inner join comum.unidade u on
	u.id_unidade = esc.id_unidade_escola
left join numero_turmas nt on
	nt.id_unidade_escola = u.id_unidade
left join numero_alunos na on
	na.id_unidade_escola = u.id_unidade
left join comum.unidade uniResponsavel on
	uniResponsavel.id_unidade = u.id_responsavel
left join comum.municipio m on
	m.id_municipio = u.id_municipio
inner join basico.serie serie on
	serie.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on
	ee.id_etapa_ensino = serie.id_etapa_ensino
inner join ensino.componente_curricular cc on
	cc.id_componente_curricular = tu.id_disciplina
left join rh.servidor se on
	se.id_servidor = dt.id_docente
left join comum.pessoa pe on
	pe.id_pessoa = se.id_pessoa
left join rh.cargo c on
	c.id_cargo = se.id_cargo
left join rh.atividade at on
	se.id_atividade = at.id_atividade
left join ensino.turno t on
	t.id_turno = ts.id_turno
where
	dt.ativo = true
	and ( esc.id_escola is null
		or esc.id_situacao_funcionamento = 1 )
	and dt.data_fim >= 'Thu Aug 29 00:00:00 BRT 2024'
	and dt.data_inicio <= 'Thu Aug 29 00:00:00 BRT 2024'
group by
	uniResponsavel.nome,
	m.nome,
	u.nome,
	t.ordem,
	t.descricao,
	ee.id_etapa_ensino,
	ee.denominacao,
	cc.nome ,
	pe.nome,
	se.siape,
	se.digito_siape,
	se.siape,
	dt.data_inicio ,
	dt.data_fim,
	c.denominacao,
	at.ordem,
	idEscola,
	numeroTurmas,
	numeroAlunos,
	se.admissao
order by
	direc,
	municipio,
	unidade,
	turno,
	areaAdministrativa,
	tipo,
	atividade,
	servidor;
	
with numero_alunos as (
select
	e.id_unidade_escola,
	COUNT(distinct mes.id_estudante)::int numero_alunos
from
	escola.escola e
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola = e.id_escola
join basico.matricula_estudante_serie mes on
	mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
where
	mes.id_situacao_matricula_serie in ( 1, 2, 3, 7, 8, 10, 11, 12 )
	and mes.ano_calendario = 2024
group by
	1 ),
numero_turmas as (
select
	e.id_unidade_escola,
	COUNT(distinct ts.id_turma_serie)::int as numero_turmas
from
	escola.escola e
join basico.turma_serie ts
		using (id_escola)
join ensino.turma t on
	t.id_turma_serie = ts.id_turma_serie
		and t.id_situacao_turma <> (4)
	where
		ts.ativo
		and ts.progressao_parcial = false
		and ts.ano = 2024
		and t.tipo not in ( 4, 17, 9, 7 )
			and ts.id_tipo_turma_serie <> 2
		group by
			1 )
select
	'Administrativo' as tipo,
	uniResponsavel.nome as direc,
	m.nome as municipio,
	u.nome as unidade,
	a.descricao as areaAdministrativa,
	at.descricao as atividade,
	pe.nome as servidor,
	se.siape || '/' || se.digito_siape as siape,
	vg.dt_inicio as dataAlocacao,
	vg.dt_termino as dataFimAlocacao,
	c.denominacao as cargo,
	t.descricao as turno,
	at.codigo_rh as codigoFuncao ,
	ch_semanal as chAlocado,
	e.id_unidade_escola as idEscola,
	nt.numero_turmas as numeroTurmas,
	na.numero_alunos as numeroAlunos,
	se.admissao,
	0 as ord1,
	0 as ord2,
	t.ordem as ord3
from
	pessoas.vaga_administrativa vg
inner join comum.unidade u on
	u.id_unidade = vg.id_unidade
inner join pessoas.area_administrativa a on
	a.id_area_administrativa = vg.id_area_administrativa
inner join rh.atividade at on
	at.id_atividade = vg.id_atividade
left join numero_turmas nt on
	nt.id_unidade_escola = u.id_unidade
left join numero_alunos na on
	na.id_unidade_escola = u.id_unidade
left join comum.unidade uniResponsavel on
	uniResponsavel.id_unidade = u.id_responsavel
left join comum.municipio m on
	m.id_municipio = u.id_municipio
left join rh.servidor se on
	se.id_servidor = vg.id_servidor
left join comum.pessoa pe on
	pe.id_pessoa = se.id_pessoa
left join rh.cargo c on
	c.id_cargo = se.id_cargo
left join ensino.turno t on
	t.id_turno = vg.id_turno
left join escola.escola e on
	e.id_unidade_escola = u.id_unidade
where
	vg.ativo = true
	and ( e.id_escola is null
		or e.id_situacao_funcionamento = 1 )
	and ( vg.dt_inicio <= 'Thu Aug 29 00:00:00 BRT 2024'
		or vg.dt_inicio is null )
union all
select
	'Administrativo' as tipo,
	uniResponsavel.nome as direc,
	m.nome as municipio,
	u.nome as unidade,
	a.descricao as areaAdministrativa,
	at.descricao as atividade,
	pe.nome as servidor,
	se.siape || '/' || se.digito_siape as siape,
	vh.data_inicio as dataAlocacao,
	vh.data_fim as dataFimAlocacao,
	c.denominacao as cargo,
	t.descricao as turno,
	at.codigo_rh as codigoFuncao,
	vh.ch_semanal as chAlocado,
	na.id_unidade_escola as idEscola,
	nt.numero_turmas as numeroTurmas,
	na.numero_alunos as numeroAlunos,
	se.admissao ,
	0 as ord1,
	0 as ord2,
	t.ordem as ord3
from
	pessoas.vaga_historico vh
join pessoas.vaga_administrativa vg on
	vg.id_vaga_administrativa = vh.id_vaga_administrativa
inner join comum.unidade u on
	u.id_unidade = vg.id_unidade
inner join pessoas.item_grupo_ordenacao igo on
	igo.id_tipo_unidade = u.tipo
inner join pessoas.grupo_ordenacao gor on
	gor.id_grupo_ordenacao = igo.id_grupo_ordenacao
left join numero_turmas nt on
	nt.id_unidade_escola = u.id_unidade
left join numero_alunos na on
	na.id_unidade_escola = u.id_unidade
inner join comum.unidade uniResponsavel on
	uniResponsavel.id_unidade = u.id_responsavel
left join comum.municipio m on
	m.id_municipio = u.id_municipio
inner join pessoas.area_administrativa a on
	a.id_area_administrativa = vg.id_area_administrativa
inner join pessoas.ordenacao_area_administrativa oad on
	oad.id_area_administrativa = a.id_area_administrativa
	and oad.id_grupo_ordenacao = gor.id_grupo_ordenacao
inner join rh.atividade at on
	at.id_atividade = vg.id_atividade
inner join pessoas.ordenacao_atividade oa on
	oa.id_atividade = vg.id_atividade
	and oa.id_grupo_ordenacao = gor.id_grupo_ordenacao
left join rh.servidor se on
	se.id_servidor = vh.id_servidor
left join comum.pessoa pe on
	pe.id_pessoa = se.id_pessoa
left join rh.cargo c on
	c.id_cargo = se.id_cargo
left join ensino.turno t on
	t.id_turno = vg.id_turno
where
	'Thu Aug 29 00:00:00 BRT 2024' between vh.data_inicio and vh.data_fim
union all
select
	'Sala de Aula' as tipo,
	uniResponsavel.nome as direc,
	m.nome as municipio,
	u.nome as unidade,
	ee.denominacao as areaAdministrativa,
	cc.nome as atividade,
	pe.nome as servidor,
	se.siape || '/' || se.digito_siape as siape,
	dt.data_inicio as dataAlocacao ,
	dt.data_fim as dataFimAlocacao,
	c.denominacao,
	t.descricao as turno,
	0 as codigoFuncao,
	sum(ch_dedicada_periodo) as chAlocado,
	esc.id_unidade_escola as idEscola,
	nt.numero_turmas as numeroTurmas,
	na.numero_alunos as numeroAlunos,
	se.admissao ,
	ee.id_etapa_ensino as ord1,
	0 as ord2,
	t.ordem as ord3
from
	ensino.docente_turma dt
inner join ensino.turma tu on
	tu.id_turma = dt.id_turma
inner join basico.turma_serie ts on
	ts.id_turma_serie = tu.id_turma_serie
inner join escola.escola esc on
	esc.id_escola = ts.id_escola
inner join comum.unidade u on
	u.id_unidade = esc.id_unidade_escola
left join numero_turmas nt on
	nt.id_unidade_escola = u.id_unidade
left join numero_alunos na on
	na.id_unidade_escola = u.id_unidade
left join comum.unidade uniResponsavel on
	uniResponsavel.id_unidade = u.id_responsavel
left join comum.municipio m on
	m.id_municipio = u.id_municipio
inner join basico.serie serie on
	serie.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on
	ee.id_etapa_ensino = serie.id_etapa_ensino
inner join ensino.componente_curricular cc on
	cc.id_componente_curricular = tu.id_disciplina
left join rh.servidor se on
	se.id_servidor = dt.id_docente
left join comum.pessoa pe on
	pe.id_pessoa = se.id_pessoa
left join rh.cargo c on
	c.id_cargo = se.id_cargo
left join rh.atividade at on
	se.id_atividade = at.id_atividade
left join ensino.turno t on
	t.id_turno = ts.id_turno
where
	dt.ativo = true
	and ( esc.id_escola is null
		or esc.id_situacao_funcionamento = 1 )
	and dt.data_fim >= 'Thu Aug 29 00:00:00 BRT 2024'
	and dt.data_inicio <= 'Thu Aug 29 00:00:00 BRT 2024'
group by
	uniResponsavel.nome,
	m.nome,
	u.nome,
	t.ordem,
	t.descricao,
	ee.id_etapa_ensino,
	ee.denominacao,
	cc.nome ,
	pe.nome,
	se.siape,
	se.digito_siape,
	se.siape,
	dt.data_inicio ,
	dt.data_fim,
	c.denominacao,
	at.ordem,
	idEscola,
	numeroTurmas,
	numeroAlunos,
	se.admissao
order by
	direc,
	municipio,
	unidade,
	turno,
	areaAdministrativa,
	tipo,
	atividade,
	servidor;
