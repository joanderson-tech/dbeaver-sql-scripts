SELECT *
FROM comum.informacoes_medicas im
WHERE im.id_informacoes_medicas = 61145025;

SELECT *
FROM comum.pessoa p
WHERE p.id_informacoes_medicas = 61145025;

SELECT id_informacoes_medicas, * FROM comum.pessoa p WHERE p.id_pessoa = 52798375;

SELECT * FROM comum.pessoa p WHERE p.nome ILIKE '%GUILHERME GOMES DA SILVA%'

SELECT * FROM comum.alteracao_pessoa WHERE id_pessoa = 52798375;


INSERT INTO comum.alteracao_pessoa (abreviatura, bairro_novo, celular, certificado_militar_categoria, certificado_militar_data_expedicao, certificado_militar_numero, certificado_militar_orgao_expedicao, certificado_militar_serie, cod_comando, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, conta_bancaria_agencia, conta_bancaria_id_banco, conta_bancaria_numero, conta_bancaria_variacao, cpf_cnpj, data_cadastro, data_nascimento, email, endereco, endereco_contato_bairro, endereco_contato_caixa_postal, endereco_contato_cep, endereco_contato_complemento, endereco_contato_correspondencia, endereco_contato_id_municipio, endereco_contato_id_pais, endereco_contato_id_uf, endereco_contato_logradouro, endereco_contato_municipio_outro, endereco_contato_nome_pais, endereco_contato_numero, endereco_contato_telefone_celular_codigo_area_internacional, endereco_contato_telefone_celular_codigo_area_nacional, endereco_contato_telefone_celular_ramal, endereco_contato_telefone_fixo_codigo_area_internacional, endereco_contato_telefone_fixo_codigo_area_nacional, endereco_contato_telefone_fixo_ramal, fax, funcionario, id_estado_civil, id_grau_formacao, id_municipio_naturalidade, id_pais_nacionalidade, id_tipo_etnia, id_tipo_raca, id_tipo_rede_ensino, id_uf_naturalidade, identidade_data_expedicao, identidade_uf, identidade_numero, identidade_orgao_expedicao, logradouro_novo, municipio_naturalidade_outro, nome, nome_ascii, nome_mae, nome_pai, origem, outro_documento, passaporte, id_pessoa, id_registro_entrada, id_registro_publico, renovacao_familiar, sexo, telefone, titulo_eleitor_data_expedicao, titulo_eleitor_id_uf, titulo_eleitor_numero, titulo_eleitor_secao, titulo_eleitor_zona, ultima_atualizacao, valido, id_alteracao_pessoa)
VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)



-- Auto-generated SQL script #202511041736
UPDATE comum.pessoa
	SET id_informacoes_medicas=61145025
	WHERE id_pessoa=52798375;
