select
	t.id_turma,
	et.denominacao as etapa,
	s.descricao,
	tr.descricao as turno,
	t.codigo,
	cc.nome,
	tr.id_turno
from
	ensino.turma t
join basico.turma_serie ts
		using (id_turma_serie)
join basico.serie s
		using (id_serie)
join basico.etapa_ensino et on
	(et.id_etapa_ensino = s.id_etapa_ensino)
join ensino.componente_curricular cc on
	(cc.id_componente_curricular = t.id_disciplina)
join ensino.turno tr on
	( tr.id_turno = ts.id_turno )
where
	ts.id_escola = :idEscola
	and ts.ano = :ano
	and id_turma_agrupadora is null
order by
	et.denominacao,
	tr.id_turno,
	s.descricao,
	t.codigo
	
	
	

select
	t.id_turma,
	et.denominacao as etapa,
	s.descricao,
	tr.descricao as turno,
	t.codigo,
	cc.nome,
	tr.id_turno
from
	ensino.turma t
join basico.turma_serie ts
		using (id_turma_serie)
join basico.serie s
		using (id_serie)
join basico.etapa_ensino et on
	(et.id_etapa_ensino = s.id_etapa_ensino)
join ensino.componente_curricular cc on
	(cc.id_componente_curricular = t.id_disciplina)
join ensino.turno tr on
	( tr.id_turno = ts.id_turno )
where
	ts.id_escola = 52232930
	and ts.ano = 2024
order by
	et.denominacao,
	tr.id_turno,
	s.descricao,
	t.codigo;