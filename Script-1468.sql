SELECT *
FROM comum.pessoa p
WHERE p.id_pessoa IN (754348, 775255, 775268);

SELECT *
FROM discente d
WHERE d.id_pessoa IN (754348, 775255);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (988334, 1007167, 1007160);

SELECT *
FROM basico.unificacao_estudante ue
WHERE ue.id_discente_manter IN (988334, 1007167, 1007160);

UPDATE comum.pessoa
SET
cpf_cnpj = 71688429433, data_nascimento = '2013-02-28', nome = 'DEBORA RAYANE FRANÇA MOREIRA', id_raca = 2, sexo = 'M', nome_responsavel_matricula = 'Karen Rafaela França Gomes', grau_parentesco_responsavel_matricula = 'MÃE', tipo_documento_responsavel_matricula = 'CPF', numero_documento_responsavel_matricula = '1772781452', nome_mae = 'KAREN RAFAELA FRANÇA GOMES', nome_pai = 'DENIS EVANGELISTA MOREIRA', nome_ascii = 'DEBORA RAYANE FRANCA MOREIRA'
WHERE id_pessoa = 754348;

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, codigo_sus, id_escolaridade, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia)
VALUES (775268, 'DAVID RAFAEL FRANÇA MOREIRA', '2013-02-28', 'M', 2, NULL, NULL, NULL, NULL, NULL, 71688429433, 31, NULL, 'DENIS EVANGELISTA MOREIRA', 'KAREN RAFAELA FRANÇA GOMES', '', 1, 'OLHO DAGUA', 24, 2408102, '47', 'F', FALSE, '2024-02-06 10:33:33.561', 'RUA ANISIO DE  MOURA ROLIM', NULL, '', '', '', '', NULL, '003925281', 'SSP', 24, '2018-03-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(84)98761-0338', NULL, '2024-02-06 10:33:33.561', 'DAVID RAFAEL FRANCA MOREIRA', NULL, NULL, 'BRASILEIRO', FALSE, '0', 'N', '', '', '', NULL, 2412005, '', '09439101552013100139202008684417', NULL, 'CASA', NULL, 'KAREN RAFAELA FRANÇA GOMES', 'MÃE', 'RG', '3231639', '59290-000', NULL, 2412005, 24, NULL, 'MANICURE', 'ELETRICISTA', NULL, NULL, NULL, '', NULL, FALSE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '898003982515485', NULL, 55251974, NULL, NULL, NULL, NULL, NULL, NULL, '3231639', '', 'SSP', '', NULL, NULL, 24, 24, NULL, FALSE, '(84)98729-2057', '', 'MÃE KAREN', 'PAI DENIS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES (1007174, 2024, NULL, '202430016258', NULL, 775268, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-02-06 10:33:33.562', NULL, 6043567, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155550823, '2024-09-09'::date, 1, 1, 708942, 1007174, '2024-09-09 07:50:27'::timestamp, 6138969, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155573351, '2024-09-10'::date, 0, 1, 708942, 1007174, '2024-09-10 09:31:39'::timestamp, 6139738, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155573353, '2024-08-16'::date, 0, 1, 708942, 1007174, '2024-09-10 09:31:39'::timestamp, 6139738, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149207, '2024-03-04'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149208, '2024-03-05'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149209, '2024-03-06'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149210, '2024-03-07'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149211, '2024-03-08'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149212, '2024-03-11'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149213, '2024-03-12'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149214, '2024-03-13'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149215, '2024-03-14'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149216, '2024-03-15'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149217, '2024-03-18'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149218, '2024-03-19'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149219, '2024-03-20'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149220, '2024-03-21'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149221, '2024-03-22'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149222, '2024-03-25'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149223, '2024-03-26'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149224, '2024-03-27'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149225, '2024-03-28'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149226, '2024-04-01'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149227, '2024-04-02'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149228, '2024-04-03'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149229, '2024-04-04'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149230, '2024-04-05'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149231, '2024-04-08'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149232, '2024-04-09'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149233, '2024-04-10'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149234, '2024-04-11'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149235, '2024-04-12'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149236, '2024-04-15'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149237, '2024-04-16'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149238, '2024-04-17'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149239, '2024-04-18'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149240, '2024-04-19'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149241, '2024-04-22'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149242, '2024-04-23'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149243, '2024-04-24'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149244, '2024-04-25'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149245, '2024-04-26'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149246, '2024-04-29'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149247, '2024-04-30'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149249, '2024-05-02'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149250, '2024-05-03'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149251, '2024-05-06'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149252, '2024-05-07'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149253, '2024-05-08'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149254, '2024-05-09'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149255, '2024-05-10'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149256, '2024-05-13'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155608769, '2024-09-11'::date, 0, 1, 708942, 1007174, '2024-09-12 08:07:20'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155608782, '2024-09-12'::date, 0, 1, 708942, 1007174, '2024-09-12 08:07:20'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609052, '2024-08-22'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609060, '2024-08-23'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609073, '2024-08-20'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609086, '2024-08-29'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609087, '2024-09-06'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609117, '2024-08-28'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609134, '2024-08-19'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609156, '2024-08-26'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609216, '2024-08-21'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609244, '2024-08-14'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609249, '2024-08-30'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155609273, '2024-08-27'::date, 0, 1, 708942, 1007174, '2024-09-12 08:11:30'::timestamp, 6140760, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155621305, '2024-09-13'::date, 0, 1, 708942, 1007174, '2024-09-13 08:29:46'::timestamp, 6141308, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155653518, '2024-09-16'::date, 0, 1, 708942, 1007174, '2024-09-16 10:39:31'::timestamp, 6142096, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155682830, '2024-09-18'::date, 0, 1, 708942, 1007174, '2024-09-18 08:03:36'::timestamp, 6143130, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155682849, '2024-09-17'::date, 0, 1, 708942, 1007174, '2024-09-18 08:03:36'::timestamp, 6143130, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155723567, '2024-09-20'::date, 0, 1, 708942, 1007174, '2024-09-20 09:22:24'::timestamp, 6144310, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155723573, '2024-09-19'::date, 0, 1, 708942, 1007174, '2024-09-20 09:22:24'::timestamp, 6144310, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155741293, '2024-09-23'::date, 0, 1, 708942, 1007174, '2024-09-23 07:40:48'::timestamp, 6144792, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767856, '2024-05-28'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767857, '2024-06-12'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767862, '2024-06-10'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767871, '2024-07-18'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767875, '2024-05-21'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767876, '2024-06-11'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767887, '2024-06-06'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767891, '2024-06-07'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767895, '2024-05-24'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767901, '2024-06-14'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767902, '2024-05-20'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767907, '2024-07-02'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767913, '2024-05-17'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767931, '2024-06-04'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767934, '2024-07-15'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767937, '2024-07-08'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767938, '2024-07-17'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767943, '2024-06-03'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767949, '2024-07-09'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767950, '2024-07-03'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767954, '2024-05-15'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767964, '2024-06-13'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767966, '2024-07-10'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767967, '2024-07-05'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767987, '2024-06-05'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768001, '2024-05-23'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768025, '2024-07-19'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768026, '2024-05-27'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768041, '2024-07-04'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768053, '2024-05-14'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768060, '2024-07-11'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768062, '2024-07-16'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768064, '2024-05-22'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768068, '2024-05-16'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768090, '2024-07-12'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154768098, '2024-05-31'::date, 0, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155797385, '2024-09-26'::date, 0, 1, 708942, 1007174, '2024-09-26 07:55:37'::timestamp, 6146695, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155797399, '2024-09-24'::date, 0, 1, 708942, 1007174, '2024-09-26 07:55:37'::timestamp, 6146695, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041005, '2024-07-26'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041014, '2024-07-31'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041025, '2024-08-01'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041026, '2024-07-25'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041033, '2024-08-06'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041037, '2024-07-30'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041040, '2024-08-05'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041119, '2024-08-02'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041186, '2024-07-22'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041196, '2024-07-23'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041202, '2024-07-29'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155041208, '2024-07-24'::date, 0, 1, 708942, 1007174, '2024-08-06 11:30:36'::timestamp, 6119648, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155834403, '2024-09-30'::date, 0, 1, 708942, 1007174, '2024-09-30 08:16:28'::timestamp, 6148113, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155834413, '2024-09-27'::date, 0, 1, 708942, 1007174, '2024-09-30 08:16:28'::timestamp, 6148113, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155852641, '2024-10-01'::date, 0, 1, 708942, 1007174, '2024-10-01 07:48:13'::timestamp, 6148721, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155250792, '2024-08-08'::date, 0, 1, 708942, 1007174, '2024-08-13 22:34:13'::timestamp, 6126985, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155250794, '2024-08-09'::date, 0, 1, 708942, 1007174, '2024-08-13 22:34:13'::timestamp, 6126985, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155250817, '2024-08-07'::date, 0, 1, 708942, 1007174, '2024-08-13 22:34:13'::timestamp, 6126985, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155250872, '2024-08-12'::date, 0, 1, 708942, 1007174, '2024-08-13 22:35:55'::timestamp, 6126985, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155250896, '2024-08-13'::date, 0, 1, 708942, 1007174, '2024-08-13 22:35:55'::timestamp, 6126985, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155928198, '2024-10-02'::date, 0, 1, 708942, 1007174, '2024-10-08 08:19:12'::timestamp, 6151423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155928244, '2024-10-07'::date, 0, 1, 708942, 1007174, '2024-10-08 08:19:12'::timestamp, 6151423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155928276, '2024-10-08'::date, 0, 1, 708942, 1007174, '2024-10-08 08:19:12'::timestamp, 6151423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155928292, '2024-10-04'::date, 0, 1, 708942, 1007174, '2024-10-08 08:19:12'::timestamp, 6151423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155963009, '2024-10-09'::date, 0, 1, 708942, 1007174, '2024-10-10 07:36:36'::timestamp, 6153156, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155518872, '2024-08-15'::date, 1, 1, 708942, 1007174, '2024-09-05 07:46:14'::timestamp, 6138165, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155518889, '2024-09-05'::date, 1, 1, 708942, 1007174, '2024-09-05 07:46:14'::timestamp, 6138165, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156035011, '2024-10-10'::date, 0, 1, 708942, 1007174, '2024-10-16 08:04:43'::timestamp, 6156287, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156035020, '2024-10-16'::date, 0, 1, 708942, 1007174, '2024-10-16 08:04:43'::timestamp, 6156287, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156035061, '2024-10-11'::date, 0, 1, 708942, 1007174, '2024-10-16 08:04:43'::timestamp, 6156287, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156035089, '2024-10-14'::date, 0, 1, 708942, 1007174, '2024-10-16 08:04:43'::timestamp, 6156287, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156035098, '2024-10-15'::date, 0, 1, 708942, 1007174, '2024-10-16 08:04:43'::timestamp, 6156287, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156074954, '2024-10-17'::date, 0, 1, 708942, 1007174, '2024-10-18 07:57:23'::timestamp, 6158056, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156074957, '2024-10-18'::date, 0, 1, 708942, 1007174, '2024-10-18 07:57:23'::timestamp, 6158056, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156121456, '2024-10-21'::date, 0, 1, 708942, 1007174, '2024-10-22 10:08:42'::timestamp, 6160568, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156121464, '2024-10-22'::date, 0, 1, 708942, 1007174, '2024-10-22 10:08:42'::timestamp, 6160568, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156139422, '2024-10-23'::date, 1, 1, 708942, 1007174, '2024-10-23 09:09:00'::timestamp, 6161501, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156248452, '2024-10-28'::date, 0, 1, 708942, 1007174, '2024-10-31 07:31:25'::timestamp, 6165016, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156248473, '2024-10-25'::date, 0, 1, 708942, 1007174, '2024-10-31 07:31:25'::timestamp, 6165016, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156248474, '2024-10-30'::date, 0, 1, 708942, 1007174, '2024-10-31 07:31:25'::timestamp, 6165016, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156248500, '2024-10-24'::date, 0, 1, 708942, 1007174, '2024-10-31 07:31:25'::timestamp, 6165016, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156248527, '2024-10-31'::date, 0, 1, 708942, 1007174, '2024-10-31 07:31:25'::timestamp, 6165016, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156267483, '2024-11-01'::date, 0, 1, 708942, 1007174, '2024-11-01 08:30:48'::timestamp, 6165749, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156297412, '2024-11-04'::date, 1, 1, 708942, 1007174, '2024-11-04 08:52:39'::timestamp, 6166636, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156317082, '2024-11-05'::date, 1, 1, 708942, 1007174, '2024-11-05 08:03:30'::timestamp, 6167308, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156337013, '2024-11-06'::date, 1, 1, 708942, 1007174, '2024-11-06 07:40:32'::timestamp, 6167842, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156383162, '2024-11-07'::date, 1, 1, 708942, 1007174, '2024-11-08 07:45:33'::timestamp, 6169070, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156383167, '2024-11-08'::date, 1, 1, 708942, 1007174, '2024-11-08 07:45:33'::timestamp, 6169070, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156452562, '2024-11-11'::date, 0, 1, 708942, 1007174, '2024-11-12 09:15:54'::timestamp, 6170255, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156452563, '2024-11-12'::date, 0, 1, 708942, 1007174, '2024-11-12 09:15:54'::timestamp, 6170255, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156486080, '2024-11-14'::date, 0, 1, 708942, 1007174, '2024-11-14 08:06:40'::timestamp, 6171581, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156486101, '2024-11-13'::date, 0, 1, 708942, 1007174, '2024-11-14 08:06:40'::timestamp, 6171581, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156519761, '2024-11-18'::date, 0, 1, 708942, 1007174, '2024-11-18 08:06:22'::timestamp, 6172443, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156536564, '2024-11-19'::date, 0, 1, 708942, 1007174, '2024-11-19 08:11:17'::timestamp, 6173225, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156561693, '2024-11-21'::date, 0, 1, 708942, 1007174, '2024-11-21 08:13:51'::timestamp, 6174040, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156589983, '2024-11-22'::date, 0, 1, 708942, 1007174, '2024-11-22 09:14:45'::timestamp, 6174851, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156616248, '2024-11-25'::date, 1, 1, 708942, 1007174, '2024-11-25 08:47:10'::timestamp, 6175784, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156638125, '2024-11-26'::date, 0, 1, 708942, 1007174, '2024-11-26 08:19:54'::timestamp, 6176580, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156673864, '2024-11-27'::date, 0, 1, 708942, 1007174, '2024-11-27 09:10:07'::timestamp, 6177451, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155797384, '2024-09-25'::date, 1, 1, 708942, 1007174, '2024-09-26 07:55:37'::timestamp, 6146695, '2024-11-27 09:13:40'::timestamp, 6177451, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156704496, '2024-11-28'::date, 0, 1, 708942, 1007174, '2024-11-28 08:30:13'::timestamp, 6178276, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154767976, '2024-05-29'::date, 1, 1, 708942, 1007174, '2024-07-19 09:46:50'::timestamp, 6110860, '2024-11-28 10:25:42'::timestamp, 6178387, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155518766, '2024-09-02'::date, 0, 1, 708942, 1007174, '2024-09-05 07:46:14'::timestamp, 6138165, '2024-11-28 10:28:31'::timestamp, 6178387, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155518772, '2024-09-03'::date, 0, 1, 708942, 1007174, '2024-09-05 07:46:14'::timestamp, 6138165, '2024-11-28 10:28:31'::timestamp, 6178387, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (155518887, '2024-09-04'::date, 0, 1, 708942, 1007174, '2024-09-05 07:46:14'::timestamp, 6138165, '2024-11-28 10:28:31'::timestamp, 6178387, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156779756, '2024-11-29'::date, 0, 1, 708942, 1007174, '2024-12-02 08:14:40'::timestamp, 6180150, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156779768, '2024-12-02'::date, 1, 1, 708942, 1007174, '2024-12-02 08:14:40'::timestamp, 6180150, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156815674, '2024-12-03'::date, 1, 1, 708942, 1007174, '2024-12-03 07:54:14'::timestamp, 6181185, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156924287, '2024-12-05'::date, 0, 1, 708942, 1007174, '2024-12-06 18:32:31'::timestamp, 6188423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156924307, '2024-12-06'::date, 0, 1, 708942, 1007174, '2024-12-06 18:32:31'::timestamp, 6188423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (156924335, '2024-12-04'::date, 0, 1, 708942, 1007174, '2024-12-06 18:32:31'::timestamp, 6188423, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157009263, '2024-12-09'::date, 0, 1, 708942, 1007174, '2024-12-09 16:45:08'::timestamp, 6194118, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157185771, '2024-12-12'::date, 0, 1, 708942, 1007174, '2024-12-13 09:13:03'::timestamp, 6200649, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157185779, '2024-12-13'::date, 0, 1, 708942, 1007174, '2024-12-13 09:13:03'::timestamp, 6200649, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157185814, '2024-12-10'::date, 0, 1, 708942, 1007174, '2024-12-13 09:13:03'::timestamp, 6200649, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (154149248, '2024-05-01'::date, 0, 1, 708942, 1007174, '2024-05-20 19:36:37'::timestamp, 6088063, '2024-12-18 14:23:36'::timestamp, 6208891, FALSE, 0, NULL, NULL, NULL, 1, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157396024, '2024-12-16'::date, 0, 1, 708942, 1007174, '2024-12-18 23:10:46'::timestamp, 6209730, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157396052, '2024-12-17'::date, 0, 1, 708942, 1007174, '2024-12-18 23:10:46'::timestamp, 6209730, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157396056, '2024-12-18'::date, 0, 1, 708942, 1007174, '2024-12-18 23:10:46'::timestamp, 6209730, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157508075, '2024-12-19'::date, 0, 1, 708942, 1007174, '2024-12-20 10:10:36'::timestamp, 6211599, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (157508076, '2024-12-20'::date, 0, 1, 708942, 1007174, '2024-12-20 10:10:36'::timestamp, 6211599, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295447, '2025-03-07'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295454, '2025-03-17'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295457, '2025-03-11'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295476, '2025-03-25'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295494, '2025-04-03'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295514, '2025-03-12'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295522, '2025-04-02'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295535, '2025-03-06'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295536, '2025-03-14'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295546, '2025-03-24'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295550, '2025-03-10'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295554, '2025-03-21'::date, 1, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295555, '2025-03-19'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295556, '2025-03-20'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295577, '2025-03-27'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295604, '2025-03-13'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295619, '2025-03-18'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295637, '2025-03-26'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295676, '2025-04-01'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295678, '2025-03-28'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295691, '2025-03-31'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295697, '2025-04-25'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295719, '2025-04-15'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295765, '2025-04-16'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295776, '2025-04-11'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295809, '2025-04-08'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295820, '2025-04-09'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295823, '2025-04-14'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295847, '2025-04-24'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295848, '2025-04-07'::date, 1, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295859, '2025-04-10'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295870, '2025-04-23'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295882, '2025-04-04'::date, 0, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158295929, '2025-04-22'::date, 1, 1, 718781, 1007174, '2025-04-25 10:00:44'::timestamp, 6263593, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776390, '2025-05-30'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776447, '2025-05-21'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776448, '2025-05-15'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776457, '2025-05-23'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776472, '2025-05-29'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776480, '2025-05-22'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776501, '2025-05-14'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776508, '2025-05-19'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776533, '2025-05-20'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776566, '2025-05-28'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776586, '2025-05-27'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776611, '2025-06-02'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776631, '2025-05-16'::date, 0, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776857, '2025-05-09'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776947, '2025-05-07'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777014, '2025-05-08'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777016, '2025-05-12'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777026, '2025-05-02'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777037, '2025-05-05'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777045, '2025-05-06'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777050, '2025-04-28'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777082, '2025-04-29'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777085, '2025-04-30'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158777090, '2025-05-13'::date, 0, 1, 718781, 1007174, '2025-06-02 15:16:25'::timestamp, 6289279, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015794, '2025-06-12'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015810, '2025-06-05'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015825, '2025-06-11'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015886, '2025-06-10'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015894, '2025-06-03'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015919, '2025-06-04'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015953, '2025-06-09'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159015962, '2025-06-06'::date, 0, 1, 718781, 1007174, '2025-06-25 13:05:01'::timestamp, 6299916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603774, '2025-07-16'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603788, '2025-07-31'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603809, '2025-07-23'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603813, '2025-07-01'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603819, '2025-07-09'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603821, '2025-07-25'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603825, '2025-07-26'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603844, '2025-07-30'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603845, '2025-07-22'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603868, '2025-07-28'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603872, '2025-07-12'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603908, '2025-07-24'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603919, '2025-07-21'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603924, '2025-07-10'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603927, '2025-07-29'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603938, '2025-07-03'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603941, '2025-07-15'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603946, '2025-07-02'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603952, '2025-07-04'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603959, '2025-07-11'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603977, '2025-07-17'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603986, '2025-07-14'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603992, '2025-07-18'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159604007, '2025-07-08'::date, 0, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (158776574, '2025-05-26'::date, 1, 1, 718781, 1007174, '2025-06-02 15:15:58'::timestamp, 6289279, '2025-08-04 17:10:46'::timestamp, 6324202, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603900, '2025-06-30'::date, 1, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, '2025-08-04 17:10:46'::timestamp, 6324202, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159603912, '2025-07-07'::date, 1, 1, 718781, 1007174, '2025-08-04 16:56:06'::timestamp, 6324202, '2025-08-04 17:10:46'::timestamp, 6324202, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159604694, '2025-06-07'::date, 0, 1, 718781, 1007174, '2025-08-04 17:10:46'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (159604698, '2025-05-24'::date, 0, 1, 718781, 1007174, '2025-08-04 17:10:46'::timestamp, 6324202, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528518, '2025-08-27'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528533, '2025-09-04'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528534, '2025-08-28'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528536, '2025-08-29'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528545, '2025-09-24'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528546, '2025-09-01'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528547, '2025-09-20'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528557, '2025-08-12'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528562, '2025-08-22'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528568, '2025-09-18'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528582, '2025-08-30'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528589, '2025-08-01'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528590, '2025-08-05'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528596, '2025-09-17'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528622, '2025-09-10'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528636, '2025-09-08'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528639, '2025-09-19'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528640, '2025-08-18'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528641, '2025-09-15'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528647, '2025-08-06'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528661, '2025-09-12'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528665, '2025-08-26'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528666, '2025-08-14'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528677, '2025-08-07'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528685, '2025-09-25'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528688, '2025-08-21'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528692, '2025-09-23'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528694, '2025-09-05'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528695, '2025-09-09'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528698, '2025-09-11'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528717, '2025-08-19'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528718, '2025-09-02'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528721, '2025-09-03'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528724, '2025-09-22'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528732, '2025-08-20'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528733, '2025-08-15'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528742, '2025-08-08'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528744, '2025-08-11'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528755, '2025-08-04'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528757, '2025-08-25'::date, 0, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528532, '2025-08-13'::date, 1, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, '2025-10-01 12:58:39'::timestamp, 6366916, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160528762, '2025-09-16'::date, 1, 1, 718781, 1007174, '2025-09-25 21:52:10'::timestamp, 6364135, '2025-10-01 12:58:39'::timestamp, 6366916, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160598185, '2025-09-29'::date, 0, 1, 718781, 1007174, '2025-10-01 12:58:39'::timestamp, 6366916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160598227, '2025-10-01'::date, 0, 1, 718781, 1007174, '2025-10-01 12:58:39'::timestamp, 6366916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160598236, '2025-09-30'::date, 0, 1, 718781, 1007174, '2025-10-01 12:58:39'::timestamp, 6366916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160598259, '2025-09-26'::date, 1, 1, 718781, 1007174, '2025-10-01 12:58:39'::timestamp, 6366916, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160732302, '2025-10-07'::date, 0, 1, 718781, 1007174, '2025-10-09 23:02:37'::timestamp, 6372945, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160732319, '2025-10-09'::date, 0, 1, 718781, 1007174, '2025-10-09 23:02:37'::timestamp, 6372945, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160732323, '2025-10-02'::date, 0, 1, 718781, 1007174, '2025-10-09 23:02:37'::timestamp, 6372945, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160732375, '2025-10-03'::date, 0, 1, 718781, 1007174, '2025-10-09 23:02:37'::timestamp, 6372945, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160732379, '2025-10-06'::date, 0, 1, 718781, 1007174, '2025-10-09 23:02:37'::timestamp, 6372945, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino.frequencia_aluno (id_frequencia, "data", frequencia, horarios, id_turma, id_discente, data_cadastro, id_registro_cadastro, data_atualizacao, id_registro_atualizacao, ativo, atual, id_motivo_baixa_frequencia, abonada, id_event_log, id_motivo_inativacao, abonada_escola)
VALUES (160732444, '2025-10-08'::date, 0, 1, 718781, 1007174, '2025-10-09 23:02:37'::timestamp, 6372945, 'NULL'::timestamp, NULL, TRUE, 0, NULL, NULL, NULL, NULL, NULL);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES (1007174, 1005221, 'ESCOLA MUNICIPAL CELESTINO PIMENTEL-CIDADE DA ESPERANÇA=RN', NULL, NULL, TRUE, FALSE, NULL, NULL, NULL, TRUE, FALSE);

UPDATE diario.historico_implantado
SET
id_estudante = 1007174
WHERE id_historico_implantado IN (54769, 54770);

UPDATE diario.competencia_habilidades_aluno
SET
id_discente = 1007174
WHERE id IN (96839, 96840);

UPDATE matricula.renovacao_matricula
SET
id_discente = 1007174
WHERE id_renovacao_matricula IN (56066716);

UPDATE ensino.frequencia_aluno
SET
id_discente = 1007174
WHERE id_frequencia IN (155550823, 155573351, 155573353, 154149207, 154149208, 154149209, 154149210, 154149211, 154149212, 154149213, 154149214, 154149215, 154149216, 154149217, 154149218, 154149219, 154149220, 154149221, 154149222, 154149223, 154149224, 154149225, 154149226, 154149227, 154149228, 154149229, 154149230, 154149231, 154149232, 154149233, 154149234, 154149235, 154149236, 154149237, 154149238, 154149239, 154149240, 154149241, 154149242, 154149243, 154149244, 154149245, 154149246, 154149247, 154149249, 154149250, 154149251, 154149252, 154149253, 154149254, 154149255, 154149256, 155608769, 155608782, 155609052, 155609060, 155609073, 155609086, 155609087, 155609117, 155609134, 155609156, 155609216, 155609244, 155609249, 155609273, 155621305, 155653518, 155682830, 155682849, 155723567, 155723573, 155741293, 154767856, 154767857, 154767862, 154767871, 154767875, 154767876, 154767887, 154767891, 154767895, 154767901, 154767902, 154767907, 154767913, 154767931, 154767934, 154767937, 154767938, 154767943, 154767949, 154767950, 154767954, 154767964, 154767966, 154767967, 154767987, 154768001, 154768025, 154768026, 154768041, 154768053, 154768060, 154768062, 154768064, 154768068, 154768090, 154768098, 155797385, 155797399, 155041005, 155041014, 155041025, 155041026, 155041033, 155041037, 155041040, 155041119, 155041186, 155041196, 155041202, 155041208, 155834403, 155834413, 155852641, 155250792, 155250794, 155250817, 155250872, 155250896, 155928198, 155928244, 155928276, 155928292, 155963009, 155518872, 155518889, 156035011, 156035020, 156035061, 156035089, 156035098, 156074954, 156074957, 156121456, 156121464, 156139422, 156248452, 156248473, 156248474, 156248500, 156248527, 156267483, 156297412, 156317082, 156337013, 156383162, 156383167, 156452562, 156452563, 156486080, 156486101, 156519761, 156536564, 156561693, 156589983, 156616248, 156638125, 156673864, 155797384, 156704496, 154767976, 155518766, 155518772, 155518887, 156779756, 156779768, 156815674, 156924287, 156924307, 156924335, 157009263, 157185771, 157185779, 157185814, 154149248, 157396024, 157396052, 157396056, 157508075, 157508076, 158295447, 158295454, 158295457, 158295476, 158295494, 158295514, 158295522, 158295535, 158295536, 158295546, 158295550, 158295554, 158295555, 158295556, 158295577, 158295604, 158295619, 158295637, 158295676, 158295678, 158295691, 158295697, 158295719, 158295765, 158295776, 158295809, 158295820, 158295823, 158295847, 158295848, 158295859, 158295870, 158295882, 158295929, 158776390, 158776447, 158776448, 158776457, 158776472, 158776480, 158776501, 158776508, 158776533, 158776566, 158776586, 158776611, 158776631, 158776857, 158776947, 158777014, 158777016, 158777026, 158777037, 158777045, 158777050, 158777082, 158777085, 158777090, 159015794, 159015810, 159015825, 159015886, 159015894, 159015919, 159015953, 159015962, 159603774, 159603788, 159603809, 159603813, 159603819, 159603821, 159603825, 159603844, 159603845, 159603868, 159603872, 159603908, 159603919, 159603924, 159603927, 159603938, 159603941, 159603946, 159603952, 159603959, 159603977, 159603986, 159603992, 159604007, 158776574, 159603900, 159603912, 159604694, 159604698, 160528518, 160528533, 160528534, 160528536, 160528545, 160528546, 160528547, 160528557, 160528562, 160528568, 160528582, 160528589, 160528590, 160528596, 160528622, 160528636, 160528639, 160528640, 160528641, 160528647, 160528661, 160528665, 160528666, 160528677, 160528685, 160528688, 160528692, 160528694, 160528695, 160528698, 160528717, 160528718, 160528721, 160528724, 160528732, 160528733, 160528742, 160528744, 160528755, 160528757, 160528532, 160528762, 160598185, 160598227, 160598236, 160598259, 160732302, 160732319, 160732323, 160732375, 160732379, 160732444);

UPDATE ensino.matricula_componente
SET
id_discente = 1007174
WHERE id_matricula_componente IN (17794763, 17794765, 17794764, 17794766, 17794767, 17794759, 17794762, 17794760, 17794761, 18041454, 18041460, 18041452, 18183915, 18183916, 18041453, 18041456, 18041458, 18041457, 18041455, 18041459);

UPDATE basico.matricula_estudante_serie
SET
id_estudante = 1007174
WHERE id_matricula_discente_serie IN (1403548, 1414733);