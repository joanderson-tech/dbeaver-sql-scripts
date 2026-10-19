begin;
-- 03 FREQUENCIA
SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 974121 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa 
where fa.id_discente IN (975228) GROUP by fa.id_discente;	

UPDATE basico.matricula_estudante_serie SET id_estudante = 974121 WHERE id_matricula_discente_serie IN (1323037, 1323820);
UPDATE ensino.matricula_componente SET id_discente = 974121 WHERE id_matricula_componente IN (17053632, 17053629, 17053634, 17053633, 17053631, 17053630, 17053627, 17053628, 17073583, 17073584, 17073585, 17073586, 17073587, 17073588, 17073589, 17073590, 17073582, 17053635, 17063605, 17063606);
UPDATE matricula.renovacao_matricula SET id_discente = 974121 WHERE id_renovacao_matricula IN (52221479);
UPDATE diario.competencia_habilidades_aluno SET id_discente = 974121 WHERE id IN (44411, 44412, 44573);
UPDATE diario.historico_implantado SET id_estudante = 974121 WHERE id_historico_implantado IN (29579, 29580);

UPDATE educacao_especial.atendimento_educacao_especial_estudante SET id_estudante = 974121 WHERE id_atendimento_educacao_especial_estudante IN (52155291, 52156600, 52237392, 52237395, 52239855, 52239849);
UPDATE basico.documento_estudante SET id_estudante = 974121 WHERE id_documento_estudante IN (52145894, 52234151);
UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa = 747119 WHERE id_pessoa_recurso_avaliacao_nee IN (130284170);
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=747119 WHERE id_pessoa_necessidade_especial in (52270475,52270476);

DELETE FROM comum.pessoa_necessidade_especial WHERE id_pessoa_necessidade_especial=52221481;
DELETE FROM basico.estudante WHERE id_estudante = 975228;
DELETE FROM public.discente WHERE id_discente = 975228;
DELETE FROM comum.pessoa WHERE id_pessoa = 748546;
UPDATE comum.pessoa SET id_pessoa = 747119 , nome_responsavel_matricula = 'GENINNY KALLINE DANTAS DOS SANTOS' , grau_parentesco_responsavel_matricula = 'MÃE'  WHERE id_pessoa = 747119;


commit;

-----BACKUP
UPDATE comum.pessoa SET cpf_cnpj = 15638755438, data_nascimento = '2015-10-07', nome = 'DAVID ALESSANDRO DANTAS CABRAL', id_raca = NULL, sexo = 'M', nome_responsavel_matricula = '', grau_parentesco_responsavel_matricula = '', tipo_documento_responsavel_matricula = NULL, numero_documento_responsavel_matricula = '0', nome_mae = 'GENINNY KALLINE DANTAS DOS SANTOS', nome_pai = 'JOATAN CABRAL', nome_ascii = 'DAVID ALESSANDRO DANTAS CABRAL' WHERE id_pessoa = 747119;
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, codigo_sus, id_escolaridade, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social) VALUES (748546, 'DAVID ALESSANDRO DANTAS CABRAL', '2015-10-07', 'M', NULL, NULL, NULL, NULL, NULL, NULL, 15638755438, 31, NULL, 'JOATAN CABRAL', 'GENINNY KALLINE DANTAS DOS SANTOS', '', NULL, 'CENTRO', 24, 2402402, '345A9', 'F', false, '2025-08-15 09:13:26.644', 'RUA JUVENAL LAMARTINE', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(83)98121-4886', NULL, '2023-12-22 08:29:11.389', 'DAVID ALESSANDRO DANTAS CABRAL', NULL, NULL, 'BRASILEIRO', false, '0', 'N', '', '', '', NULL, 2402402, '', '09387201552015100076252004310216', NULL, '', NULL, 'GENINNY KALLINE DANTAS DOS SANTOS', 'MÃE', NULL, '0', '59374-000', NULL, 2402402, 24, NULL, 'MECANICO', 'DONA DE CASA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '705801426445030', NULL, 52141119, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 24, 24, NULL, true, '', '', 'AVÓ', '', '', NULL, NULL, '', NULL, NULL, '', '0', NULL);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES (975228, 2024, NULL, '202430000374', NULL, 748546, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-12-22 08:29:11.39', NULL, 5664766, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES (975228, 1005220, 'E. M. E. F. ELIETE SOUZA DE ARAUJO SILVA', NULL, NULL, false, false, '2025-08-15', 5692872, NULL, false, false);
INSERT INTO comum.pessoa_necessidade_especial (id_pessoa_necessidade_especial, observacao, id_necessidade_especial, id_pessoa, id_pessoa_transferencia, codmergcomperve) VALUES(52221481, NULL, 9, 748546, NULL, NULL);

UPDATE comum.pessoa_necessidade_especial SET id_pessoa=748546 WHERE id_pessoa_necessidade_especial in (52270475,52270476);
UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa = 748546 WHERE id_pessoa_recurso_avaliacao_nee IN (130284170);
UPDATE basico.documento_estudante SET id_estudante = 975228 WHERE id_documento_estudante IN (52145894, 52234151);
UPDATE educacao_especial.atendimento_educacao_especial_estudante SET id_estudante = 975228 WHERE id_atendimento_educacao_especial_estudante IN (52155291, 52156600, 52237392, 52237395, 52239855, 52239849);

UPDATE diario.historico_implantado SET id_estudante = 975228 WHERE id_historico_implantado IN (29579, 29580);
UPDATE diario.competencia_habilidades_aluno SET id_discente = 975228 WHERE id IN (44411, 44412, 44573);
UPDATE matricula.renovacao_matricula SET id_discente = 975228 WHERE id_renovacao_matricula IN (52221479);
UPDATE ensino.matricula_componente SET id_discente = 975228 WHERE id_matricula_componente IN (17053632, 17053629, 17053634, 17053633, 17053631, 17053630, 17053627, 17053628, 17073583, 17073584, 17073585, 17073586, 17073587, 17073588, 17073589, 17073590, 17073582, 17053635, 17063605, 17063606);
UPDATE basico.matricula_estudante_serie SET id_estudante = 975228 WHERE id_matricula_discente_serie IN (1323037, 1323820);
