
UPDATE ensino.matricula_componente 
	SET id_discente =1021534 
	WHERE id_matricula_componente  in (18203247, 18276005, 18276006, 18276007, 18276008, 18276009, 18276004);

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1021534
	WHERE id_frequencia in (155438830, 155438998, 155439364, 155439979, 155439513, 155439623, 155439755, 155440121, 155439898, 155440518, 155440834, 155440792, 155440967, 155440225, 155459893, 155460306, 155460784, 155460512, 155460687, 155460648, 155460667, 155460743, 155460829, 155461089, 155461111, 155532758, 155533076, 155533437, 155533493, 155534327, 155533535, 155534227, 155533865, 155534396, 155534473, 155534746, 155534974, 155535064, 155535192, 155535212, 156439132, 156439322, 156439994, 156440054, 158724591, 158724492, 158724785, 158725050, 158725165, 158743048, 158743094, 158743245, 158743773, 158743280, 158743498, 158743418, 158743582, 158743601, 158743620, 158743639, 158743812, 158743792, 158743851, 158743985, 158885939, 158885862, 158974964, 159504974, 159505135, 159505621, 159505730, 159505829, 160096308, 160096184, 160098372, 160098484, 160123103, 160329665, 160329709, 160720316, 160720202, 160720335, 160720422, 160720441, 161337716, 161337630, 161337649, 161337697);



-- Auto-generated SQL script #202407051057
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1021534
	WHERE id_matricula_discente_serie=1500435;

DELETE FROM basico.estudante WHERE id_estudante=1402340;

DELETE FROM public.discente WHERE id_discente=1402340;

DELETE FROM comum.pessoa WHERE id_pessoa=773328;









------------

UPDATE ensino.matricula_componente 
	SET id_discente =1402340 
	WHERE id_matricula_componente  in (18203247, 18276005, 18276006, 18276007, 18276008, 18276009, 18276004);

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1402340
	WHERE id_frequencia in (155438830, 155438998, 155439364, 155439979, 155439513, 155439623, 155439755, 155440121, 155439898, 155440518, 155440834, 155440792, 155440967, 155440225, 155459893, 155460306, 155460784, 155460512, 155460687, 155460648, 155460667, 155460743, 155460829, 155461089, 155461111, 155532758, 155533076, 155533437, 155533493, 155534327, 155533535, 155534227, 155533865, 155534396, 155534473, 155534746, 155534974, 155535064, 155535192, 155535212, 156439132, 156439322, 156439994, 156440054, 158724591, 158724492, 158724785, 158725050, 158725165, 158743048, 158743094, 158743245, 158743773, 158743280, 158743498, 158743418, 158743582, 158743601, 158743620, 158743639, 158743812, 158743792, 158743851, 158743985, 158885939, 158885862, 158974964, 159504974, 159505135, 159505621, 159505730, 159505829, 160096308, 160096184, 160098372, 160098484, 160123103, 160329665, 160329709, 160720316, 160720202, 160720335, 160720422, 160720441, 161337716, 161337630, 161337649, 161337697);

-- Auto-generated SQL script #202407051057
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1402340
	WHERE id_matricula_discente_serie=1500435;

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1402340, 52230487, 'SENADOR JOSE COELHO', NULL, NULL, false, false, '2024-04-25', 6405998, NULL, false, false);


INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1402340, 2024, NULL, '202430077315', NULL, 773328, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-02-15 13:37:29.004', NULL, 6289744, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(773328, 'ANA JULIA NOGUEIRA DE SOUZA', '2018-06-07', 'F', 6, NULL, NULL, NULL, NULL, NULL, 15620251470, 31, NULL, 'JOELSON MASARIO DE SOUSA', 'FRANCISCA JUCILEIDE NOGUEIRA', '', 1, 'KM 25', 26, 2611101, 'S/N', 'F', false, '2024-04-25 16:56:42.006', 'VILA IRMÃO DOURADO', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(87)9163-8019', NULL, '2024-02-15 13:37:29.003', 'ANA JULIA NOGUEIRA DE SOUZA', NULL, NULL, '', false, '0', 'N', '', '', '', NULL, 2611101, '', '07674501552018100396073019933311', NULL, 'AREA 19', NULL, 'FRANCISCA JUCILEIDE NOGUEIRA', 'MÃE', 'CPF', '6390767420', '56337-400', NULL, 2611101, 26, NULL, 'TRABALHADOR RURAL', 'TRABALHADORA RURAL', NULL, NULL, NULL, '23851047938', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '214512658163', NULL, '898005871786369', 61663222, NULL, NULL, NULL, NULL, NULL, NULL, '6533350', '2890678', 'SDS', 'SSP', NULL, NULL, 26, 26, NULL, false, '', '', 'MÃE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
