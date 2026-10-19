select p from discente d join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where p.nome ilike '%JUDSON COSTA AMARAL DA SILVA%';

--991313 discente 764303 pessoa 54299013  mes--1373703   

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 991313; and mes.ano_calendario = 2025;

select * from educacao_especial.atendimento_educacao_especial;

select * from educacao_especial.atendimento_educacao_especial_estudante aeee 
where aeee.id_atendimento_educacao_especial_estudante in (54288251,54289732);

select aeee.id_atendimento_educacao_especial_estudante, aeeh.hora_inicio, aeeh.hora_fim, aeee.id_estudante, aeee.data_cadastro  from educacao_especial.atendimento_educacao_especial_estudante aeee  
join educacao_especial.atendimento_educacao_especial_horario aeeh  on aeeh.id_atendimento_educacao_especial_horario = aeee.id_atendimento_educacao_especial_horario 
where aeee.id_estudante = 991313
and aeee.ativo = true;

54288251
54289732

select
	distinct aeh.id_atendimento_educacao_especial_horario,
	h.id_horario,
	aet.id_atendimento_educacao_especial_turma,
	aeh.dia,
	aeh.ativo,
	h.inicio,
	h.fim,
	a.id_atendimento_educacao_especial ,
	a.nome,
	(case
		when(select count(ah.id_atendimento_educacao_especial_horario) from educacao_especial.atendimento_educacao_especial_horario ah join educacao_especial.atendimento_educacao_especial_estudante am using(id_atendimento_educacao_especial_horario) where am.id_atendimento_educacao_especial_horario = aeh.id_atendimento_educacao_especial_horario and am.ativo and ah.ativo group by ah.id_atendimento_educacao_especial_horario) is not null then true
		else false
	end) as is_estudante
from
	basico.turma_serie ts
join ensino.turma t
		using (id_turma_serie)
join educacao_especial.atendimento_educacao_especial_turma aet on
	( aet.id_turma = t.id_turma )
join educacao_especial.atendimento_educacao_especial_horario aeh on
	( aeh.id_atendimento_educacao_especial_turma = aet.id_atendimento_educacao_especial_turma )
join educacao_especial.atendimento_educacao_especial a on
	( a.id_atendimento_educacao_especial = aet.id_atendimento_educacao_especial )
join ensino.horario h on
	( aeh.id_horario = h.id_horario
		and h.ativo )
where
	ts.id_turma_serie = 53956438
	and aeh.ativo = true
order by
	aeh.dia,
	h.inicio;



select
	distinct dired.id_unidade as id_dired,
	p.nome as estudante,
	esc.id_escola,
	hh.inicio,
	hh.fim,
	ah.dia,
	esc.nome as escola,
	ts.nome as turma,
	dt.ch_dedicada_periodo as ch,
	s.siape || '/' || s.digito_siape as matricula_servidor,
	professor.nome as professor,
	a.nome as atendimento,
	p.cpf_cnpj as cpf,
	p.codigo_inep as cod_censo,
	d.matricula as matricula_estudante,
	concat( case when '0' = ah.dia then 'DOM' when '2' = ah.dia then 'SEG' when '3' = ah.dia then 'TER' when '4' = ah.dia then 'QUA' when '5' = ah.dia then 'QUI' when '6' = ah.dia then 'SEX' when '7' = ah.dia then 'SÁB' end) as Dia_Semana,
	p.nome,
	p.id_pessoa
from educacao_especial.atendimento_educacao_especial_turma t
join educacao_especial.atendimento_educacao_especial_horario ah using(id_atendimento_educacao_especial_turma)
join educacao_especial.atendimento_educacao_especial_estudante am using(id_atendimento_educacao_especial_horario)
join educacao_especial.atendimento_educacao_especial a using (id_atendimento_educacao_especial)
join ensino.horario hh on hh.id_horario = ah.id_horario
join ensino.turma tt using (id_turma)
left join ensino.docente_turma dt on
	dt.ativo = true
	and dt.id_turma = t.id_turma
	and dt.data_fim > now()
left join rh.servidor s on s.id_servidor = dt.id_docente
left join comum.pessoa professor on professor.id_pessoa = s.id_pessoa
join basico.turma_serie ts using (id_turma_serie)
join ensino.turno tr on (tr.id_turno = ts.id_turno)
left join escola.escola esc using (id_escola)
left join comum.municipio mun using (id_municipio)
left join comum.unidade dired on (dired.id_unidade = esc.id_regional_ensino )
join discente d on (am.id_estudante = d.id_discente)
join comum.pessoa p on (p.id_pessoa = d.id_pessoa)
join comum.pessoa_necessidade_especial pne on (pne.id_pessoa = p.id_pessoa)
where
	1 = 1
	and tt.ano = 2025
	and p.id_pessoa = 764303
	--and ts.id_escola = 1650
	and esc.id_regional_ensino = 1
	and esc.id_municipio = 2402600
	and t.ativo = true
	and am.ativo = true
	and ah.ativo = true
	and tt.id_situacao_turma in ( 1, 2, 3 )
order by
	esc.nome,
	ts.nome,
	p.nome;
















