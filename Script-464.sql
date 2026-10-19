 with cte_professores as (
select
	sts.id_turno,
	sts.id_escola,
	count(distinct dt.id_docente) as qtdProfessores
from
	educacao_especial.atendimento_educacao_especial_turma st
join ensino.turma stt
		using (id_turma)
join basico.turma_serie sts
		using (id_turma_serie)
join educacao_especial.atendimento_educacao_especial_horario sh
		using (id_atendimento_educacao_especial_turma)
join ensino.docente_turma dt on
	dt.ativo = true
	and dt.id_turma = stt.id_turma
	and dt.data_fim > now()
join basico.curriculo_basico cb on
	cb.id_curriculo_basico = sts.id_curriculo_medio
join basico.serie s on
	s.id_serie = cb.id_serie
where
	sh.ativo = true
	and st.ativo = true
	and stt.id_situacao_turma in ( 1, 2, 3 )
	and s.id_etapa_ensino = 14
group by
	sts.id_turno,
	sts.id_escola),
cte_atendimentos as (
select
	e.id_turma,
	count(*) as qtdAtendimentos,
	count(distinct e.id_estudante) as qtdEstudantes
from
	(
	select
		distinct sts.id_turno,
		sts.id_escola,
		stt.id_turma,
		hh.inicio,
		hh.fim,
		sh.dia,
		se.id_estudante
	from
		educacao_especial.atendimento_educacao_especial_turma st
	join ensino.turma stt
			using (id_turma)
	join basico.turma_serie sts
			using (id_turma_serie)
	join educacao_especial.atendimento_educacao_especial_horario sh
			using (id_atendimento_educacao_especial_turma)
	join educacao_especial.atendimento_educacao_especial_estudante se
			using (id_atendimento_educacao_especial_horario)
	join ensino.horario hh on
		hh.id_horario = sh.id_horario
			and hh.ativo
		join discente d on
			d.id_discente = se.id_estudante
		join comum.pessoa p on
			p.id_pessoa = d.id_pessoa
		join comum.pessoa_necessidade_especial pne on
			pne.id_pessoa = p.id_pessoa
		join basico.curriculo_basico cb on
			cb.id_curriculo_basico = sts.id_curriculo_medio
		join basico.serie s on
			s.id_serie = cb.id_serie
		where
			se.ativo = true
			and sts.ano = 2025
			and sh.ativo = true
			and st.ativo = true
			and stt.id_situacao_turma in ( 1, 2, 3 )
			) as e
group by
	e.id_turma)
select
	MIN(esc.id_escola) as id_escola,
	MIN(dired.id_unidade) as id_dired,
	MIN(mun.id_municipio) as id_municipio,
	dired.nome as dired,
	mun.nome as municipio,
	esc.nome as escola,
	tr.descricao as turno,
	coalesce(MAX(cp.qtdProfessores), 0) as qtdProfessores,
	coalesce(MAX(ca.qtdAtendimentos), 0) as qtdAtendimentos,
	coalesce(MAX(ca.qtdEstudantes), 0) as qtdEstudantes,
	coalesce(count(distinct tt.id_turma) , 0) as qtdTurmas
from
	basico.turma_serie ts
join ensino.turma tt on
	tt.id_turma_serie = ts.id_turma_serie
join ensino.turno tr on
	tr.id_turno = ts.id_turno
join escola.escola esc
		using (id_escola)
join comum.municipio mun
		using (id_municipio)
join comum.unidade dired on
	dired.id_unidade = esc.id_regional_ensino
join basico.serie s on
	ts.id_serie = s.id_serie
left join educacao_especial.atendimento_educacao_especial_turma t on
	t.id_turma = tt.id_turma
	and t.ativo
left join educacao_especial.atendimento_educacao_especial_horario ah on
	ah.id_atendimento_educacao_especial_turma = t.id_atendimento_educacao_especial_turma
	and ah.ativo = true
left join educacao_especial.atendimento_educacao_especial_estudante am on
	am.id_atendimento_educacao_especial_horario = ah.id_atendimento_educacao_especial_horario
	and am.ativo
left join educacao_especial.tipo_atendimento_educacao_especial_estudante taeee on
	taeee.id_atendimento_especial_estudante = am.id_atendimento_educacao_especial_estudante
left join educacao_especial.tipo_atendimento_estudante_ee taee on
	taee.id = taeee.id_tipo
left join discente d on
	(am.id_estudante = d.id_discente)
left join comum.pessoa p
		using(id_pessoa)
 join comum.pessoa_necessidade_especial pne
		using (id_pessoa)
left join cte_professores cp on
	cp.id_turno = ts.id_turno
	and cp.id_escola = ts.id_escola
left join cte_atendimentos ca on
	ca.id_turma = tt.id_turma
where
	1 = 1
	--and ts.ativo
	--and s.id_etapa_ensino = 14
	and tt.id_situacao_turma in ( 1, 2, 3 )
	and tt.ano = 2025
	and ts.id_escola = 52232889
group by
	dired.nome,
	mun.nome,
	esc.nome,
	tr.descricao,
	tr.id_turno
order by
	dired.nome,
	mun.nome,
	esc.nome,
	tr.id_turno; 
 
 