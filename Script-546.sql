select
	distinct e.id_estudante,
	p.nome,
	d.matricula,
	pne.id_pessoa,
	mes.id_situacao_matricula_serie
from
	basico.estudante e
join discente d on
	d.id_discente = e.id_estudante
join transporte.rota_discente rd
		using (id_discente)
join transporte.rota r on
	r.id_rota = rd.id_rota
join basico.matricula_estudante_serie mes
		using (id_estudante)
join basico.turma_serie ts
		using (id_turma_serie)
join escola.escola es
		using (id_escola)
join comum.pessoa p
		using (id_pessoa)
left join comum.pessoa_necessidade_especial pne on
	pne.id_pessoa = p.id_pessoa
where
	r.id_rota = 70844356
	and rd.ativo = true
	and es.id_escola = (52232899);