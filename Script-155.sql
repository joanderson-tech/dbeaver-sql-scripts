select
	subsistema0_.ID as ID311_1_,
	subsistema0_.ATIVO as ATIVO311_1_,
	subsistema0_.NOME as NOME311_1_,
	subsistema0_.NOME_REDUZIDO as NOME4_311_1_,
	subsistema0_.LINK_ENTRADA as LINK5_311_1_,
	subsistema0_.ID_SISTEMA as ID6_311_1_,
	sistema1_.ID as ID310_0_,
	sistema1_.DESCRICAO as DESCRICAO310_0_,
	sistema1_.ativo as ativo310_0_,
	sistema1_.manutencao as manutencao310_0_,
	sistema1_.caixa_postal_ativa as caixa5_310_0_,
	sistema1_.memorandos_eletronicos_ativos as memorandos6_310_0_,
	sistema1_.nome_datasource_jndi as nome7_310_0_,
	sistema1_.caminho_config_hibernate as caminho8_310_0_,
	sistema1_.controlar_usuarios_online as controlar9_310_0_,
	sistema1_.portal_publico_ativo as portal10_310_0_,
	sistema1_.url as url310_0_
from
	comum.SUBSISTEMA subsistema0_
left outer join comum.SISTEMA sistema1_ on
	subsistema0_.ID_SISTEMA = sistema1_.ID

