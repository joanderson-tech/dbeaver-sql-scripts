SELECT *
FROM discente d
WHERE d.id_discente  = 1438543;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 1438543
AND mes.ano_calendario = 2026;

SELECT *
FROM comum.pessoa p
WHERE p.nome = 'ANDY YHAIR VILLAMIZAR GARCIA';

SELECT *
FROM basico.unificacao_estudante ue
WHERE ue.matricula_manter = '202530061935';
--na mes 1651387 teve uma unificação

2026-03-03 11:27:58.989
2026-03-03 11:28:07.509

ANDY YHAIR VILLAMIZAR GARCI
ANDY YHAIR VILLAMIZAR GARCIA

/*Na DATA e hora 2026-03-03 11:27:58.989	da matricula serie 1651387 
 * teve o cadastro conforme ao sistema faz, teve a informação para o 
 * usuario unificar o estudante e não foi unificado
 * 
 * Na DATA e hora 2026-03-03 11:27:58.989 da matricula serie 1651389 o 
 * sistema faz mesma coisa de cima, nesse caso foi criado matricula para
 * cada pessoas ja que tinha uma duplicação. 
 * 
 * No dia 11/03/2026 10:29:58 teve a unificação pelo caso de uso de unificação 
 * onde o cliente manteve a matricula 202530061935 e unificou a matricula 202530080805 
 * e o id da pessoas duplicada 800315.
 * 
 * Portando concluio que se o o usuario x ao efetivar a matricula , teve a opção de unificar o estudante 
 * no cado de uso da matricula e não fez, com isso ele criou duas matriculas com status ativado e na hora da 
 * unificação o sistema fez o updade e não mudou o status como é o comportamento. com isso ele ficou
 * com duas matriculas ativas em 2026.
 * 
 * */ 

SELECT * FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie IN (1581541);


UPDATE basico.matricula_estudante_serie SET id_estudante = 1438543
WHERE id_matricula_discente_serie IN (1581541);

UPDATE ensino.matricula_componente SET id_discente = 1438543
WHERE id_matricula_componente IN (19969742, 19969737, 19969738, 19969739, 19969740, 19969741);

UPDATE ensino.frequencia_aluno SET id_discente = 1438543
WHERE id_frequencia IN (177279457, 177634241, 177634256, 177634259, 177634276, 177634314, 177685351, 177775905, 177834299, 178887566, 178936316, 178936595, 178936444, 178936537, 178936723, 178936682, 178936739, 178936849, 178936865, 178936906, 178936947, 178971738, 179178228, 179352518, 179570433, 179594349);

UPDATE educacenso.educacenso_pessoa SET id_pessoa = 797726
WHERE id_educacenso_pessoa IN (229378);

DELETE FROM basico.estudante WHERE id_estudante = 1440739;

DELETE FROM ensino.frequencia_aluno WHERE id_discente = 1440739;

DELETE FROM public.discente WHERE id_discente = 1440739;

UPDATE public.discente SET id_pessoa = 797726 WHERE id_pessoa = 800315;

DELETE FROM comum.pessoa WHERE id_pessoa = 800315;


202530080805
202530061935

---####################

INSERT INTO comum.pessoa (id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, codigo_sus, id_escolaridade, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, id_tipo_tamanho_calca, id_tamanho_calca_letra, tamanho_calca_livre, nome_social, quilombola, cid, cpf_filiacao_1, cpf_filiacao_2, id_tamanho_camisa_predefinido, id_tamanho_short_calca_predefinido, id_grau_parentesco_responsavel_matricula, id_povo_indigena, id_foto_reconhecimento_facial, codigo_familia) VALUES (800315, 'ANDY YHAIR VILLAMIZAR GARCIA', '2022-11-25', 'M', 1, NULL, NULL, NULL, NULL, NULL, 7077726134, 51, NULL, 'EUDES YHAIR VILLAMIZAR SUESCUN', 'SHIRLEY ALEXANDRA GARCIA GUEVARA', 'ALEXANDTAGUEVARA0927@GMAIL.COM', NULL, 'UMBURUCU', NULL, NULL, '100', 'F', false, '2025-07-03 11:28:09.522', 'CONDOMINIO VALE DO SOL MAIS VIVER', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(87)99106-5478', NULL, '2025-05-16 13:56:50.998', 'ANDY YHAIR VILLAMIZAR GARCIA', NULL, 'A+', 'COLOMBIANA', true, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'APTO 103', NULL, 'SHIRLEY ALEXANDRA GARCIA GUEVARA', 'MÃE', 'CPF', '7076240106', '56300-000', NULL, 2611101, 26, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, 'SARAVENA ARAUCA', '', '', '705803439670536', NULL, 82894328, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 26, 26, 1, false, '', '', 'MÃE', '', '', 1, NULL, '2', 1, NULL, '2', '23', NULL, NULL, NULL, NULL,'f','','0','0',NULL,NULL,'1',NULL,NULL,NULL);
INSERT INTO public.discente (id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado) VALUES (1440739, 2025, NULL, '202530080805', NULL, 800315, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-05-16 13:56:50.999', NULL, 7318869, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.estudante (id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca) VALUES (1440739, 51869713, 'CENTRO MUNICIPAL DE EDUCACAO INFANTIL WALLISON PEDRO SOUZA DE SA', NULL, NULL, false, false, '2025-07-03', 7457287, NULL, false, false);
UPDATE educacenso.educacenso_pessoa SET id_pessoa = 800315 WHERE id_educacenso_pessoa IN (229378);UPDATE ensino.frequencia_aluno SET id_discente = 1440739 WHERE id_frequencia IN (177279457, 177634241, 177634256, 177634259, 177634276, 177634314, 177685351, 177775905, 177834299, 178887566, 178936316, 178936595, 178936444, 178936537, 178936723, 178936682, 178936739, 178936849, 178936865, 178936906, 178936947, 178971738, 179178228, 179352518, 179570433, 179594349);
UPDATE ensino.matricula_componente SET id_discente = 1440739 WHERE id_matricula_componente IN (19969742, 19969737, 19969738, 19969739, 19969740, 19969741);
UPDATE basico.matricula_estudante_serie SET id_estudante = 1440739 WHERE id_matricula_discente_serie IN (1581541);