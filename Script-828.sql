select p.id_informacoes_medicas, id_conta_bancaria, * from comum.pessoa p where p.id_pessoa = 749493;
begin;
rollback;

DELETE FROM comum.informacoes_medicas WHERE id_informacoes_medicas=51883135;



INSERT INTO comum.informacoes_medicas (id_informacoes_medicas, tipo_sanguineo, usa_medicamento, nome_medicamento, possui_alergia, tipo_alergia, possui_intolerancia_lactose, possui_refluxo, possui_intolerancia_gluten, usa_oculos, possui_anemia, possui_diabetes, possui_doenca, nome_doenca, usa_cadeira_de_rodas) VALUES(51883135, NULL, false, NULL, false, NULL, false, false, false, false, false, false, false, NULL, false);

update
	comum.informacoes_medicas
set
	nome_doenca =?,
	nome_medicamento =?,
	possui_alergia =?,
	possui_anemia =?,
	possui_diabetes =?,
	possui_doenca =?,
	possui_intolerancia_gluten =?,
	possui_intolerancia_lactose =?,
	possui_refluxo =?,
	tipo_alergia =?,
	tipo_sanguineo =?,
	usa_cadeira_de_rodas =?,
	usa_medicamento =?,
	usa_oculos =?
where
	id_informacoes_medicas =?;


 insert into comum.alteracao_pessoa (abreviatura, bairro_novo, celular, certificado_militar_categoria, certificado_militar_data_expedicao, certificado_militar_numero, certificado_militar_orgao_expedicao, certificado_militar_serie, cod_comando, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, conta_bancaria_agencia, conta_bancaria_id_banco, conta_bancaria_numero, conta_bancaria_variacao, cpf_cnpj, data_cadastro, data_nascimento, email, endereco, endereco_contato_bairro, endereco_contato_caixa_postal, endereco_contato_cep, endereco_contato_complemento, endereco_contato_correspondencia, endereco_contato_id_municipio, endereco_contato_id_pais, endereco_contato_id_uf, endereco_contato_logradouro, endereco_contato_municipio_outro, endereco_contato_nome_pais, endereco_contato_numero, endereco_contato_telefone_celular_codigo_area_internacional, endereco_contato_telefone_celular_codigo_area_nacional, endereco_contato_telefone_celular_ramal, endereco_contato_telefone_fixo_codigo_area_internacional, endereco_contato_telefone_fixo_codigo_area_nacional, endereco_contato_telefone_fixo_ramal, fax, funcionario, id_estado_civil, id_grau_formacao, id_municipio_naturalidade, id_pais_nacionalidade, id_tipo_etnia, id_tipo_raca, id_tipo_rede_ensino, id_uf_naturalidade, identidade_data_expedicao, identidade_uf, identidade_numero, identidade_orgao_expedicao, logradouro_novo, municipio_naturalidade_outro, nome, nome_ascii, nome_mae, nome_pai, origem, outro_documento, passaporte, id_pessoa, id_registro_entrada, id_registro_publico, renovacao_familiar, sexo, telefone, titulo_eleitor_data_expedicao, titulo_eleitor_id_uf, titulo_eleitor_numero, titulo_eleitor_secao, titulo_eleitor_zona, ultima_atualizacao, valido, id_alteracao_pessoa) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)

 select * from comum.informacoes_medicas im ;

 
 select * from comum.alteracao_pessoa p where p.id_pessoa = 749493;
 
-- Auto-generated SQL script #202507181501
UPDATE comum.pessoa
	SET id_informacoes_medicas=NULL
	WHERE id_pessoa=749493;




UPDATE comum.pessoa
	SET id_informacoes_medicas=51883135
	WHERE id_pessoa=749493;
