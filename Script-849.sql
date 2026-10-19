select
	p.nome as Nome,
	t.codigo as Turma,
	e.nome as Unidade,
	t.nome_professor as Professor,
	tn.id_turno as Turno
from
	educacao_especial.atendimento_educacao_especial_estudante aee
join educacao_especial.atendimento_educacao_especial_horario aeeh on
	aee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
join educacao_especial.atendimento_educacao_especial_turma aeet on
	aeeh.id_atendimento_educacao_especial_turma = aeet.id_atendimento_educacao_especial_turma
join ensino.turma t on
	aeet.id_turma = t.id_turma
join ensino.docente_turma dt on
	t.id_turma = dt.id_turma
join basico.turma_serie ts on
	t.id_turma_serie = ts.id_turma_serie
join discente d on
	aee.id_estudante = d.id_discente
join basico.matricula_estudante_serie mes on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	d.id_pessoa = d.id_pessoa
join escola.escola e on
	ts.id_escola = e.id_escola
join ensino.turno tn on
	ts.id_turno = tn.id_turno
where
	aee.ativo
	and aeet.ativo
	and t.id_situacao_turma <> 4
	and mes.ano_calendario = 2025
	and t.ano = 2025
	and mes.id_situacao_matricula_serie = 1
order by
	p.nome asc;