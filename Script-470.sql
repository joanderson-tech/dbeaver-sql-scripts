select * from rh.servidor s where s.id_pessoa in (746975,746832);

select * from comum.pessoa p where p.nome = 'MARLEIDE ARAUJO';

select  string_agg(id_docente_turma::varchar, ', ') from ensino.docente_turma dt where dt.id_docente = 150;

select * from pessoas.historico_servidor_terceirizado where id_servidor = 150;

select * from comum.alteracao_pessoa ap where ap.id_pessoa = 746975;

select * from educacenso.educacenso_pessoa ep where ep.id_pessoa = 746975;


--pessoa correta 746832 --errada 746975
commit;

begin;
rollback;

UPDATE ensino.docente_turma SET id_docente=163 WHERE id_docente_turma in (51910591, 51910402, 51911055, 51910700, 51911058);

DELETE FROM rh.servidor WHERE id_servidor=150;

UPDATE comum.alteracao_pessoa SET id_pessoa=746832 WHERE id_alteracao_pessoa in (519109852, 519113927, 519114210);

UPDATE educacenso.educacenso_pessoa SET id_pessoa=746832 WHERE id_educacenso_pessoa=93;

DELETE FROM comum.pessoa WHERE id_pessoa=746975;

--backup

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2) VALUES(746975, 'MARLEIDE ARAUJO', '1979-09-16', 'F', 5, NULL, NULL, NULL, NULL, NULL, 1431430420, 31, NULL, 'FRANCISCA DE ARAUJO', 'GERALDO CIRIACO DE ARAUJO', '', NULL, 'CENTRO', 24, 2412708, '11', 'F', false, '2025-05-01 10:24:22.525', 'RUA MILTON FERNANDES DE MOURA', 519079860, NULL, NULL, NULL, NULL, NULL, '', '', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2025-04-15 11:06:35.675', 'MARLEIDE ARAUJO', NULL, NULL, 'BRASILEIRA', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(150, '000', 746975, NULL, '0', NULL, 1, 1, 1, 1752, NULL, NULL, NULL, 0.00, NULL, 605, NULL, 20, false, '8', NULL, NULL, NULL, NULL, NULL, '2025-03-02 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5628318, 5627998, NULL, '', '', NULL, NULL, 0.00, NULL, NULL);

UPDATE ensino.docente_turma SET id_docente=150 WHERE id_docente_turma in (51910591, 51910402, 51911055, 51910700, 51911058);

UPDATE comum.alteracao_pessoa SET id_pessoa=746975 WHERE id_alteracao_pessoa in (519109852, 519113927, 519114210);

UPDATE educacenso.educacenso_pessoa SET id_pessoa=746975 WHERE id_educacenso_pessoa=93;






