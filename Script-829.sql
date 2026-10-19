select
	solicitaca1_.numero,
	escola15_.id_escola,
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
	and (upper(escola15_.nome) Ilike '%Escola Municipal de Educação Básica Professora Sinhá Barbosa%')
order by
	solicitaca1_.numero desc;