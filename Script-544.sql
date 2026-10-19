select
	distinct es.nome as escola,
	p.nome as estudante,
	d.matricula,
	mes.id_estudante,
	pne.id_pessoa,
	es.id_escola
from
	basico.estudante e
join basico.matricula_estudante_serie mes
		using (id_estudante)
join ensino.turno tu
		using (id_turno)
join basico.turma_serie ts
		using (id_turma_serie)
join escola.escola es
		using (id_escola)
join discente d on
	d.id_discente = e.id_estudante
join comum.pessoa p
		using (id_pessoa)
left join comum.pessoa_necessidade_especial pne on
	pne.id_pessoa = p.id_pessoa
left join transporte.rota_discente rd
		using (id_discente)
where
	mes.id_situacao_matricula_serie = 1
	and es.id_escola = 52232899
	and tu.id_turno in (2, 1)
	and e.utiliza_transporte_escolar_publico = true
	and not exists (
	select
		*
	from
		transporte.rota_discente rd
	join basico.matricula_estudante_serie mes_ne on
		mes_ne.id_estudante = rd.id_discente
	join basico.turma_serie ts_ne on
		ts_ne.id_turma_serie = mes_ne.id_turma_serie
	where
		rd.id_discente = d.id_discente
		and rd.ativo
		and mes_ne.id_situacao_matricula_serie = 1
		and ts_ne.id_escola not in (
		select
			id_escola
		from
			transporte.escola_multipla_alocacao_aluno emaa
		where
			emaa.ativo) )
order by
	es.id_escola;


select
	u.nome as dired,
	m.nome,
	e.nome as escola,
	t.descricao as turno,
	v.placa,
	r.descricao as nome_rota,
	COUNT(distinct d.id_discente) as alunos,
	t.id_turno
from
	transporte.rota r
join transporte.rota_detalhe rd
		using (id_rota)
join transporte.rota_discente rdi
		using (id_rota)
join transporte.rota_veiculo rv
		using (id_rota)
join discente d
		using (id_discente)
join comum.pessoa p
		using (id_pessoa)
join transporte.veiculo v
		using (id_veiculo)
join ensino.turno t
		using (id_turno)
join basico.matricula_estudante_serie mes on
	mes.id_estudante = d.id_discente
join basico.turma_serie ts
		using (id_turma_serie)
join escola.escola e on
	e.id_escola = rd.id_escola
	and e.id_escola = ts.id_escola
join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
join comum.municipio m on
	m.id_municipio = coalesce(e.id_municipio, u.id_municipio)
where
	rv.ativo = trueValue()
	and (rdi.data_fim is null or DATE(rdi.data_fim) >= DATE(NOW()))
	and r.ativo = trueValue()
	and rdi.ativo
	and r.id_rota = 70844356
group by
	u.nome,
	m.nome,
	e.nome,
	t.descricao,
	v.placa,
	r.descricao,
	t.id_turno
order by
	u.nome,
	m.nome,
	e.nome,
	t.id_turno,
	t.descricao,
	v.placa,
	r.descricao;


