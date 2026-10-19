


 SELECT ts.id_turma_serie, d.id_discente, d.matricula, p.nome, e.nome, r.descricao ,t.descricao ,rd.ativo
	from transporte.rota_discente rd
	join basico.estudante ee on ee.id_estudante = rd.id_discente
	join transporte.rota r on r.id_rota = rd.id_rota
	join discente d on d.id_discente = rd.id_discente
	join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente and mes.id_situacao_matricula_serie = 6
	join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
	join ensino.turno t on t.id_turno = ts.id_turno 
	join comum.pessoa p on p.id_pessoa = d.id_pessoa 
	join escola.escola e on e.id_escola = ts.id_escola
	where
		 --d.id_discente in (1363873,1367782 );
		--and ee.utiliza_transporte_escolar_publico = true
 		 not exists (
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
		and mes_ne.id_situacao_matricula_serie = 6
		and ts_ne.id_escola not in (
		select
			id_escola
		from
			transporte.escola_multipla_alocacao_aluno emaa
		where
			emaa.ativo) )
		--and e.id_escola = 1402162
		--and mes.id_situacao_matricula_serie = 6
		--and p.nome = 'ALEXIA ALMEIDA DE SOUZA'
		--and e.nome = 'ESCOLA MUNICIPAL MANSUETO DE LAVOR'
	order by
	e.nome, p.nome;



select * from transporte.rota_discente rd where rd.id_discente in (1402162);
-- Auto-generated SQL script #202505281607
UPDATE transporte.rota_discente
	SET ativo=true
	WHERE id_rota_discente=17507;


select * from basico.matricula_estudante_serie mes where mes.id_estudante  in (1363873,1367782 );

select * from transporte.rota r where r.descricao = '155';
select p.nome, * from transporte.rota_discente rd 
join discente d on d.id_discente = rd.id_discente
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where D.id_discente = 1404830
and rd.ativo = TRUE;

basico.matricula_estudante_serie mes_ne


-- Auto-generated SQL script #202505281418
UPDATE transporte.rota_discente SET ativo=false WHERE id_rota_discente=28391;
UPDATE transporte.rota_discente SET ativo=false WHERE id_rota_discente=28398;



UPDATE transporte.rota_discente SET ativo=true WHERE id_rota_discente=28391;
UPDATE transporte.rota_discente SET ativo=true WHERE id_rota_discente=28398;
