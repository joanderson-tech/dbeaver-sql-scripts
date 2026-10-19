select
	distinct
	e.nome as Escola,
	d.matricula,
	p.nome as nome_completo_aluno,
	t.codigo as Nome_turma,
	t.nome_professor as Professor_alocado
from
	educacao_especial.atendimento_educacao_especial_estudante aeee
join educacao_especial.atendimento_educacao_especial_horario aeeh on
	aeee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
join educacao_especial.atendimento_educacao_especial_turma aeet on
	aeeh.id_atendimento_educacao_especial_turma = aeet.id_atendimento_educacao_especial_turma
join ensino.turma t on
	aeet.id_turma = t.id_turma
join public.discente d on
	aeee.id_estudante = d.id_discente
join comum.pessoa p on
	d.id_pessoa = p.id_pessoa
join basico.turma_serie ts on 
	t.id_turma_serie = ts.id_turma_serie
join escola.escola e on
	e.id_escola = ts.id_escola
join basico.matricula_estudante_serie mes on
	mes.id_estudante = d.id_discente and
	mes.ano_calendario = t.ano 
where
	aeee.ativo
	and aeet.ativo
	and t.tipo = 4
	and t.id_situacao_turma <> 4
	and t.ano = 2025
	and mes.id_situacao_matricula_serie = 1
order by p.nome asc;