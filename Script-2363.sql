SELECT * FROM comum.pessoa p WHERE p.nome ilike '%POLIANE DA SILVA CALIXTO%';

SELECT * FROM comum.alteracao_pessoa ap WHERE ap.id_pessoa IN (51887756, 747928);

SELECT * FROM educacenso.educacenso_pessoa WHERE id_pessoa IN (51887756, 747928);

SELECT * FROM rh.servidor WHERE id_pessoa IN (51887756, 747928);

SELECT * FROM comum.pessoa p WHERE p.nome_mae  ilike '%pedro da silva%';

SELECT * FROM comum.usuario u WHERE u.id_pessoa IN (51887756, 747928);


BEGIN;

UPDATE comum.alteracao_pessoa 	SET id_pessoa=747928	WHERE id_alteracao_pessoa=519547561;
UPDATE educacenso.educacenso_pessoa 	SET id_pessoa=747928	WHERE id_educacenso_pessoa=44;
UPDATE rh.servidor 	SET id_pessoa=747928 WHERE id_servidor=752;

DELETE FROM comum.pessoa WHERE id_pessoa=51887756;


ROLLBACK ;

--backup

UPDATE comum.alteracao_pessoa SET id_pessoa=51887756 WHERE id_alteracao_pessoa=519547561;
UPDATE educacenso.educacenso_pessoa SET id_pessoa=51887756 WHERE id_educacenso_pessoa=44;
UPDATE rh.servidor 	SET id_pessoa=51887756 WHERE id_servidor=752;
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia, data_nascimento_filiacao_1, data_nascimento_filiacao_2, data_nascimento_responsavel) VALUES(51887756, 'POLIANE DA SILVA CALIXTO', '1992-10-08', 'F', NULL, NULL, NULL, '', NULL, NULL, 9538963407, 31, NULL, '', 'LUZINETE PEDRO DA SILVA', '', NULL, '', 25, 2511202, '', 'F', true, '2026-05-22 08:41:57.559', '', NULL, '', '', '', '', NULL, '', '', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2026-03-12 17:29:05.009', 'POLIANE DA SILVA CALIXTO', NULL, NULL, '', false, '0', NULL, '', '', '', NULL, NULL, '', '', NULL, '', NULL, '', '', NULL, NULL, '', NULL, NULL, -1, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
