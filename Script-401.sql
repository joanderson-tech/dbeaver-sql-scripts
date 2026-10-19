begin;
rollback;

commit;


INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola) VALUES(nextval('hibernate_sequence'), 'ANA BEATRIZ DE MOURA CARVALHO', '2010-03-07', 'F', 1, NULL, NULL, NULL, NULL, NULL, 60729360326, 31, NULL, 'WALLISON CARVALHO SANTOS MOURA', 'PAULA DE MOURA CARVALHO', 'Anabeatrizdemouracarvalho@gmail.com', 1, 'SANTO ANTONIO', 21, 2109106, '503', 'F', false, CURRENT_DATE, 'AVENIDA RIO BRANCO', NULL, '', '', '', '', NULL, '0413399520104', 'SSP', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(84)99108-0217', NULL, CURRENT_DATE, 'ANA BEATRIZ DE MOURA CARVALHO', NULL, NULL, 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2408003, '', NULL, NULL, 'lado ímpar', NULL, 'PAULA DE MOURA CARVALHO', 'MAE', NULL, '2533131393', '59619400', NULL, 2408003, 24, NULL, 'MONTADOR', 'EMPRESARIA', NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '703005830454776', 55069126, NULL, NULL, NULL, NULL, NULL, NULL, '0228164220023', '', 'SSP', '', NULL, NULL, 21, 24, 1, false, '', '', 'MAE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
	

UPDATE public.discenteSET id_pessoa = (SELECT p.id_pessoa FROM comum.pessoa p WHERE p.nome = 'ANA BEATRIZ DE MOURA CARVALHO' LIMIT 1)WHERE id_discente = 1027252;




select matricula , id_pessoa , *  from discente d  where id_pessoa   in (55552861  , 774884);

select * from comum.pessoa p where id_pessoa in (55552861  , 774884);

select * from basico.matricula_estudante_serie mes  where id_estudante in (990082, 990068);

select * from basico.matricula_estudante_serie mes  where id_estudante = 992459;

select * from comum.pessoa p where p.nome = 'ANA BEATRIZ DE MOURA CARVALHO';
select * from comum.pessoa p where nome = 'ANA VITORIA DE MOURA CARVALHO';




UPDATE public.discente
	SET id_pessoa=774884
	WHERE id_discente=1027252;

DELETE FROM comum.pessoa WHERE id_pessoa= (SELECT p.id_pessoa FROM comum.pessoa p WHERE p.nome = 'ANA BEATRIZ DE MOURA CARVALHO' LIMIT 1); 

	
