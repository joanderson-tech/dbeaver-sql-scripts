
INSERT INTO comum.pessoa_necessidade_especial
(id_pessoa_necessidade_especial, observacao, id_necessidade_especial, id_pessoa, id_pessoa_transferencia, codmergcomperve)
VALUES(52253860, NULL, 6, 748559, NULL, NULL);

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(975391, 51870468, '', NULL, NULL, false, false, NULL, NULL, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(975391, 2023, NULL, '202330001243', NULL, 748559, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2023-01-31 10:57:14.565', NULL, 5819988, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(748559, 'GREGORIO JOSE SANTOS DE MEDEIROS', '2020-07-03', 'M', 1, NULL, NULL, NULL, NULL, NULL, 17242947413, 31, NULL, 'JAILSON PEREIRA DE MEDEIROS', 'ROSEANE OLIVEIRA DOS SANTOS', '', 1, 'NOVO HORIZONTE', 24, 2403103, '104', 'F', false, '2023-01-31 10:57:14.564', 'RUA DOUTOR MÁRIO NÓBREGA DE ARAÚJO', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2023-01-31 10:57:14.564', 'GREGORIO JOSE SANTOS DE MEDEIROS', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2403004, '', '09554701552020100013170000476931', NULL, '', NULL, 'ROSEANE OLIVEIRA DOS SANTOS', 'Mãe', 'CPF', '6397151417', '59375-000', NULL, 2403004, 24, NULL, 'AGRICULTOR', 'PSICÓLOGA', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24035262', NULL, '702507771958040', 52253859, NULL, NULL, NULL, NULL, NULL, NULL, '2509453', '3293691', 'SSP', 'SSP', NULL, NULL, 24, 24, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE basico.movimentacao_estudante
	SET id_discente=975391
	WHERE id_movimentacao_estudante=68789;

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=748559
	WHERE id_pessoa_necessidade_especial=52253861;

UPDATE ensino.matricula_componente 
	SET id_discente =975391 
	WHERE id_matricula_componente  in (17062688, 17062685, 17062673, 17062676, 17062679, 17062682);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=975391
	WHERE id_matricula_discente_serie=1322975;
	
UPDATE ensino.frequencia_aluno 
	SET id_discente= 975391
	WHERE id_frequencia in (138708633, 138708634, 138708635, 138708636, 138708637, 138708638, 138708639, 138708640, 138708641, 138708642, 138708788, 138709060, 138708787, 138708786, 138709303, 138730298, 138730314, 138730330, 138734033, 138734048);

update ensino.observacao_discente set id_discente = 975391 where id_observacao_discente = 522620670;


--SOLUÇÃO

UPDATE ensino.matricula_componente 
	SET id_discente =975538 
	WHERE id_matricula_componente  in (17062688, 17062685, 17062673, 17062676, 17062679, 17062682);


UPDATE basico.matricula_estudante_serie
	SET id_estudante=975538
	WHERE id_matricula_discente_serie=1322975;
	
UPDATE ensino.frequencia_aluno 
	SET id_discente= 975538
	WHERE id_frequencia in (138708633, 138708634, 138708635, 138708636, 138708637, 138708638, 138708639, 138708640, 138708641, 138708642, 138708788, 138709060, 138708787, 138708786, 138709303, 138730298, 138730314, 138730330, 138734033, 138734048);

update ensino.observacao_discente set id_discente = 975538 where id_observacao_discente = 522620670;

UPDATE basico.movimentacao_estudante
	SET id_discente=975538
	WHERE id_movimentacao_estudante=68789;

UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=748744
	WHERE id_pessoa_necessidade_especial=52253861;

DELETE FROM comum.pessoa_necessidade_especial
WHERE id_pessoa_necessidade_especial=52253860;

DELETE FROM basico.estudante WHERE id_estudante=975391;

DELETE FROM public.discente WHERE id_discente=975391;

DELETE FROM comum.pessoa WHERE id_pessoa=748559; 



UPDATE comum.pessoa_necessidade_especial
	SET id_pessoa=770264
	WHERE id_pessoa_necessidade_especial=61515158;

UPDATE public.discente
	SET id_pessoa=770264
	WHERE id_discente=1398268;


DELETE FROM comum.pessoa WHERE id_pessoa=768894; 