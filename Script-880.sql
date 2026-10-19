select
	mee.id_movimentacao_estudante_escola as ID_MOVIMENTAÇÃO, '' as MATRICCULA,
	tst.denominacao as TIPO,
	sms.descricao as STATUS,
	discente.matricula as MATRICULA,
	pessoa.nome as NOME_PESSOA,
	escola.nome as ESCOLA_,
	mee.escola_municipal_privada as ESCOLA_PRIVADA 
	
	
	from basico.matricula_estudante_serie mes
inner join basico.estudante estudante on
	estudante.id_estudante = mes.id_estudante
inner join public.discente discente on
	discente.id_discente = estudante.id_estudante
inner join comum.pessoa pessoa on
	pessoa.id_pessoa = discente.id_pessoa
inner join matricula.movimentacao_estudante_escola mee on
	mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	and mee.id_movimentacao_estudante_escola = (
	select
		id_movimentacao_estudante_escola
	from
		matricula.movimentacao_estudante_escola mee
	where
		id_matricula_estudante_serie = mes.id_matricula_discente_serie
	order by
		id_movimentacao_estudante_escola desc
	limit 1 )
inner join matricula.tipo_solicitacao_transferencia tst on
	tst.id_tipo_solicitacao_transferencia = mee.id_tipo_sol_transferencia
inner join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
inner join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
inner join escola.escola escola on
	escola.id_escola = eees.id_escola
inner join basico.serie serie on
	serie.id_serie = eees.id_serie
inner join basico.etapa_ensino etapaEnsino on
	etapaEnsino.id_etapa_ensino = serie.id_etapa_ensino
where
	mes.id_situacao_matricula_serie = 6
	and mee.id_tipo_sol_transferencia in (3, 4, 5)
	and mes.ano_calendario = 2025
order by
	pessoa.nome ;
