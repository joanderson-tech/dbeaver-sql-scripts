--backup

UPDATE ensino.matricula_componente 
	set id_discente = 1402904 
	where id_matricula_componente  in (18241328, 18241329, 18241330, 18241331, 18241332, 18241333, 18241334, 18241335, 18241336);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1402904
	WHERE id_matricula_discente_serie=1501949;


UPDATE ensino.frequencia_aluno 
	SET id_discente= 1402904
	WHERE id_frequencia in (154389856, 154390009, 154390060, 154390123, 154390356, 154390595, 154391357, 154390989, 154391047, 154391178, 154391736, 154391896, 154390658, 154392489, 154392675, 154392869, 154391582, 154393111, 154393595, 154393433, 154393782, 154394608, 154623717, 154649436, 154879609, 154879425, 154880293, 154880543, 154880127, 155202874, 155203030, 155203080, 155409621, 155518076, 155828557, 155828820, 155940907, 156306328, 157165050, 157166243, 157166771, 157167173, 157921007, 157921085, 157921270, 157921339, 157921480, 158198226, 158198291, 158198356, 158198505, 158572722, 158572801, 158719840, 158719941, 158741211, 158741231, 158741294, 158741364, 158783464, 158947677, 158947610, 159164378, 159164672, 159348769, 159348886, 159485352, 159586059);

INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1402904, 1005219, 'SENADOR JOSÉ COELHO', NULL, NULL, true, false, '2024-04-25', 6405998, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1402904, 2024, NULL, '202430082674', NULL, 774197, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-02-26 11:15:23.899', NULL, 6298307, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(774197, 'JHONATA NATHAN MADEIRO DO NASCIMENTO', '2016-10-28', 'M', 6, NULL, NULL, NULL, NULL, NULL, 14134907438, 31, NULL, 'JOSE TEXEIRA DO NASCIMENTO', 'CLAUDIANE MADEIRO DOS SANTOS', '', 1, 'VILA IRMÃ DOURADO', 26, 2611101, 'S/N', 'F', false, '2024-04-25 16:59:11.675', 'MARIA TEREZA', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(87)99171-1280', NULL, '2024-02-26 11:15:23.898', 'JHONATA NATHAN MADEIRO DO NASCIMENTO', NULL, NULL, '', false, '0', 'N', '', '', '', NULL, 2611101, '', '0767450155201610037186', NULL, 'AREA 19', NULL, 'CLAUDIANE MADEIRO DOS SANTOS', 'MAE', 'CPF', '10492906408', '56300-000', NULL, 2611101, 26, NULL, 'AGRICUTOR', 'AGRICULTOR', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '183015378332', NULL, '70500744689458', 61731675, NULL, NULL, NULL, NULL, NULL, NULL, '8778838', '8445722', 'SDS', 'SDS', NULL, NULL, 26, 26, NULL, false, '', '', 'MAE', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--Solução
UPDATE ensino.matricula_componente 
	set id_discente =1347800 
	where id_matricula_componente  in (18241328, 18241329, 18241330, 18241331, 18241332, 18241333, 18241334, 18241335, 18241336);

UPDATE basico.matricula_estudante_serie
	SET id_estudante=1347800
	WHERE id_matricula_discente_serie=1501949;

UPDATE ensino.frequencia_aluno 
	SET id_discente= 1347800
	WHERE id_frequencia in (154389856, 154390009, 154390060, 154390123, 154390356, 154390595, 154391357, 154390989, 154391047, 154391178, 154391736, 154391896, 154390658, 154392489, 154392675, 154392869, 154391582, 154393111, 154393595, 154393433, 154393782, 154394608, 154623717, 154649436, 154879609, 154879425, 154880293, 154880543, 154880127, 155202874, 155203030, 155203080, 155409621, 155518076, 155828557, 155828820, 155940907, 156306328, 157165050, 157166243, 157166771, 157167173, 157921007, 157921085, 157921270, 157921339, 157921480, 158198226, 158198291, 158198356, 158198505, 158572722, 158572801, 158719840, 158719941, 158741211, 158741231, 158741294, 158741364, 158783464, 158947677, 158947610, 159164378, 159164672, 159348769, 159348886, 159485352, 159586059);

DELETE FROM basico.estudante WHERE id_estudante=1402904;

DELETE FROM public.discente WHERE id_discente=1402904;

DELETE FROM comum.pessoa WHERE id_pessoa=774197; 