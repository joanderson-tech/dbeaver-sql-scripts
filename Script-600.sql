select
	distinct e.id_estudante,
	p.nome,
	d.matricula,
	pne.id_pessoa
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
	r.id_rota = 61009240
	and rd.ativo = true
	and es.id_escola = (52232899) ;

select
	u.nome as dired,
	tu.descricao,
	m.nome as municipio,
	es.nome as escola,
	tu.descricao as turno,
	p.nome as estudante,
	d.matricula,
	p.cpf_cnpj
from
	basico.estudante e
join discente d on d.id_discente = e.id_estudante
join comum.pessoa p using (id_pessoa)
join basico.matricula_estudante_serie mes using (id_estudante)
join ensino.turno tu using (id_turno)
join basico.turma_serie ts using (id_turma_serie)
join escola.escola es using (id_escola)
join comum.municipio m on m.id_municipio = es.id_municipio
join comum.unidade u on u.id_unidade = es.id_regional_ensino
where
	e.id_estudante not in (
	select distinct rdi1.id_discente
	from transporte.rota r1
	join transporte.rota_detalhe rd1 using (id_rota)
	join transporte.rota_discente rdi1 using (id_rota)
	join transporte.rota_veiculo rv1 using (id_rota)
	join transporte.veiculo v1 using (id_veiculo)
	join escola.escola es1 using (id_escola)
	join comum.unidade u1 on u1.id_unidade = es1.id_regional_ensino
	join comum.municipio m1 on m1.id_municipio = es1.id_municipio
	where
		r1.ativo = trueValue()
		and (rdi1.data_fim is null or extract(year from rdi1.data_fim) >= 2025)
		--and es1.id_escola = 52232899 
		)
	and mes.ano_calendario = 2025
	and e.utiliza_transporte_escolar_publico = true
	and mes.id_situacao_matricula_serie in (1)
	and es.id_escola = 52232849
	and tu.id_turno in (2, 1)
order by
	u.nome,
	m.nome,
	es.nome,
	tu.descricao,
	p.nome;


	select
			*
		from
			transporte.escola_multipla_alocacao_aluno emaa
		where
			emaa.ativo;
	
	

	
SELECT e.*
FROM escola.escola AS e
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL NOSSA SENHORA DAS %';


select
	u.nome as dired,
	tu.descricao,
	m.nome as municipio,
	es.nome as escola,
	tu.descricao as turno,
	p.nome as estudante,
	d.matricula,
	p.cpf_cnpj
from
	basico.estudante e
join discente d on d.id_discente = e.id_estudante
join comum.pessoa p using (id_pessoa)
join basico.matricula_estudante_serie mes using (id_estudante)
join ensino.turno tu using (id_turno)
join basico.turma_serie ts using (id_turma_serie)
join escola.escola es using (id_escola)
join comum.municipio m on m.id_municipio = es.id_municipio
join comum.unidade u on u.id_unidade = es.id_regional_ensino
where mes.ano_calendario = 2025
	and e.utiliza_transporte_escolar_publico = true
	and mes.id_situacao_matricula_serie in (1)
	and es.id_escola = 52232849
	and tu.id_turno in (2, 1);


select distinct rdi1.id_discente
	from transporte.rota r1
	join transporte.rota_detalhe rd1 using (id_rota)
	join transporte.rota_discente rdi1 using (id_rota)
	join transporte.rota_veiculo rv1 using (id_rota)
	join transporte.veiculo v1 using (id_veiculo)
	join escola.escola es1 using (id_escola)
	join comum.unidade u1 on u1.id_unidade = es1.id_regional_ensino
	join comum.municipio m1 on m1.id_municipio = es1.id_municipio
	where
		r1.ativo = trueValue()
		--and (rdi1.data_fim is null or extract(year from rdi1.data_fim) >= 2025)
		--and es1.id_escola = 52232899
	and	rdi1.id_discente  in (1391559,1363873,1367782 );

select * from basico.matricula_estudante_serie mes where mes.id_estudante  in (1373567);



select *
	from transporte.rota_discente rd
	join basico.matricula_estudante_serie mes_ne on mes_ne.id_estudante = rd.id_discente
	join basico.turma_serie ts_ne on ts_ne.id_turma_serie = mes_ne.id_turma_serie
	where
		 rd.ativo
		and mes_ne.id_situacao_matricula_serie = 1
		and ts_ne.id_escola not in (
		select
			id_escola
		from
			transporte.escola_multipla_alocacao_aluno emaa
		where
			emaa.ativo) ;

select
	u.nome as dired,
	m.nome as municipio,
	es.nome as escola,
	tu.descricao as turno,
	p.nome as estudante,
	d.matricula,
	p.cpf_cnpj
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
join comum.municipio m on
	m.id_municipio = es.id_municipio
join comum.unidade u on
	u.id_unidade = es.id_regional_ensino
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
		m1.id_municipio = es1.id_municipio
	where
		r1.ativo = trueValue()
		and (rdi1.data_fim is null
			or extract(year from rdi1.data_fim) >= 2025)
		and es1.id_escola = 52232965 
		)
	and mes.ano_calendario = 2025
	and e.utiliza_transporte_escolar_publico = trueValue()
	and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
	and es.id_escola = 52232965
order by
	u.nome,
	m.nome,
	es.nome,
	tu.descricao,
	p.nome;


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
	and es.id_escola = 52232965
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


BEBEDOURO 


	