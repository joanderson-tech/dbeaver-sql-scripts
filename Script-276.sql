 --id_disc correto 980862 / errado 980515
 UPDATE ensino.matricula_componente 
	SET id_discente =980862 
	WHERE id_matricula_componente  in (17064902); 

UPDATE basico.matricula_estudante_serie
	SET id_estudante=980862
	WHERE id_matricula_discente_serie in (1324233);

UPDATE basico.matricula_estudante_serie
	SET id_situacao_matricula_serie=5
	WHERE id_matricula_discente_serie=1324233;

-- Updated Rows	121
 UPDATE ensino.frequencia_aluno  
 	SET id_discente= 980862 
 	WHERE id_frequencia in (137413375, 137413410, 137413426, 137413442, 137413458, 137413946, 137413474, 137413490, 137413506, 137413522, 137413538, 137413554, 137413570, 137413586, 137413602, 137413618, 137413634, 137413650, 137413666, 137413682, 137413698, 137413714, 137413730, 137413746, 137413762, 137413778, 137413794, 137413810, 137413826, 137413842, 137413858, 137413874, 137413890, 137413908, 137413927, 137413965, 137413984, 137414003, 137414041, 137414022, 137414060, 52069786, 137414104, 137414079, 52072547, 137414139, 137414158, 137414215, 137414234, 137414253, 137414177, 137414196, 137414272, 137414291, 137414329, 137414367, 137414386, 137414310, 137414348, 137414405, 137414453, 137414472, 137414567, 137414491, 137414510, 137414529, 137414548, 137414696, 137371683, 137371695, 137405927, 137405939, 137405949, 137405958, 137405967, 137405976, 137405986, 137405997, 137406008, 137406019, 137406031, 137406042, 137406054, 137406066, 137406078, 137406090, 137406152, 137406164, 137406201, 137406213, 137406225, 137406237, 137406249, 137406261, 137406273, 137406285, 137406297, 137406309, 137406321, 137406333, 137406345, 137406357, 137406369, 137406381, 137406393, 137406405, 137406417, 137406429, 137406480, 137406492, 137406505, 137406533, 137406579, 137406613, 137406629, 137406645, 137430501, 137441534, 137459992, 137460078, 137469772);
	
UPDATE basico.estudante_documento_pendente  
	SET id_estudante = 980862  
	WHERE id_estudante_documento_pendente in (51939109, 51939110, 51939111 );

DELETE FROM basico.estudante
WHERE id_estudante=980515;

DELETE FROM public.discente
WHERE id_discente=980515;

DELETE FROM comum.pessoa
WHERE id_pessoa=753653;


BEGIN;
commit;
rollback;

 --id_disc errado 980515
 UPDATE ensino.matricula_componente 
	SET id_discente =980515 
	WHERE id_matricula_componente  in (17064902); 

UPDATE basico.matricula_estudante_serie
	SET id_estudante=980515
	WHERE id_matricula_discente_serie in (1324233);

UPDATE basico.matricula_estudante_serie
	SET id_situacao_matricula_serie=1
	WHERE id_matricula_discente_serie=1324233;

-- Updated Rows	121
 UPDATE ensino.frequencia_aluno  
 	SET id_discente= 980515 
 	WHERE id_frequencia in (137413375, 137413410, 137413426, 137413442, 137413458, 137413946, 137413474, 137413490, 137413506, 137413522, 137413538, 137413554, 137413570, 137413586, 137413602, 137413618, 137413634, 137413650, 137413666, 137413682, 137413698, 137413714, 137413730, 137413746, 137413762, 137413778, 137413794, 137413810, 137413826, 137413842, 137413858, 137413874, 137413890, 137413908, 137413927, 137413965, 137413984, 137414003, 137414041, 137414022, 137414060, 52069786, 137414104, 137414079, 52072547, 137414139, 137414158, 137414215, 137414234, 137414253, 137414177, 137414196, 137414272, 137414291, 137414329, 137414367, 137414386, 137414310, 137414348, 137414405, 137414453, 137414472, 137414567, 137414491, 137414510, 137414529, 137414548, 137414696, 137371683, 137371695, 137405927, 137405939, 137405949, 137405958, 137405967, 137405976, 137405986, 137405997, 137406008, 137406019, 137406031, 137406042, 137406054, 137406066, 137406078, 137406090, 137406152, 137406164, 137406201, 137406213, 137406225, 137406237, 137406249, 137406261, 137406273, 137406285, 137406297, 137406309, 137406321, 137406333, 137406345, 137406357, 137406369, 137406381, 137406393, 137406405, 137406417, 137406429, 137406480, 137406492, 137406505, 137406533, 137406579, 137406613, 137406629, 137406645, 137430501, 137441534, 137459992, 137460078, 137469772);
	
UPDATE basico.estudante_documento_pendente  
	SET id_estudante = 980515  
	WHERE id_estudante_documento_pendente in (51939109, 51939110, 51939111 );

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES(980515, 51869713, '', NULL, NULL, true, true, '2024-03-10', 5627149, NULL, false, false);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(980515, 2024, NULL, '202430070332', NULL, 753653, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-04 19:00:15.281', NULL, 5626644, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social) VALUES(753653, 'GAEL HENRIQUE GADELHA DA SILVA', '2020-12-08', 'M', 6, NULL, NULL, NULL, NULL, NULL, 17459243450, 31, NULL, 'NELSON GADELHA DO NASCIMENTO', 'GABRIELLE PEREIRA DA SILVA', '', 1, 'LOTEAMENTO JARDIM BOTANICO', 24, 2408102, '272', 'F', false, '2024-03-10 11:00:37.080', 'RUA DAS HORTENSIAS', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(84)99428-9436', NULL, '2024-03-04 19:00:15.280', 'GAEL HENRIQUE GADELHA DA SILVA', NULL, NULL, 'BRASILEIRO', false, '0', 'N', '', '', '', NULL, 2403608, '', '09439101552020100238017011636035', NULL, '', NULL, '', '', NULL, '0', '59575-000', NULL, 2403608, 24, NULL, 'MARCENEIRO', 'DO LAR', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '704301577118892', 51939107, NULL, NULL, NULL, NULL, NULL, NULL, '003225489', '1591994', 'ITEP', 'ITEP', NULL, NULL, 24, 24, NULL, false, '(84)99479-9856', '(84)99428-9436', 'PAI', 'MÃE', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

