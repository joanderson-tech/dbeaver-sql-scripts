begin;
rollback;

DELETE FROM comum.pessoa WHERE id_pessoa=51876858;


-- Auto-generated SQL script #202501271417
UPDATE public.discente
	SET id_pessoa=51876858
	WHERE id_discente=979649;





-- Auto-generated SQL script #202501271417
UPDATE public.discente
	SET id_pessoa=51876815
	WHERE id_discente=979649;
	

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola) VALUES(51876815, 'ANNA CLARA COSTA FERNANDES', '2015-05-02', 'F', 1, NULL, NULL, NULL, NULL, NULL, 71160565481, 31, NULL, 'SUELI FERNANDES', 'ANA KARINE COSTA DE ARAUJO', '', NULL, 'ZONA RURAL VILA 2 DO SABUGI', 24, 2402006, 'lote 30', 'F', true, '2022-08-16 09:28:04.420', 'RUA ELIAS FERNANDES DE MORAIS', NULL, NULL, NULL, NULL, NULL, NULL, '003665771', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '8499629809', NULL, '2019-10-08 00:00:00.000', 'ANNA CLARA COSTA FERNANDES', NULL, NULL, 'BRASILEIRA', false, '0', NULL, '', '', '', NULL, 2402006, '', '', NULL, '', NULL, 'Ana Karine Costa de Araujo', 'MAE', 'CPF', '4771276498', '59300000', NULL, 2402006, 24, NULL, 'REPRESENTANTE DE VENDAS', 'DO LAR', NULL, NULL, NULL, '23743657224', NULL, false, NULL, 3834, NULL, NULL, NULL, NULL, NULL, NULL, '150005117517', NULL, '898004722408493', 52679450, NULL, NULL, NULL, NULL, NULL, NULL, '002056969', '', 'SSP', '', NULL, NULL, 24, 24, NULL, false, NULL, NULL, 'MÃE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
