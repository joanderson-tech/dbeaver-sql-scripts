select
	*
from
	(
	select
		mes.id_matricula_discente_serie,
		ts.nome as nome_etapa,
		s.id_serie,
		s.descricao as serie,
		ee.id_etapa_ensino,
		ee.denominacao,
		p.nome,
		p.data_nascimento,
		d.matricula,
		tr.descricao as turno,
		mes.id_situacao_matricula_serie,
		sms.descricao,
		tr.id_turno,
		serie_mult.id_serie as serie_mult,
		serie_mult.descricao as descricao_serie_mult,
		p.bairro
	from
		basico.matricula_estudante_serie mes
	inner join discente d on
		d.id_discente = mes.id_estudante
	inner join comum.pessoa p on
		p.id_pessoa = d.id_pessoa
	inner join escola.escola_etapa_ensino_serie ees on
		ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
	inner join basico.turma_serie ts on
		ts.id_escola = ees.id_escola
	inner join basico.serie s on
		s.id_serie = ts.id_serie
	inner join basico.etapa_ensino ee on
		ee.id_etapa_ensino = s.id_etapa_ensino
	inner join basico.nivel_etapa_ensino nee on
		nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
	inner join ensino.turno tr on
		tr.id_turno = ts.id_turno
	inner join basico.situacao_matricula_serie sms on
		(sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie)
	left join basico.serie serie_mult on
		(serie_mult.id_serie = mes.id_serie_multisseriado)
	where
		ts.ano = 2024
		and ts.ativo = true
		and ts.id_tipo_turma_serie in ( 1, 3, 5, 4 )
		and tr.id_turno = 2
		and mes.id_turma_serie = ts.id_turma_serie
		and mes.id_situacao_matricula_serie not in ( 5, 12 )
union
	select
		mes.id_matricula_discente_serie,
		ts.nome as nome_etapa,
		s.id_serie,
		s.descricao as serie,
		ee.id_etapa_ensino,
		ee.denominacao,
		p.nome,
		p.data_nascimento,
		d.matricula,
		tr.descricao as turno,
		0,
		'EDUCAÇÃO ESPECIAL',
		tr.id_turno,
		serie_mult.id_serie as serie_mult,
		serie_mult.descricao as descricao_serie_mult,
		p.bairro
	from
		educacao_especial.atendimento_educacao_especial_turma aeet
	join educacao_especial.atendimento_educacao_especial_horario aeeh on
		aeet.id_atendimento_educacao_especial_turma = aeeh.id_atendimento_educacao_especial_turma
		and aeeh.ativo
	join educacao_especial.atendimento_educacao_especial_estudante aeee on
		aeee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
		and aeee.ativo
	join ensino.turma t on
		aeet.id_turma = t.id_turma
	join basico.turma_serie ts on
		t.id_turma_serie = ts.id_turma_serie
	join basico.serie s on
		s.id_serie = ts.id_serie
	join basico.etapa_ensino ee on
		ee.id_etapa_ensino = s.id_etapa_ensino
	join discente d on
		aeee.id_estudante = d.id_discente
	join basico.matricula_estudante_serie mes on
		mes.id_estudante = d.id_discente
		and mes.ano_calendario = ts.ano
	join comum.pessoa p on
		d.id_pessoa = p.id_pessoa
	join ensino.turno tr on
		tr.id_turno = ts.id_turno
	left join basico.serie serie_mult on
		(serie_mult.id_serie = mes.id_serie_multisseriado)
	where
		aeet.ativo
		and ts.ano = 2024
		and ts.ativo
		and ts.id_turno = 2
		and ts.id_tipo_turma_serie in ( 1, 3, 5, 4 )
		and mes.id_situacao_matricula_serie not in ( 5, 12 ) ) as est
order by
	est.id_turno,
	est.denominacao,
	est.descricao,
	est.nome_etapa,
	est.id_situacao_matricula_serie,
	est.nome;
	
select * from basico.situacao_matricula_serie sms