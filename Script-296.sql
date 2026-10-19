select
	matriculae0_.id_matricula_discente_serie as col_0_0_,
	matriculae0_.id_estudante as col_1_0_,
	discente2_.matricula as col_2_0_,
	discente2_.id_pessoa as col_3_0_,
	pessoa7_.nome as col_4_0_,
	pessoa7_.nome_mae as col_5_0_,
	etapaensin13_.id_nivel_etapa as col_6_0_,
	etapaensin13_.denominacao as col_7_0_,
	serie12_.descricao as col_8_0_,
	matriculae0_.id_situacao_matricula_serie as col_9_0_,
	situacaoma19_.descricao as col_10_0_,
	(
	select
		count(*)
	from
		matricula.renovacao_matricula renovacaom20_
	where
		renovacaom20_.id_discente = matriculae0_.id_estudante
		and renovacaom20_.id_calendario_matricula =71558970
		and (renovacaom20_.id_registro_cancelamento is null)) as col_11_0_,
	(
	select
		count(solicitaca21_.id_solicitacao_transferencia)
	from
		matricula.solicitacao_transferencia solicitaca21_,
		basico.matricula_estudante_serie matriculae22_
	where
		solicitaca21_.id_matricula_discente_serie = matriculae22_.id_matricula_discente_serie
		and solicitaca21_.id_status <> 6
		and matriculae22_.id_estudante = matriculae0_.id_estudante
		and solicitaca21_.id_calendario_matricula =71558970) as col_12_0_
from
	basico.matricula_estudante_serie matriculae0_,
	basico.estudante estudante1_,
	discente discente2_,
	comum.pessoa pessoa7_,
	escola.escola_etapa_ensino_serie escolaetap11_,
	basico.serie serie12_,
	basico.etapa_ensino etapaensin13_,
	basico.situacao_matricula_serie situacaoma19_,
	escola.escola_etapa_ensino_serie escolaetap23_
where
	matriculae0_.id_estudante = estudante1_.id_estudante
	and estudante1_.id_estudante = discente2_.id_discente
	and discente2_.id_pessoa = pessoa7_.id_pessoa
	and matriculae0_.id_serie_escola = escolaetap11_.id_escola_etapa_ensino_serie
	and escolaetap11_.id_serie = serie12_.id_serie
	and serie12_.id_etapa_ensino = etapaensin13_.id_etapa_ensino
	and matriculae0_.id_situacao_matricula_serie = situacaoma19_.id_situacao_matricula_serie
	and matriculae0_.id_serie_escola = escolaetap23_.id_escola_etapa_ensino_serie
	and escolaetap23_.id_escola =52232930
	and matriculae0_.id_situacao_matricula_serie <> 5
	and matriculae0_.ano_calendario =71558970
	and (upper(pessoa7_.nome_ascii) like upper('maria'))
	and escolaetap23_.id_serie =1005223
	and matriculae0_.id_turno =2;



select
	matriculae1_.id_matricula_discente_serie as col_0_0_
from
	matricula.renovacao_matricula renovacaom0_
inner join basico.matricula_estudante_serie matriculae1_ on
	renovacaom0_.id_matricula_anterior = matriculae1_.id_matricula_discente_serie,
	escola.escola_etapa_ensino_serie escolaetap2_,
	basico.estudante estudante3_,
	discente discente4_,
	comum.pessoa pessoa5_
where
	matriculae1_.id_serie_escola = escolaetap2_.id_escola_etapa_ensino_serie
	and matriculae1_.id_estudante = estudante3_.id_estudante
	and estudante3_.id_estudante = discente4_.id_discente
	and discente4_.id_pessoa = pessoa5_.id_pessoa
	and escolaetap2_.id_escola =?
	and matriculae1_.ano_calendario =?
	and renovacaom0_.id_calendario_matricula =?
	and (renovacaom0_.id_registro_cancelamento is null)
	and (upper(pessoa5_.nome_ascii) like upper(?))
	and escolaetap2_.id_serie =?
	and matriculae1_.id_turno =?;



select
	distinct d.id_pessoa
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa_necessidade_especial nee on
	nee.id_pessoa = d.id_pessoa
where
	eees.id_escola = 52232930;

