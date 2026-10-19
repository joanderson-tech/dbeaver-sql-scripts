select * from ensino.turma t where t.id_turma = 723568;


select * 
from  discente d 
where d.matricula = '202430006233'; -- 1006166


select aeepa.* from educacao_especial.atendimento_educacao_especial_estudante  aeee
join educacao_especial.atendimento_educacao_especial_plano_atendimento aeepa on 
aeepa.id_atendimento_educacao_especial_estudante = aeee.id_atendimento_educacao_especial_estudante 
where aeepa.id_atendimento_educacao_especial_estudante = 56593341;  ilike '%teste000000000000000000000001%';

select * from educacao_especial.atendimento_educacao_especial_plano_atendimento where descricao  ilike '%teste000000000000000000000001%';

-- id_atendimento_educacao_especial_estudante 56593341 referente ao dia/Horário: Terça 07:00 às 08:00

select * from educacao_especial.atendimento_educacao_especial at;

SELECT h.* FROM ensino.horario AS h
WHERE id_horario = 56593341;

56593341

idEstudanteHorario

SELECT * FROM educacao_especial.atendimento_educacao_especial_acompanhamento; AS aeeh
WHERE aeeh.id_atendimento_educacao_especial_estudante     = 56593341;

select
	distinct at.id_atendimento_educacao_especial,
	at.nome
from
	ensino.turma t
join educacao_especial.atendimento_educacao_especial_turma aet on
	( aet.id_turma = t.id_turma )
join ensino.docente_turma dt on
	dt.id_turma = t.id_turma
	and dt.ativo = true
	and ( dt.data_fim > '17/09/2025'
		or (
		select
			COUNT(*)
		from
			ensino.docente_turma sdt
		where
			sdt.id_turma = t.id_turma
			and sdt.ativo = true
			and sdt.id_docente_turma > dt.id_docente_turma) = 0)
join educacao_especial.atendimento_educacao_especial at
		using (id_atendimento_educacao_especial)
where
	dt.id_docente = 77823;


select
	distinct t.id_turma,
	t.codigo
from
	ensino.turma t
join basico.turma_serie ts on
	(t.id_turma_serie = ts.id_turma_serie)
join educacao_especial.atendimento_educacao_especial_turma aet on
	( aet.id_turma = t.id_turma )
join ensino.docente_turma dt on
	dt.id_turma = t.id_turma
	and dt.ativo = true
	and ( dt.data_fim > '17/09/2025'
		or (
		select
			COUNT(*)
		from
			ensino.docente_turma sdt
		where
			sdt.id_turma = t.id_turma
			and sdt.ativo = true
			and sdt.id_docente_turma > dt.id_docente_turma) = 0)
join educacao_especial.atendimento_educacao_especial at
		using (id_atendimento_educacao_especial)
where
	dt.id_docente = 77823
	and ts.ativo
	and ts.ano = 2025
	and t.id_situacao_turma <> 4
	
	select * from comum.usuario u where u.id_usuario = 107510