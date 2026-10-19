SELECT * FROM discente d WHERE d.id_pessoa IN (755776, 777897);

SELECT p.id_pessoa, p.nome, p.data_nascimento, p.cpf_cnpj, p.nome_mae, p.nome_pai FROM comum.pessoa AS p WHERE id_pessoa IN (755776, 777897);

SELECT * FROM comum.pessoa p WHERE p.cpf_cnpj = '71091139490';

-- pessoa dados correto 755776 --errado 777897

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 777897;
select * from comum.pessoa_recurso_avaliacao_nee pran where id_pessoa = 777897;


BEGIN;

--solução 
UPDATE public.discente 	SET id_pessoa=755776	WHERE id_discente=989745;
UPDATE comum.pessoa_necessidade_especial	SET id_pessoa=755776	WHERE id_pessoa_necessidade_especial=56129805;
UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=755776	WHERE id_pessoa_recurso_avaliacao_nee=130284494;
--rodar no banco comum tambem
DELETE FROM comum.pessoa WHERE id_pessoa=777897;

COMMIT;



--backup 
INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia, data_nascimento_filiacao_1, data_nascimento_filiacao_2, data_nascimento_responsavel)
VALUES(777897, 'ENZO GABRIEL SILVA DE OLIVEIRA', '2014-09-01', 'M', 1, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, 'JOYCE SILVA DE BRITO', 'ALEXSANDRO DE OLIVEIRA DE ARAUJO', '', NULL, 'NOVO AMARANTE', 24, 2412005, '24', 'F', false, '2025-12-02 14:23:46.823', 'Rua 11 de Outubro', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '84996330905', NULL, '2025-01-29 10:10:45.001', 'ENZO GABRIEL SILVA DE OLIVEIRA', NULL, NULL, 'BRASILEIRA', false, '0', NULL, '', '', '', NULL, 2412005, '', '', NULL, '', NULL, 'joyce silva de brito', '', NULL, '70851120423', '59296310', NULL, 2412005, 24, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 56085605, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 24, 24, 1, true, '', '', 'JOYCE SILVA DE BRITO', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, false, '', 0, 0, NULL, NULL, -1, NULL, NULL, '', NULL, NULL, NULL);

UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=777897	WHERE id_pessoa_recurso_avaliacao_nee=130284494;
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=777897	WHERE id_pessoa_necessidade_especial=56129805;
UPDATE public.discente 	SET id_pessoa=777897	WHERE id_discente=989745;

--backup banco comum 
INSERT INTO comum.pessoa
(id_pessoa, endereco, cep, uf, telefone, celular, fax, tipo, cpf_cnpj, complemento, nome_representante, nome, bairro, cidade, matricula, id_cargo, nome_fantasia, data_nascimento, sexo, email, funcionario, nitpis, emite_fatura, aliquota_imposto, internacional, passaporte, pais_origem, ultima_atualizacao, valido, nome_ascii, origem, nome_mae, numero, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, data_cadastro, "semCpf", justificativa, pais_nacionalidade, id_municipio_naturalidade, id_uf_naturalidade, numero_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, orgao_expedicao_identidade, id_estado_civil, id_raca, codigo_familia)
VALUES(777897, 'Rua 11 de Outubro', '59000-000', NULL, '9999-9999', '84996330905', NULL, 'F', NULL, 'Testes', NULL, 'ENZO GABRIEL SILVA DE OLIVEIRA', 'Testes', NULL, 0, 1, NULL, '2014-09-01', 'M', '', NULL, NULL, false, NULL, false, NULL, NULL, NULL, false, 'ENZO GABRIEL SILVA DE OLIVEIRA', NULL, 'ALEXSANDRO DE OLIVEIRA DE ARAUJO', NULL, NULL, NULL, NULL, NULL, '2025-03-07 14:16:37.514', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


