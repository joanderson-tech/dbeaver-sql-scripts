select * from comum.usuario where id_usuario = 105128;

select * from ava.permi

SELECT x.* FROM comum.tipo_usuario x;

select * from public.discente d where id_pessoa = 748879;

select * from rh.servidor s where id_pessoa = 748879;

select
	distinct usuarioger1_.ID_USUARIO as ID1_313_0_,
	pessoagera2_.ID_PESSOA as ID1_309_1_,
	usuarioger1_.LOGIN as LOGIN313_0_,
	usuarioger1_.SENHA as SENHA313_0_,
	usuarioger1_.RAMAL as RAMAL313_0_,
	usuarioger1_.EMAIL as EMAIL313_0_,
	usuarioger1_.TIPO as TIPO313_0_,
	usuarioger1_.INATIVO as INATIVO313_0_,
	usuarioger1_.AUTORIZADO as AUTORIZADO313_0_,
	usuarioger1_.data_cadastro as data9_313_0_,
	usuarioger1_.ID_FOTO as ID10_313_0_,
	usuarioger1_.ID_SERVIDOR as ID11_313_0_,
	usuarioger1_.data_ultimo_login_mobile as data12_313_0_,
	usuarioger1_.HASH_MOBILE_AUTHENTICATOR as HASH13_313_0_,
	usuarioger1_.ID_PESSOA as ID14_313_0_,
	usuarioger1_.ID_UNIDADE as ID15_313_0_,
	pessoagera2_.cpf_cnpj as cpf2_309_1_,
	pessoagera2_.NOME as NOME309_1_,
	pessoagera2_.NOME_ASCII as NOME4_309_1_,
	pessoagera2_.TIPO as TIPO309_1_,
	pessoagera2_.VALIDO as VALIDO309_1_,
	pessoagera2_.SEXO as SEXO309_1_,
	pessoagera2_.DATA_NASCIMENTO as DATA8_309_1_,
	pessoagera2_.NUMERO as NUMERO309_1_,
	pessoagera2_.COMPLEMENTO as COMPLEM10_309_1_,
	pessoagera2_.NOME_MAE as NOME11_309_1_
from
	comum.PERMISSAO permissao0_
right outer join COMUM.USUARIO usuarioger1_ on
	permissao0_.ID_USUARIO = usuarioger1_.ID_USUARIO
inner join comum.PESSOA pessoagera2_ on
	usuarioger1_.ID_PESSOA = pessoagera2_.ID_PESSOA
where
	1 = 1
	and (usuarioger1_.LOGIN like 'andrelims2002@gmail.com');

select
	*
from
	comum.usuario usuario0_
left outer join comum.pessoa pessoa1_ on
	usuario0_.id_pessoa = pessoa1_.id_pessoa
left outer join escola.bairro_escola bairroesco2_ on
	pessoa1_.id_bairro_endereco = bairroesco2_.id_bairro_escola
left outer join comum.municipio municipio3_ on
	bairroesco2_.id_municipio = municipio3_.id_municipio
left outer join comum.unidade_federativa unidadefed4_ on
	municipio3_.id_unidade_federativa = unidadefed4_.id_unidade_federativa
left outer join comum.municipio municipio5_ on
	unidadefed4_.id_capital = municipio5_.id_municipio
left outer join comum.pais pais6_ on
	unidadefed4_.id_pais = pais6_.id_pais
left outer join pessoas.escolaridade escolarida7_ on
	pessoa1_.id_escolaridade = escolarida7_.id_escolaridade
left outer join comum.estado_civil estadocivi8_ on
	pessoa1_.id_estado_civil = estadocivi8_.id_estado_civil
left outer join comum.unidade_federativa unidadefed9_ on
	pessoa1_.id_unidade_federativa_identidade = unidadefed9_.id_unidade_federativa
left outer join comum.municipio municipio10_ on
	pessoa1_.id_municipio_contato = municipio10_.id_municipio
left outer join comum.tamanho_fardamento tamanhofar11_ on
	pessoa1_.id_tamanho_camisa_letra = tamanhofar11_.id_tamanho
left outer join comum.tamanho_fardamento tamanhofar12_ on
	pessoa1_.id_tamanho_short_calca_letra = tamanhofar12_.id_tamanho
left outer join matricula.tipo_documento_militar tipodocume13_ on
	pessoa1_.id_tipo_documento_militar = tipodocume13_.id_tipo_documento_militar
left outer join matricula.tipo_militar tipomilita14_ on
	pessoa1_.id_tipo_militar = tipomilita14_.id_tipo_militar
left outer join comum.tipo_raca tiporaca15_ on
	pessoa1_.id_raca = tiporaca15_.id_tipo_raca
left outer join comum.tipo_tamanho_fardamento tipotamanh16_ on
	pessoa1_.id_tipo_tamanho_camisa = tipotamanh16_.id_tipo_tamanho
left outer join comum.tipo_tamanho_fardamento tipotamanh17_ on
	pessoa1_.id_tipo_tamanho_short_calca = tipotamanh17_.id_tipo_tamanho
left outer join comum.unidade_federativa unidadefed18_ on
	pessoa1_.id_uf_contato = unidadefed18_.id_unidade_federativa
left outer join comum.unidade_federativa unidadefed19_ on
	pessoa1_.id_uf_naturalidade = unidadefed19_.id_unidade_federativa
inner join comum.tipo_usuario tipousuari20_ on
	usuario0_.tipo = tipousuari20_.id
left outer join comum.unidade unidade21_ on
	usuario0_.id_unidade = unidade21_.id_unidade
where
	usuario0_.id_usuario =105128;


select
	*
from
	comum.municipio municipio0_
inner join comum.unidade_federativa unidadefed1_ on
	municipio0_.id_unidade_federativa = unidadefed1_.id_unidade_federativa
left outer join comum.municipio municipio2_ on
	unidadefed1_.id_capital = municipio2_.id_municipio
left outer join comum.pais pais3_ on
	unidadefed1_.id_pais = pais3_.id_pais
where
	municipio0_.id_municipio =2414209;


select
	*
from
	COMUM.USUARIO usuarioger0_
left outer join comum.tipo_usuario tipousuari1_ on
	usuarioger0_.TIPO = tipousuari1_.id
left outer join comum.PESSOA pessoagera2_ on
	usuarioger0_.ID_PESSOA = pessoagera2_.ID_PESSOA
left outer join comum.UNIDADE unidadeger3_ on
	usuarioger0_.ID_UNIDADE = unidadeger3_.ID_UNIDADE
left outer join comum.UNIDADE unidadeger4_ on
	unidadeger3_.ID_RESPONSAVEL = unidadeger4_.ID_UNIDADE
where
	usuarioger0_.ID_USUARIO =105128;
