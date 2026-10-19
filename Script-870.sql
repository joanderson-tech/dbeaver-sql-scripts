select
	mee.id_movimentacao_estudante_escola,
	tst.denominacao,
	sms.descricao,
	discente.matricula,
	pessoa.nome,
	escola.nome,
	mee.escola_municipal_privada
from
	basico.matricula_estudante_serie mes
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
	and mee.id_tipo_sol_transferencia = 3
	--and upper(mee.escola_municipal_privada) like ('%Escola Municipal de Educação Básica Professora Sinhá Barbosa%')
order by
	pessoa.nome;

select
	solicitaca1_.numero,
	pessoa12_.nome,
	escola7_.nome,
	solicitaca0_.ordem,
	escola15_.nome,
	tiposolici14_.denominacao,
	municipio16_.nome,
	unidade18_.nome,
	statussoli20_.denominacao,
	solicitaca1_.visto_escola
from
	matricula.solicitacao_transferencia_opcao_escola solicitaca0_
inner join matricula.solicitacao_transferencia solicitaca1_ on
	solicitaca0_.id_solicitacao = solicitaca1_.id_solicitacao_transferencia
inner join basico.matricula_estudante_serie matriculae3_ on
	solicitaca1_.id_matricula_discente_serie = matriculae3_.id_matricula_discente_serie
left outer join escola.escola_etapa_ensino_serie escolaetap6_ on
	matriculae3_.id_serie_escola = escolaetap6_.id_escola_etapa_ensino_serie
left outer join escola.escola escola7_ on
	escolaetap6_.id_escola = escola7_.id_escola
inner join basico.estudante estudante10_ on
	matriculae3_.id_estudante = estudante10_.id_estudante
inner join discente discente11_ on
	estudante10_.id_estudante = discente11_.id_discente
inner join comum.pessoa pessoa12_ on
	discente11_.id_pessoa = pessoa12_.id_pessoa
inner join matricula.tipo_solicitacao_transferencia tiposolici14_ on
	solicitaca1_.id_tipo = tiposolici14_.id_tipo_solicitacao_transferencia
inner join matricula.status_solicitacao_transferencia statussoli20_ on
	solicitaca1_.id_status = statussoli20_.id_status_solicitacao_transferencia
inner join escola.escola escola15_ on
	solicitaca0_.id_escola = escola15_.id_escola
inner join comum.municipio municipio16_ on
	escola15_.id_municipio = municipio16_.id_municipio
inner join comum.unidade unidade18_ on
	escola15_.id_regional_ensino = unidade18_.id_unidade
where
	1 = 1
	and solicitaca1_.ano_escolar = 2025
	and solicitaca1_.id_tipo = 1
	and (upper(escola15_.nome) like '%Escola Municipal de Educação Básica Professora Sinhá Barbosa%')
order by
	solicitaca1_.numero desc;

SELECT tst.* FROM matricula.tipo_solicitacao_transferencia AS tst
