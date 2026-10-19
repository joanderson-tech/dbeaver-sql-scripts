select
	u.nome as dired,
	m.nome as municipio,
	es.nome as escola,
	tu.descricao as turno,
	count (*) as alunos,
	tu.id_turno
from
	basico.estudante e
join discente d on
	d.id_discente = e.id_estudante
join comum.pessoa p
		using (id_pessoa)
join basico.matricula_estudante_serie mes
		using (id_estudante)
join ensino.turno tu
		using (id_turno)
join basico.turma_serie ts
		using (id_turma_serie)
join escola.escola es
		using (id_escola)
join comum.unidade u on
	u.id_unidade = es.id_regional_ensino
join comum.municipio m on
	m.id_municipio = coalesce(es.id_municipio, u.id_municipio)
where
	e.id_estudante not in (
	select
		distinct rdi1.id_discente
	from
		transporte.rota r1
	join transporte.rota_detalhe rd1
			using (id_rota)
	join transporte.rota_discente rdi1
			using (id_rota)
	join transporte.rota_veiculo rv1
			using (id_rota)
	join transporte.veiculo v1
			using (id_veiculo)
	join escola.escola es1
			using (id_escola)
	join comum.unidade u1 on
		u1.id_unidade = es1.id_regional_ensino
	join comum.municipio m1 on
		m1.id_municipio = coalesce(es1.id_municipio, u1.id_municipio)
	where
		r1.ativo = trueValue()
		and (rdi1.data_fim is null
			or extract(year from rdi1.data_fim) >= 2025)
		and es1.id_escola = 70107728 )
	and mes.ano_calendario = 2025
	and e.utiliza_transporte_escolar_publico = trueValue()
	and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
	and es.id_escola = 70107728
group by
	u.nome,
	m.nome,
	es.nome,
	tu.descricao,
	tu.id_turno
order by
	u.nome,
	m.nome,
	es.nome,
	tu.id_turno,
	tu.descricao;
