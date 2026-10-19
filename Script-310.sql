select
	estudante0_.id_estudante as col_0_0_,
	estudante0_.id_estudante as col_1_0_,
	discente1_.matricula as col_2_0_,
	discente1_.id_pessoa as col_3_0_,
	pessoa4_.nome as col_4_0_,
	estudante0_.id_serie_ingresso as col_5_0_,
	serie5_.descricao as col_6_0_,
	estudante0_.data_matricula as col_7_0_
from
	basico.estudante estudante0_,
	discente discente1_,
	comum.pessoa pessoa4_,
	basico.serie serie5_
where
	estudante0_.id_estudante = discente1_.id_discente
	and discente1_.id_pessoa = pessoa4_.id_pessoa
	and estudante0_.id_serie_ingresso = serie5_.id_serie
	and discente1_.matricula =?
	
	
	select 
