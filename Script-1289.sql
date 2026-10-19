BEGIN;

--Unicando matricula 201830018037 para 202130005292
SELECT 'UPDATE ensino.frequencia_aluno SET id_discente = 979562 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script, 'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup, COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa
WHERE fa.id_discente IN (975271)
GROUP BY fa.id_discente;

UPDATE basico.matricula_estudante_serie SET id_estudante = 979562 WHERE id_matricula_discente_serie IN (1318939);
UPDATE ensino.matricula_componente SET id_discente = 979562 WHERE id_matricula_componente IN (17006533, 17006534);

DELETE FROM basico.estudante WHERE id_estudante = 975271;
DELETE FROM public.discente WHERE id_discente = 975271;

--Unicando matricula 202230002702 para 202130005292

SELECT 'UPDATE ensino.frequencia_aluno SET id_discente = 979562 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script, 'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup, COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa
WHERE fa.id_discente IN (980106)
GROUP BY fa.id_discente;

UPDATE basico.matricula_estudante_serie SET id_estudante = 979562 WHERE id_matricula_discente_serie IN (1332115, 1334350, 1337416, 1342076);
UPDATE ensino.matricula_componente SET id_discente = 979562 WHERE id_matricula_componente IN (17127425, 17194524, 17194525, 17194526, 17194527, 17194528, 17194523, 17194529, 17127432, 17127433, 17158054, 17127430, 17127426, 17127428, 17127427, 17127431, 17127429, 17158051, 17158048, 17158047, 17158053, 17158050, 17158049, 17158055, 17204605, 17204609, 17204606, 17158052, 17204612, 17237988, 17237989, 17237993, 17237992, 17237991, 17237994, 17237986, 17237990, 17204610, 17204611, 17204608, 17204607, 17204604, 17237987);
UPDATE matricula.renovacao_matricula SET id_discente = 979562 WHERE id_renovacao_matricula IN (52801801);

UPDATE diario.historico_implantado SET id_estudante = 979562 WHERE id_historico_implantado IN (33229);
UPDATE comum.alteracao_pessoa SET id_pessoa = 752898 WHERE id_alteracao_pessoa IN (530626183);
UPDATE educacenso.educacenso_pessoa SET id_pessoa = 752898 WHERE id_educacenso_pessoa IN (199);

DELETE FROM basico.estudante WHERE id_estudante = 980106;
DELETE FROM public.discente WHERE id_discente = 980106;
DELETE FROM comum.pessoa WHERE id_pessoa = 748329;

COMMIT ;



---backup matricula 201830018037
UPDATE basico.matricula_estudante_serie SET id_estudante = 975271 WHERE id_matricula_discente_serie IN (1318939);
UPDATE ensino.matricula_componente SET id_discente = 975271 WHERE id_matricula_componente IN (17006533, 17006534);

INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES (975271, 51869722, '', NULL, NULL, false, false, NULL, NULL, NULL, false, false);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES (975271, 2018, NULL, '201830018037', NULL, 748329, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-09-19 16:57:36.59', NULL, 5700756, NULL, NULL, NULL, NULL, NULL, NULL);

---backup matricula 202230002702
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem) VALUES(980106, 1005220, '', NULL, NULL, true, true, '2024-07-30', 5890703, NULL, false, false, NULL);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES(980106, 2022, NULL, '202230002702', NULL, 748329, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-01-21 16:13:38.974', NULL, 5767135, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula) VALUES(748329, 'SAYAN MATIAS DOS SANTOS', '2013-06-12', 'F', -1, NULL, NULL, NULL, NULL, NULL, 71198530405, 31, NULL, 'FRANCISCO JUNIOR DOS SANTOS SILVA', 'SAMARA MATIAS', '', 1, 'ILHA DE SANTANA', 24, 2407203, '125', 'F', false, '2025-01-16 10:43:32.231', 'RUA PROJETADA', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2018-09-19 16:57:36.583', 'SAYAN MATIAS DOS SANTOS', NULL, NULL, 'BRASILEIRO', false, '0', 'N', '', '', '', NULL, 2407203, '', '09391401552013100025168002630713', NULL, '', NULL, 'SAMARA  MATIAS', 'MÃE', NULL, NULL, '59500-000', NULL, 2407203, 24, NULL, '', '', NULL, NULL, NULL, '130188018734', NULL, false, NULL, 52636594, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '898004804405129', 52918373, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 24, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, NULL, 1);

UPDATE basico.matricula_estudante_serie SET id_estudante = 980106 WHERE id_matricula_discente_serie IN (1332115, 1334350, 1337416, 1342076);
UPDATE ensino.matricula_componente SET id_discente = 980106 WHERE id_matricula_componente IN (17127425, 17194524, 17194525, 17194526, 17194527, 17194528, 17194523, 17194529, 17127432, 17127433, 17158054, 17127430, 17127426, 17127428, 17127427, 17127431, 17127429, 17158051, 17158048, 17158047, 17158053, 17158050, 17158049, 17158055, 17204605, 17204609, 17204606, 17158052, 17204612, 17237988, 17237989, 17237993, 17237992, 17237991, 17237994, 17237986, 17237990, 17204610, 17204611, 17204608, 17204607, 17204604, 17237987);
UPDATE matricula.renovacao_matricula SET id_discente = 980106 WHERE id_renovacao_matricula IN (52801801);

UPDATE diario.historico_implantado SET id_estudante = 980106 WHERE id_historico_implantado IN (33229);
UPDATE comum.alteracao_pessoa SET id_pessoa = 748329 WHERE id_alteracao_pessoa IN (530626183);
UPDATE educacenso.educacenso_pessoa SET id_pessoa = 748329 WHERE id_educacenso_pessoa IN (199);
