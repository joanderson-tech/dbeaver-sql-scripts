
UPDATE ensino.matricula_componente 
	SET id_discente =1361021 
	WHERE id_matricula_componente  in (17970401, 17970402, 17970403, 17970405, 17970406, 17970407, 17970399, 17970400, 17970404);

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1361021
	WHERE id_frequencia in (153878865, 154296590, 154297350, 154297681, 154296894, 154297620, 154298111, 154298433, 154298568, 154298877, 154299235, 154299328, 154300045, 154299571, 154300548, 154300864, 154301100, 154301279, 154301424, 154301581, 154303004, 154302307, 154302425, 154301928, 154302790, 154303687, 154304708, 154304822, 154305012, 154305432, 154305270, 154305553, 154305644, 154334933, 154430607, 157522213, 157659687, 157238279, 156582706, 156805040, 155718400, 155821177, 157795719, 156052868, 157853505, 156382400, 156402121, 156402925, 156403041, 156402725, 156403187, 156403320, 156403741, 157937361, 158010945, 158012833, 158012786, 158091240, 158147834, 158383008, 158383264, 158383472, 158715354, 158715594, 158725122, 158749840, 159125605, 159125666, 159125687, 159125738, 159269799, 159395165, 159395697, 156991479, 159537117, 159706580, 159706889, 159890614, 160068431, 160068938, 160326412, 160326483, 160502518, 160502712, 160716118, 160993620, 160994199, 160994484, 161210326);
	
UPDATE basico.estudante_documento_pendente
	SET id_estudante=1361021
	WHERE id_estudante_documento_pendente in (61532135);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1361021
	WHERE id_matricula_discente_serie=1492925;

DELETE FROM basico.estudante WHERE id_estudante=1398996;

DELETE FROM public.discente WHERE id_discente=1398996;

DELETE FROM comum.pessoa WHERE id_pessoa=769618;

begin;
commit; 
rollback;

------



UPDATE ensino.matricula_componente 
	SET id_discente =1398996 
	WHERE id_matricula_componente  in (17970401, 17970402, 17970403, 17970405, 17970406, 17970407, 17970399, 17970400, 17970404);

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1398996
	WHERE id_frequencia in (153878865, 154296590, 154297350, 154297681, 154296894, 154297620, 154298111, 154298433, 154298568, 154298877, 154299235, 154299328, 154300045, 154299571, 154300548, 154300864, 154301100, 154301279, 154301424, 154301581, 154303004, 154302307, 154302425, 154301928, 154302790, 154303687, 154304708, 154304822, 154305012, 154305432, 154305270, 154305553, 154305644, 154334933, 154430607, 157522213, 157659687, 157238279, 156582706, 156805040, 155718400, 155821177, 157795719, 156052868, 157853505, 156382400, 156402121, 156402925, 156403041, 156402725, 156403187, 156403320, 156403741, 157937361, 158010945, 158012833, 158012786, 158091240, 158147834, 158383008, 158383264, 158383472, 158715354, 158715594, 158725122, 158749840, 159125605, 159125666, 159125687, 159125738, 159269799, 159395165, 159395697, 156991479, 159537117, 159706580, 159706889, 159890614, 160068431, 160068938, 160326412, 160326483, 160502518, 160502712, 160716118, 160993620, 160994199, 160994484, 161210326);
	
UPDATE basico.estudante_documento_pendente
	SET id_estudante=1398996
	WHERE id_estudante_documento_pendente in (61532135);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1398996
	WHERE id_matricula_discente_serie=1492925;

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1398996, 1005220, 'ESCOLA MUNICIPAL LUIZA DE CASTRO FERREIRA E SILVA', NULL, NULL, true, false, '2024-06-03', 6485661, NULL, false, false);


INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1398996, 2024, NULL, '202430044851', NULL, 769618, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-01-26 08:49:56.263', NULL, 6271509, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado)
VALUES(769618, 'RAIMUNDO NETO MATIAS DA SILVA MENEZES', '2019-02-20', 'M', 2, NULL, NULL, NULL, NULL, NULL, 13784681476, 31, NULL, '', 'DANDARA DA SILVA MENEZES', '', 1, 'JARDIM AMAZONAS', 26, 2611101, '150', 'F', false, '2024-05-28 13:24:13.790', 'RUA EVA MOTA', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(87)99162-3446', NULL, '2024-01-26 08:49:56.262', 'RAIMUNDO NETO MATIAS DA SILVA MENEZES', NULL, NULL, '', false, '0', 'N', '', '', '', NULL, 2611101, '', '07674501552016100364259018991979', NULL, '', NULL, 'DANDARA DA SILVA MENEZES', '', 'CPF', '8597592451', '56318-340', NULL, 2611101, 26, NULL, '', '', NULL, NULL, NULL, '23755239317', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '183145969810', NULL, '705002441561257', 61532134, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 26, 26, NULL, false, '(87)98822-6325', '', 'MAE', 'MAE', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);



