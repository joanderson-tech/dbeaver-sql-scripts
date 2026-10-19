--backup

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1398268
	WHERE id_matricula_discente_serie=1491807;

UPDATE matricula.estudante_inscrito
	SET id_estudante=1398268
	WHERE id_estudante_inscrito=61423749;

UPDATE basico.movimentacao_estudante
	SET id_discente=1398268
	WHERE id_movimentacao_estudante=69594;

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=768894
	WHERE id_pessoa_necessidade_especial=61515158;

update ensino.observacao_discente 
	SET id_discente = 1398268 
	WHERE id_observacao_discente = 615159912;

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1398268, 51869713, NULL, NULL, NULL, true, false, NULL, NULL, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1398268, 2024, NULL, '202430037614', NULL, 768894, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 11:56:23.053', NULL, 6269007, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(768894, 'KAUA GABRIEL CONCEICAO SILVA', '2023-02-18', 'M', 1, NULL, NULL, NULL, NULL, NULL, 18446537494, 31, NULL, 'JEOVAN EIAS DE SOUZA SILVA', 'MARIA SELIANA CONCEICAO CARVALHO', '', NULL, 'PROJETO SENADOR NILO COELHO N-4', 26, 2611101, '2', 'F', false, '2024-01-24 11:56:22.981', 'Rua U', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '87981511098', NULL, '2024-01-24 11:56:22.981', 'KAUA GABRIEL CONCEICAO SILVA', NULL, NULL, 'JUAZEIRO', false, '0', 'N', '', '', '', NULL, 2611101, '', '16371330155202310017790801945122', NULL, 'Casa', NULL, 'Maria Seliana Conceição carvalho', 'MÃE', 'CPF', '11122022425', '56353777', NULL, 2611101, 26, NULL, 'AGRICULTOR', 'AGRICULTORA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 61515157, NULL, NULL, NULL, NULL, NULL, NULL, '9300605', '8827602', 'SSP', 'SSP', NULL, NULL, 26, 26, NULL, false, '', '', 'MARIA SELIANA CONCEIÇÃO CARVALHO', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

BEGIN;
commit;
rollback;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1399592
	WHERE id_matricula_discente_serie=1491807;

UPDATE matricula.estudante_inscrito
	SET id_estudante=1399592
	WHERE id_estudante_inscrito=61423749;

UPDATE basico.movimentacao_estudante
	SET id_discente=1399592
	WHERE id_movimentacao_estudante=69594;

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=770264
	WHERE id_pessoa_necessidade_especial=61515158;

UPDATE ensino.observacao_discente 
	SET id_discente = 1399592 
	WHERE id_observacao_discente = 615159912;

DELETE FROM basico.estudante WHERE id_estudante=1398268;

DELETE FROM public.discente WHERE id_discente=1398268;

DELETE FROM comum.pessoa WHERE id_pessoa=768894;


---Solução
UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=770264
	WHERE id_pessoa_necessidade_especial=61515158;

UPDATE public.discente
	SET id_pessoa=770264
	WHERE id_discente=1398268;


DELETE FROM comum.pessoa WHERE id_pessoa=768894; 

---Backup 
UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=768894
	WHERE id_pessoa_necessidade_especial=61515158;

UPDATE public.discente
	SET id_pessoa=768894
	WHERE id_discente=1398268;

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(768894, 'KAUA GABRIEL CONCEICAO SILVA', '2023-02-18', 'M', 1, NULL, NULL, NULL, NULL, NULL, 18446537494, 31, NULL, 'JEOVAN EIAS DE SOUZA SILVA', 'MARIA SELIANA CONCEICAO CARVALHO', '', NULL, 'PROJETO SENADOR NILO COELHO N-4', 26, 2611101, '2', 'F', false, '2024-01-24 11:56:22.981', 'Rua U', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '87981511098', NULL, '2024-01-24 11:56:22.981', 'KAUA GABRIEL CONCEICAO SILVA', NULL, NULL, 'JUAZEIRO', false, '0', 'N', '', '', '', NULL, 2611101, '', '16371330155202310017790801945122', NULL, 'Casa', NULL, 'Maria Seliana Conceição carvalho', 'MÃE', 'CPF', '11122022425', '56353777', NULL, 2611101, 26, NULL, 'AGRICULTOR', 'AGRICULTORA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 61515157, NULL, NULL, NULL, NULL, NULL, NULL, '9300605', '8827602', 'SSP', 'SSP', NULL, NULL, 26, 26, NULL, false, '', '', 'MARIA SELIANA CONCEIÇÃO CARVALHO', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
