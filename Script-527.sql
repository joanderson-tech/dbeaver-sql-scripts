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
	and es.id_escola = 70107728
	and tu.id_turno in (518766200, 1)
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
	es.id_escola ;

--ABIMAEL EVANGELISTA DE SOUSA
--ABNER HENRIQUE DA SILVA SOUZA
--AIRTON JACKSON HORLANDO DA CONCEICAO
--AIRTON JACKSON HORLANDO DA CONCEICAO
--ALLISON NICOLAS DE OLIVEIRA ARAUJO
--ALLISON NICOLAS DE OLIVEIRA ARAUJO
--ANA CAROLINA DE SOUZA DA SILVA


--select * from transporte.rota_discente rd where rd.id_discente = d.id_discente and rd.ativo) ORDER BY es.id_escola

select
		*
from
		transporte.rota_discente rd
join basico.matricula_estudante_serie mes_ne on
		mes_ne.id_estudante = rd.id_discente
join basico.turma_serie ts_ne on
		ts_ne.id_turma_serie = mes_ne.id_turma_serie
where
		rd.id_discente in (	1440375, 1398538, 1401881, 1437419, 1395557, 1021753, 1398282)
		and rd.ativo
		and mes_ne.id_situacao_matricula_serie = 1;


select * from transporte.rota_discente rd where rd.id_discente = 1021753;
	
select * from	transporte.escola_multipla_alocacao_aluno emaa;

begin;
INSERT INTO transporte.escola_multipla_alocacao_aluno (id, ativo, id_escola) VALUES(10, true, 70107728);

DELETE FROM transporte.escola_multipla_alocacao_aluno WHERE id=10;

commit;