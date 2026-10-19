select * from comum.pessoa p where p.nome = 'LARA TAUANA ANDRADE DE SOUZA';
select * from discente d where d.id_pessoa in (52778354, 775499 );
select * from basico.estudante e where e.id_estudante in (1359546, 1403896);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (11359546, 1403896);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1387054;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1387054;
select * from ensino.abono_frequencia af where af.id_estudante = 1387054;
select * from escola.solicitacao_documento sd where sd.id_estudante =  1387054;

BEGIN;
commit;
rollback;


--SOLUÇÃO
--Updated Rows	95
UPDATE ensino.frequencia_aluno SET id_discente= 1359546
WHERE id_frequencia in (157535212, 154920272, 155032313, 157647861, 155457841, 155559841,
155704922, 156396032, 156585881, 156815810, 157956118, 158014553, 158085919, 158314550, 
158377828, 158741857, 158815135, 158910019, 158910060, 159216586, 159379539, 159379708, 
157582543, 157582582, 157582599, 157582663, 157582755, 157582771, 158094412, 158099761, 
158152031, 158494957, 158991006, 158991196, 155161606, 155846780, 155846833, 157842999, 
156060734, 157856246, 157065566, 158550902, 158550970, 158550849, 158550865, 159022266, 
159022282, 159022384, 159124114, 155187889, 155751533, 157775592, 156871283, 158180206, 
158515625, 159117175, 159437501, 155188088, 157781720, 155751896, 156877140, 158180413, 
158516419, 159119060, 159437651, 156061051, 156061559, 157856276, 157856332, 159124130,
159124176, 159124192, 159124208, 155188547, 155752351, 156879392, 158180620, 158517075, 
159119192, 159437741, 155188652, 155752540, 156879481, 158180656, 158517269, 159119208, 
159437757, 157288018, 156047935, 156049223, 157868467, 158225747, 158615719, 159087514, 159086795);

--Updated Rows	9
update ensino.matricula_componente set id_discente =1359546 where id_matricula_componente  in (18280789, 18280787, 18280794, 18280793, 18280792, 18280790, 18280795, 18280788, 18280791);

UPDATE basico.matricula_estudante_serie SET id_estudante=1359546 WHERE id_matricula_discente_serie in (1504597);

update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (63032671);

UPDATE transporte.rota_discente
	SET id_discente=1359546
	WHERE id_rota_discente=6003;

UPDATE comum.veiculo_transporte_escolar_estudante
	SET id_estudante=1359546
	WHERE id_veiculo_transporte_escolar_estudante=488;

DELETE FROM basico.estudante WHERE id_estudante=1403896;

DELETE FROM public.discente WHERE id_discente=1403896;

DELETE FROM comum.pessoa WHERE id_pessoa=775499; 

--backup

UPDATE ensino.frequencia_aluno SET id_discente= 1403896
WHERE id_frequencia in (157535212, 154920272, 155032313, 157647861, 155457841, 155559841,
155704922, 156396032, 156585881, 156815810, 157956118, 158014553, 158085919, 158314550, 
158377828, 158741857, 158815135, 158910019, 158910060, 159216586, 159379539, 159379708, 
157582543, 157582582, 157582599, 157582663, 157582755, 157582771, 158094412, 158099761, 
158152031, 158494957, 158991006, 158991196, 155161606, 155846780, 155846833, 157842999, 
156060734, 157856246, 157065566, 158550902, 158550970, 158550849, 158550865, 159022266, 
159022282, 159022384, 159124114, 155187889, 155751533, 157775592, 156871283, 158180206, 
158515625, 159117175, 159437501, 155188088, 157781720, 155751896, 156877140, 158180413, 
158516419, 159119060, 159437651, 156061051, 156061559, 157856276, 157856332, 159124130,
159124176, 159124192, 159124208, 155188547, 155752351, 156879392, 158180620, 158517075, 
159119192, 159437741, 155188652, 155752540, 156879481, 158180656, 158517269, 159119208, 
159437757, 157288018, 156047935, 156049223, 157868467, 158225747, 158615719, 159087514, 159086795);

update ensino.matricula_componente set id_discente = 1403896 
where id_matricula_componente  in (18280789, 18280787, 18280794,
18280793, 18280792, 18280790, 18280795, 18280788, 18280791);

UPDATE basico.matricula_estudante_serie SET id_estudante=1403896 WHERE id_matricula_discente_serie in (1504597);

update basico.estudante_documento_pendente set id_estudante = 1403896 where id_estudante_documento_pendente in (63032671);

UPDATE comum.veiculo_transporte_escolar_estudante
	SET id_estudante=1403896
	WHERE id_veiculo_transporte_escolar_estudante=488;

UPDATE transporte.rota_discente
	SET id_discente=1403896
	WHERE id_rota_discente=6003;


INSERT INTO basico.estudante
(id_estudante, id_serie_ingresso, escola_anterior, data_matricula, id_opcao_turno, participa_bolsa_familia, utiliza_transporte_escolar_publico, data_atualizacao, id_registro_atualizacao, codigo_inep, participa_escotismo, participa_tributo_crianca)
VALUES(1403896, 1005226, 'ESCOLA ARMANDO DIAS - SÃO PAULO', NULL, NULL, true, true, '2024-05-28', 6477909, NULL, false, false);

