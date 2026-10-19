
anos_experiencia, cnh, cnh_categoria, cpf, fone_celular, 
fone_residencial, id_arquivo_Carteira, id_arquivo_certificado_curso, 
is_curso_transporte_aluno, nome, nome_arquivo_carteira, nome_arquivo_certificado_curso,  
validade_cnh, validade_curso, id_motorista) values (0, 'cnh', 'AB', '131.989.964-14', '', '', 
10001702, 10001703, 'FALSE', 'hhhhhhhh', 'Novo Documento de Texto (2).txt', 'Novo Documento de Texto (2).txt',
'2023-11-30 00:00:00-02', '2023-11-22 00:00:00-02', 60919581) was aborted: ERROR: value too long for type character varying(1) 
Call getNextException to see other errors in the batch.
	
select * from transporte.motorista m;


BEGIN;

commit;

ROLLBACK;

ALTER TABLE transporte.motorista
ALTER COLUMN cnh_categoria TYPE VARCHAR(2);

select subsistema0_.ID as ID311_1_,
subsistema0_.ATIVO as ATIVO311_1_,
subsistema0_.NOME as NOME311_1_, subsistema0_.NOME_REDUZIDO as NOME4_311_1_, 
subsistema0_.LINK_ENTRADA as LINK5_311_1_, subsistema0_.ID_SISTEMA as ID6_311_1_, 
sistema1_.ID as ID310_0_, sistema1_.DESCRICAO as DESCRICAO310_0_, sistema1_.ativo as ativo310_0_, 
sistema1_.manutencao as manutencao310_0_, sistema1_.caixa_postal_ativa as caixa5_310_0_, 
sistema1_.memorandos_eletronicos_ativos as memorandos6_310_0_, sistema1_.nome_datasource_jndi as nome7_310_0_,
sistema1_.caminho_config_hibernate as caminho8_310_0_, sistema1_.controlar_usuarios_online as controlar9_310_0_,
sistema1_.portal_publico_ativo as portal10_310_0_, 
sistema1_.url as url310_0_ from comum.SUBSISTEMA subsistema0_ 
left outer join comum.SISTEMA sistema1_ on subsistema0_.ID_SISTEMA=sistema1_.ID where subsistema0_.ID=?

