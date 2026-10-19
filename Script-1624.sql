SELECT * FROM comum.pessoa p WHERE p.nome = 'FABIO DE CARVALHO CAMILO';

SELECT * FROM comum.pessoa p 
JOIN comum.usuario u ON u.id_pessoa = p.id_pessoa 
WHERE u.login = 'binhodicarvalho@gmail.com';

SELECT * FROM rh.servidor s WHERE s.id_pessoa IN (351884,753173,754356, 750639);

--login aponta para pessoa 351884

--pessoa mais correta 754356 errada 753173, 750639 //  dicente correto  980614 errado 979654, 977359

--idServidor 351884

351884,753173,754356

SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN  (351884,753173,754356, 750639);

SELECT * FROM discente d WHERE d.id_pessoa IN (351884,753173,754356, 750639);

SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante IN (979654,980614, 977359);

-- Auto-generated SQL script #202601121615
UPDATE comum.pessoa 	SET nome='FABIO DE CARVALHO CAMILO', nome_ascii='FABIO DE CARVALHO CAMILO'	WHERE id_pessoa=351884;

--backp
UPDATE comum.pessoa 	SET nome='DAVID LUCAS SOARES DE SOUSA', nome_ascii='DAVID LUCAS SOARES DE SOUSA'	WHERE id_pessoa=351884;


BEGIN;

ROLLBACK;
---///////////////////////////////////////////////////////////////////////////////////////

BEGIN;

SELECT 'UPDATE basico.matricula_estudante_serie SET id_estudante = 980614 WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS Solucao, 'UPDATE basico.matricula_estudante_serie SET id_estudante = ' || mes.id_estudante || ' WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' bacupt
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (979654, 977359)
GROUP BY mes.id_estudante;

SELECT 'UPDATE ensino.matricula_componente SET id_discente = 980614 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao, 'UPDATE ensino.matricula_componente SET id_discente = ' || mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup, COUNT(mc.id_matricula_componente) AS quantidade_ids
FROM ensino.matricula_componente mc
WHERE mc.id_discente IN (979654, 977359)
GROUP BY mc.id_discente;

SELECT 'UPDATE ensino.frequencia_aluno SET id_discente = 980614 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script, 'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup, COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa
WHERE fa.id_discente IN (979654, 977359)
GROUP BY fa.id_discente;

--
UPDATE matricula.renovacao_matricula SET id_discente = 980614 WHERE id_renovacao_matricula = 52487162;
UPDATE diario.competencia_habilidades_aluno SET id_discente = 980614 WHERE id IN (46468);
UPDATE ensino.observacao_discente SET id_discente = 980614 WHERE id_observacao_discente IN (52442680,1170);

UPDATE comum.pessoa 	SET nome='FABIO DE CARVALHO CAMILO', nome_ascii='FABIO DE CARVALHO CAMILO'	WHERE id_pessoa=351884;
UPDATE basico.estudante_documento_pendente SET id_estudante = 980614 WHERE id_estudante_documento_pendente IN (52030228);
UPDATE basico.movimentacao_estudante 	SET id_discente=980614 	WHERE id_movimentacao_estudante=69077;

DELETE FROM basico.estudante WHERE id_estudante=979654;
DELETE FROM basico.estudante WHERE id_estudante=977359;

DELETE FROM public.discente WHERE id_discente=979654;
DELETE FROM public.discente WHERE id_discente=977359;

DELETE FROM comum.pessoa WHERE id_pessoa=753173;
DELETE FROM comum.pessoa WHERE id_pessoa=750639;

COMMIT;

--backp
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, codigo_sus, id_escolaridade, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia, data_nascimento_filiacao_1, data_nascimento_filiacao_2, data_nascimento_responsavel) VALUES(753173, 'DAVID LUCAS SOARES DE SOUSA', '2012-01-03', 'M', -1, NULL, NULL, NULL, NULL, NULL, 16656082424, 31, NULL, 'JOSÉ DIEGO SOUZA DA SILVA', 'AMANDA SOARES SANTANA', '', 1, 'PERNAMBUQUINHO', 24, 2408102, '12', 'F', false, '2020-02-13 14:40:45.829', 'RUA PROJETO CRESCER', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '(84)87-222119', '(84)99917-9064', NULL, '2020-02-13 14:40:45.829', 'DAVID LUCAS SOARES DE SOUSA', NULL, NULL, 'BRASILEIRA', false, '1', 'N', '', '', '', NULL, 2414209, '', '093900155201200055161002793213', NULL, '', NULL, 'AMANDA SOARES SANTANA', 'MÃE', NULL, NULL, '59178-000', NULL, 2414209, 24, NULL, '', 'COZINHEIRA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '700502588773559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, codigo_sus, id_escolaridade, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia, data_nascimento_filiacao_1, data_nascimento_filiacao_2, data_nascimento_responsavel) VALUES(750639, 'DAVID LUCAS SOARES DE SOUZA', '2012-01-03', 'M', -1, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, 'JOSÉ DIOGO SOUZA DA SILVA', 'AMANDA SOARES SANTANA', '', -1, '', 24, 2408102, '', 'F', false, '2017-03-14 07:23:48.485', '', NULL, '', '', '', '', NULL, '', '', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2017-03-14 07:23:48.485', 'DAVID LUCAS SOARES DE SOUZA', NULL, NULL, '', false, '1', 'A', '27932', '151', 'A-55', '2012-01-13', 2404200, '2º OFÍCIO D NOTAS', '', NULL, '', NULL, 'AMANDA SOARES SANTANA', 'MÃE', 'RG', '003238264', '', NULL, 2408102, 24, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(979654, 2020, NULL, '202030003179', NULL, 753173, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2020-02-13 14:40:45.861', NULL, 5706432, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(977359, 2017, NULL, '201730003210', NULL, 750639, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2017-03-14 07:23:48.491', NULL, 5642447, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(979654, 1005220, '', NULL, NULL, false, true, NULL, NULL, NULL, false, false, NULL);
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(977359, 51870505, '', NULL, NULL, true, true, NULL, NULL, NULL, false, false, NULL);

UPDATE matricula.renovacao_matricula SET id_discente = 979654 WHERE id_renovacao_matricula = 52487162;
UPDATE diario.competencia_habilidades_aluno SET id_discente = 979654 WHERE id IN (46468);

UPDATE ensino.observacao_discente SET id_discente = 979654 WHERE id_observacao_discente IN (52442680,1170);
UPDATE comum.pessoa 	SET nome='DAVID LUCAS SOARES DE SOUSA', nome_ascii='DAVID LUCAS SOARES DE SOUSA'	WHERE id_pessoa=351884;

UPDATE basico.estudante_documento_pendente SET id_estudante = 977359 WHERE id_estudante_documento_pendente IN (52030228);
UPDATE basico.movimentacao_estudante 	SET id_discente=977359 	WHERE id_movimentacao_estudante=69077;



