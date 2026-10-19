select * from comum.permissao p 
where p.id_usuario = 105399; 

select
	distinct usuarioger1_.ID_USUARIO as ID1_2117_0_,
	pessoagera2_.ID_PESSOA as ID1_2113_1_,
	usuarioger1_.LOGIN as LOGIN2117_0_,
	usuarioger1_.SENHA as SENHA2117_0_,
	usuarioger1_.RAMAL as RAMAL2117_0_,
	usuarioger1_.EMAIL as EMAIL2117_0_,
	usuarioger1_.TIPO as TIPO2117_0_,
	usuarioger1_.INATIVO as INATIVO2117_0_,
	usuarioger1_.AUTORIZADO as AUTORIZADO2117_0_,
	usuarioger1_.data_cadastro as data9_2117_0_,
	usuarioger1_.ID_FOTO as ID10_2117_0_,
	usuarioger1_.ID_SERVIDOR as ID11_2117_0_,
	usuarioger1_.data_ultimo_login_mobile as data12_2117_0_,
	usuarioger1_.HASH_MOBILE_AUTHENTICATOR as HASH13_2117_0_,
	usuarioger1_.ID_PESSOA as ID14_2117_0_,
	usuarioger1_.ID_UNIDADE as ID15_2117_0_,
	pessoagera2_.cpf_cnpj as cpf2_2113_1_,
	pessoagera2_.NOME as NOME2113_1_,
	pessoagera2_.NOME_ASCII as NOME4_2113_1_,
	pessoagera2_.TIPO as TIPO2113_1_,
	pessoagera2_.VALIDO as VALIDO2113_1_,
	pessoagera2_.SEXO as SEXO2113_1_,
	pessoagera2_.DATA_NASCIMENTO as DATA8_2113_1_,
	pessoagera2_.NUMERO as NUMERO2113_1_,
	pessoagera2_.COMPLEMENTO as COMPLEM10_2113_1_,
	pessoagera2_.NOME_MAE as NOME11_2113_1_
from
	comum.PERMISSAO permissao0_
right outer join COMUM.USUARIO usuarioger1_ on
	permissao0_.ID_USUARIO = usuarioger1_.ID_USUARIO
inner join comum.PESSOA pessoagera2_ on
	usuarioger1_.ID_PESSOA = pessoagera2_.ID_PESSOA
where
	1 = 1
	and (usuarioger1_.LOGIN like 'leticiadourado255565@gmail.com');



select * from comum.


select * from rh.servidor s
where s.id_pessoa = 754071;

UPDATE comum.usuario
	SET id_unidade=2035
	WHERE id_usuario=105399;

UPDATE comum.permissao
	SET id_unidade_papel=2035
	WHERE id=12505;
UPDATE comum.permissao
	SET id_unidade_papel=2035
	WHERE id=12506;

--Banco Comum
UPDATE comum.permissao
	SET id_unidade_papel=NULL
	WHERE id=12505;
UPDATE comum.permissao
	SET id_unidade_papel=NULL
	WHERE id=12506;

UPDATE comum.usuario
	SET id_unidade=605
	WHERE id_usuario=105399;

