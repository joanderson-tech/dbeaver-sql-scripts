select
	distinct ts.id_turma_serie,
	ts.ano,
	ts.nome,
	ts.capacidade_aluno,
	ts.ativo,
	s.id_serie,
	s.descricao,
	s.numero,
	ee.id_etapa_ensino,
	ee.denominacao,
	nee.id_nivel_etapa_ensino,
	nee.denominacao,
	turno.id_turno,
	turno.descricao
from
	basico.turma_serie ts
inner join ensino.turno turno on
	turno.id_turno = ts.id_turno
inner join basico.serie s on
	s.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
inner join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
inner join escola.escola_etapa_ensino_serie eees on
	eees.id_serie = s.id_serie
inner join escola.escola esc on
	esc.id_escola = eees.id_escola
	and ts.id_escola = esc.id_escola
where
	1 = 1
	and ts.ano = 2024
	and eees.id_escola = 52232930
	and ts.ativo = true
order by
	ee.denominacao,
	s.descricao 