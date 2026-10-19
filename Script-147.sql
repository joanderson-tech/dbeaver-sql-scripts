select
	subsistema0_.ID as ID3919_1_,
	subsistema0_.ATIVO as ATIVO3919_1_,
	subsistema0_.NOME as NOME3919_1_,
	subsistema0_.NOME_REDUZIDO as NOME4_3919_1_,
	subsistema0_.LINK_ENTRADA as LINK5_3919_1_,
	subsistema0_.ID_SISTEMA as ID6_3919_1_,
	sistema1_.ID as ID3918_0_,
	sistema1_.DESCRICAO as DESCRICAO3918_0_,
	sistema1_.ativo as ativo3918_0_,
	sistema1_.manutencao as manutencao3918_0_,
	sistema1_.caixa_postal_ativa as caixa5_3918_0_,
	sistema1_.memorandos_eletronicos_ativos as memorandos6_3918_0_,
	sistema1_.nome_datasource_jndi as nome7_3918_0_,
	sistema1_.caminho_config_hibernate as caminho8_3918_0_,
	sistema1_.controlar_usuarios_online as controlar9_3918_0_,
	sistema1_.portal_publico_ativo as portal10_3918_0_,
	sistema1_.url as url3918_0_
from
	comum.SUBSISTEMA subsistema0_
left outer join comum.SISTEMA sistema1_ on
	subsistema0_.ID_SISTEMA = sistema1_.ID
where
	subsistema0_.ID =?
	
11OO7201552014100049268002403610	
26475801552023167629474777373978