INSERT INTO public.discente
(id_discente, ano_ingresso, periodo_ingresso, matricula, observacao, id_pessoa, id_gestora_academica, nivel, status, matricula_temp, id_forma_ingresso, ch_integralizada, prazo_conclusao, data_colacao_grau, codmergpa, id_curso, id_curriculo, formando, matricula_antiga, tipo, id_foto, id_perfil, data_cadastro, id_pessoa_transferencia, id_registro_entrada, nivel_antigo, id_curso_antigo, periodo_atual, id_historico_digital, matricula_sem_digito, alterado_cadastrado)
VALUES(1403896, 2024, NULL, '202430092269', NULL, 775499, NULL, 'B', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-04-08 16:56:15.603', NULL, 6345613, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO comum.pessoa
(id_pessoa, nome, data_nascimento, sexo, id_raca, id_endereco_residencial, id_endereco_contato, passaporte, id_grau_formacao, abreviatura, cpf_cnpj, id_pais_nacionalidade, id_tipo_etnia, nome_pai, nome_mae, email, id_estado_civil, bairro, id_uf_naturalidade, id_municipio_naturalidade, numero, tipo, valido, ultima_atualizacao, endereco, id_conta_bancaria, numero_certificado_militar, serie_certificado_militar, categoria_certificado_militar, orgao_expedicao_certificado_militar, data_expedicao_certificado_militar, numero_identidade, orgao_expedicao_identidade, id_unidade_federativa_identidade, data_expedicao_identidade, numero_titulo_eleitor, zona_titulo_eleitor, secao_titulo_eleitor, data_expedicao_titulo_eleitor, id_unidade_federativa_titulo_eleitor, id_uf_identidade, id_uf_titulo_eleitor, id_uf_certificado_militar, codigo_area_nacional_telefone_celular, codigo_area_nacional_telefone_fixo, origem, telefone_fixo, telefone_celular, fax, data_cadastro, nome_ascii, id_tipo_rg, tipo_sanguineo, pais_nacionalidade, estrangeiro, certidao_civil_tipo, certidao_civil_modelo, certidao_civil_num_termo, certidao_civil_num_folha, certidao_civil_num_livro, certidao_civil_data, certidao_civil_id_municipio_cartorio, certidao_civil_cartorio, certidao_civil_matricula_nova, cod_educacenso, complemento, codigo_rh, nome_responsavel_matricula, grau_parentesco_responsavel_matricula, tipo_documento_responsavel_matricula, numero_documento_responsavel_matricula, cep, codigo_rh_old, id_municipio_contato, id_uf_contato, id_pessoa_restauracao, profissaopai, profissaomae, codigo_unificado, id_pessoa_unificada, id_orgao_emissor_identidade, codigo_nis, certidao_civil_cartorio_codigo_inep, "semCpf", justificativa, id_bairro_endereco, id_tipo_documento_militar, id_tipo_militar, documento_militar, semcpf, municipio_ext, uf_naturalidade_ext, codigo_inep, id_escolaridade, codigo_sus, id_informacoes_medicas, endereco_atual, bairro_atual, cep_atual, id_dados_pessoa_censo, email_alternativo, pis_pasep, numero_identidade_mae, numero_identidade_pai, orgao_expedicao_identidade_mae, orgao_expedicao_identidade_pai, data_expedicao_identidade_mae, data_expedicao_identidade_pai, id_uf_identidade_mae, id_uf_identidade_pai, id_localizacao_zona, possui_laudo, telefone_celular2, telefone_celular3, contato_celular, contato_celular2, contato_celular3, id_tipo_tamanho_camisa, id_tamanho_camisa_letra, tamanho_camisa_livre, id_tipo_tamanho_short_calca, id_tamanho_short_calca_letra, tamanho_short_calca_livre, tamanho_calcado, nome_social)
VALUES(775499, 'LARA TAUANA ANDRADE DE SOUZA', '2009-04-04', 'F', -1, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, '', 'ALEXSANDRO SANTOS DE SOUZA', '', -1, '', 26, 2611101, '', 'F', false, '2024-04-08 16:56:15.602', '', NULL, '', '', '', '', NULL, '', '', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '(47)99920-5865', NULL, '2024-04-08 16:56:15.602', 'LARA TAUANA ANDRADE DE SOUZA', NULL, NULL, '', false, '1', 'A', '42031', '263', 'A50', '2009-04-22', 2611101, 'UILZA CARLA TORRES RODRIGUES CASTRO', '', NULL, '', NULL, '', '', 'CPF', '5290933590', '', NULL, 2611101, 26, NULL, '', '', NULL, NULL, NULL, '', NULL, false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', 63032670, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, 26, 26, NULL, false, '', '', '81982652807', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


  select * from comum.veiculo_transporte_escolar_estudante
  where id_estudante = 1403896
