SELECT distinct  mes.*   
FROM comum.pessoa p 
LEFT JOIN discente d ON d.id_pessoa = p.id_pessoa 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente
LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie 
LEFT JOIN escola.escola e ON e.id_escola = ts.id_escola 
LEFT JOIN basico.serie s ON s.id_serie = ts.id_serie
WHERE p.nome ILIKE 'DAVI LUIZ MARTINS DE QUEIROZ' ;

ORDER BY mes.id_matricula_discente_serie ;
--DAVI LUIZ MARTINS DE QUEIROZ id_estudante 974024

SELECT * FROM matricula.vaga_serie_movimentacao;

SELECT * FROM matricula.vaga_serie

SELECT * FROM matricula.vaga_serie_ocupacao;

SELECT st.*
FROM basico.matricula_estudante_serie mes
JOIN matricula.solicitacao_transferencia st ON
st.id_matricula_discente_serie = mes.id_matricula_discente_serie;
WHERE mes.id_matricula_discente_serie IN (1320526,1320886);

SELECT * FROM matricula.movimentacao_estudante_escola WHERE id_matricula_estudante_serie  IN (1320526,1320886);

SELECT mee.*
FROM basico.matricula_estudante_serie mes
JOIN matricula.movimentacao_estudante_escola mee ON mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
WHERE mes.id_estudante = 974024
AND mee.id_tipo_sol_transferencia = 3; 

SELECT * FROM comum.alteracao_pessoa WHERE id_pessoa = 747152;

SELECT 1  FROM matricula.movimentacao_estudante_escola mee  WHERE mee.id_matricula_estudante_serie = 1317871 AND mee.id_tipo_sol_transferencia =  3;


DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1320899;

DELETE FROM basico.estudante WHERE id_estudante=974686;

DELETE FROM public.discente WHERE id_discente=974686;

DELETE FROM comum.pessoa WHERE id_pessoa=747152;

DELETE FROM comum.alteracao_pessoa
WHERE id_alteracao_pessoa=520273058;

SELECT * FROM basico.estudante e WHERE e.id_estudante = 974684;
SELECT * FROM discente d WHERE d.id_pessoa  = 747152;



INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula)
VALUES(747152, 'DAVI LUIZ MARTINS DE QUEIROZ', '2016-08-28', 'M', 1, NULL, NULL, NULL, NULL, NULL, 17112618401, 31, NULL, 'GENILDO BEZERRA DE QUEIROZ', 'VERDANIA MARTINS DA SILVA', '', 1, 'ZONA RURAL', 24, 2408102, '114', 'F', false, '2025-05-28 07:58:54.053', 'Sítio Garcia', NULL, '', '', '', '', NULL, '', '', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(84)99637-3035', NULL, '2020-01-23 09:35:17.918', 'DAVI LUIZ MARTINS DE QUEIROZ', NULL, 'A+', 'BRASILEIRA', false, '0', 'N', '', '', '', NULL, 2411809, '', '09386401552016100073226005199546', NULL, '', NULL, 'Verdania Martins da Silva', '', 'CPF', '8168510429', '59327-000', NULL, 2411809, 24, NULL, 'Agricultor', 'Agricultora', NULL, NULL, NULL, '23756469650', NULL, false, NULL, 830, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 52086117, NULL, NULL, NULL, NULL, NULL, NULL, '4065897', '', 'SSP', '', NULL, NULL, 24, 24, 2, false, '', '', 'VERDÂNIA', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '', 8168510429, 0, NULL, NULL, 1);

INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie, bloquear_renovacao)
VALUES(1320898, 974684, 1, NULL, NULL, NULL, false, 5654914, '2025-09-26 16:39:03.362', NULL, 51998580, 2025, 2, NULL, 1, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2025-09-26 16:34:28.984', NULL, NULL, 1, false);

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca, id_tipo_instituicao_origem)
VALUES(974684, 51998579, NULL, NULL, NULL, false, false, NULL, NULL, NULL, false, false, NULL);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(974684, 2025, NULL, '202530000653', NULL, 747152, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-09-26 16:38:58.535', NULL, 5654914, NULL, NULL, NULL, NULL, NULL, NULL);