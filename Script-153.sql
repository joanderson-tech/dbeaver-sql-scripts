select
	count(*) as col_0_0_
from
	basico.matricula_estudante_serie matriculae0_
inner join basico.estudante estudante1_ on
	matriculae0_.id_estudante = estudante1_.id_estudante
inner join discente discente2_ on
	estudante1_.id_estudante = discente2_.id_discente
inner join comum.pessoa pessoa3_ on
	discente2_.id_pessoa = pessoa3_.id_pessoa
left outer join comum.municipio municipio13_ on
	pessoa3_.id_municipio_contato = municipio13_.id_municipio
left outer join basico.turma_serie turmaserie4_ on
	matriculae0_.id_turma_serie = turmaserie4_.id_turma_serie
left outer join ensino.turno turno5_ on
	turmaserie4_.id_turno = turno5_.id_turno
left outer join escola.escola_etapa_ensino_serie escolaetap6_ on
	matriculae0_.id_serie_escola = escolaetap6_.id_escola_etapa_ensino_serie
left outer join basico.serie serie7_ on
	escolaetap6_.id_serie = serie7_.id_serie
left outer join basico.etapa_ensino etapaensin8_ on
	serie7_.id_etapa_ensino = etapaensin8_.id_etapa_ensino
left outer join escola.escola escola9_ on
	escolaetap6_.id_escola = escola9_.id_escola
left outer join comum.municipio municipio10_ on
	escola9_.id_municipio = municipio10_.id_municipio
left outer join basico.situacao_matricula_serie situacaoma11_ on
	matriculae0_.id_situacao_matricula_serie = situacaoma11_.id_situacao_matricula_serie
where
	1 = 1
	and (matriculae0_.id_turma_serie is not null)
	and matriculae0_.id_situacao_matricula_serie = 6
	and (matriculae0_.id_matricula_discente_serie in (
	select
		movimentac14_.id_matricula_estudante_serie
	from
		matricula.movimentacao_estudante_escola movimentac14_
	where
		movimentac14_.ativo = true
		and (movimentac14_.id_tipo_sol_transferencia in (5 , 3))
			and movimentac14_.id_situacao_matricula_serie <> 6
			and not (exists (
			select
				1
			from
				matricula.movimentacao_estudante_escola movimentac15_
			where
				movimentac15_.id_situacao_matricula_serie = 6
				and movimentac15_.id_matricula_estudante_serie = movimentac14_.id_matricula_estudante_serie
				and movimentac15_.id_movimentacao_estudante_escola>movimentac14_.id_movimentacao_estudante_escola))))
	and escolaetap6_.id_escola = 52232908
	and matriculae0_.ano_calendario = 2024
	
	select
	estudante1_.id_estudante as col_0_0_,
	discente2_.id_discente as col_1_0_,
	discente2_.matricula as col_2_0_,
	pessoa3_.nome_responsavel_matricula as col_3_0_,
	pessoa3_.tipo_documento_responsavel_matricula as col_4_0_,
	pessoa3_.numero_documento_responsavel_matricula as col_5_0_,
	pessoa3_.codigo_inep as col_6_0_,
	pessoa3_.nome as col_7_0_,
	pessoa3_.bairro as col_8_0_,
	discente2_.status as col_9_0_,
	discente2_.data_cadastro as col_10_0_,
	matriculae0_.id_matricula_discente_serie as col_11_0_,
	serie7_.descricao as col_12_0_,
	etapaensin8_.denominacao as col_13_0_,
	escola9_.nome as col_14_0_,
	escola9_.codigo_inep as col_15_0_,
	municipio10_.nome as col_16_0_,
	situacaoma11_.id_situacao_matricula_serie as col_17_0_,
	situacaoma11_.descricao as col_18_0_,
	matriculae0_.ano_calendario as col_19_0_,
	matriculae0_.periodo as col_20_0_,
	matriculae0_.data_cadastro as col_21_0_,
	matriculae0_.data_atualizacao as col_22_0_,
	pessoa3_.cpf_cnpj as col_23_0_,
	pessoa3_.data_nascimento as col_24_0_,
	pessoa3_.nome_mae as col_25_0_,
	pessoa3_.nome_pai as col_26_0_,
	turmaserie4_.nome as col_27_0_,
	turno5_.descricao as col_28_0_
from
	basico.matricula_estudante_serie matriculae0_
inner join basico.estudante estudante1_ on
	matriculae0_.id_estudante = estudante1_.id_estudante
inner join discente discente2_ on
	estudante1_.id_estudante = discente2_.id_discente
inner join comum.pessoa pessoa3_ on
	discente2_.id_pessoa = pessoa3_.id_pessoa
left outer join comum.municipio municipio13_ on
	pessoa3_.id_municipio_contato = municipio13_.id_municipio
left outer join basico.turma_serie turmaserie4_ on
	matriculae0_.id_turma_serie = turmaserie4_.id_turma_serie
left outer join ensino.turno turno5_ on
	turmaserie4_.id_turno = turno5_.id_turno
left outer join escola.escola_etapa_ensino_serie escolaetap6_ on
	matriculae0_.id_serie_escola = escolaetap6_.id_escola_etapa_ensino_serie
left outer join basico.serie serie7_ on
	escolaetap6_.id_serie = serie7_.id_serie
left outer join basico.etapa_ensino etapaensin8_ on
	serie7_.id_etapa_ensino = etapaensin8_.id_etapa_ensino
left outer join escola.escola escola9_ on
	escolaetap6_.id_escola = escola9_.id_escola
left outer join comum.municipio municipio10_ on
	escola9_.id_municipio = municipio10_.id_municipio
left outer join basico.situacao_matricula_serie situacaoma11_ on
	matriculae0_.id_situacao_matricula_serie = situacaoma11_.id_situacao_matricula_serie
where
	1 = 1
	and (matriculae0_.id_turma_serie is not null)
	and matriculae0_.id_situacao_matricula_serie = 6
	and (matriculae0_.id_matricula_discente_serie in (
	select
		movimentac28_.id_matricula_estudante_serie
	from
		matricula.movimentacao_estudante_escola movimentac28_
	where
		movimentac28_.ativo = true
		and (movimentac28_.id_tipo_sol_transferencia in (5 , 3))
			and movimentac28_.id_situacao_matricula_serie <> 6
			and not (exists (
			select
				1
			from
				matricula.movimentacao_estudante_escola movimentac29_
			where
				movimentac29_.id_situacao_matricula_serie = 6
				and movimentac29_.id_matricula_estudante_serie = movimentac28_.id_matricula_estudante_serie
				and movimentac29_.id_movimentacao_estudante_escola>movimentac28_.id_movimentacao_estudante_escola))))
	and escolaetap6_.id_escola = 52232908
	and matriculae0_.ano_calendario = 2024
order by
	matriculae0_.ano_calendario desc,
	escola9_.nome asc,
	pessoa3_.nome asc
;
