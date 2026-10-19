select p from rh.servidor s 
join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where p.nome ilike '%ANA PAULA DOS SANTOS DE ANDRADE%';



select * from rh.servidor s where s.id_servidor = 1013;

select * from pessoas.historico_servidor_terceirizado  s where s.id_servidor = 1013;

select * from pessoas.vaga_administrativa   s where s.id_servidor = 1013;

select * from rh.historico_transferencia_servidores s where s.id_servidor = 1013;



begin;

rollback;

DELETE FROM rh.historico_transferencia_servidores WHERE id_historico_transferencia_servidor=52415015;
DELETE FROM pessoas.vaga_administrativa WHERE id_vaga_administrativa=42;
DELETE FROM pessoas.historico_servidor_terceirizado WHERE id_historico_servidor_terceirizado=54472896;
DELETE FROM rh.servidor WHERE id_servidor=1013;


INSERT INTO rh.historico_transferencia_servidores (id_historico_transferencia_servidor, id_unidade_origem, id_unidade_destino, data_transferencia, id_servidor, id_usuario, id_registro_cadastro, data_cadastro) VALUES(52415015, 605, 27223950, '2015-09-01 00:00:00.000', 1013, 104887, 5685505, '2023-08-18 15:12:53.305');
INSERT INTO pessoas.vaga_administrativa (id_vaga_administrativa, id_unidade, id_atividade, ch_semanal, id_turno, ativo, id_area_administrativa, data_atualizacao, id_registro_atualizacao, id_usuario_atualizacao, ano, codigo_rh, dt_inicio, dt_termino, id_servidor, dedicacao_exclusiva, vaga_readaptacao, dt_publicacao, justificativa_alocacao, nr_portaria, ch_semanal_original, servidor_alocado_por_regra_excessao_gestor_direc, id_turno_original, justificativa_remocao, id_usuario_alocacao, data_alocacao, data_cadastro, id_registro_cadastro, permite_alocacao_em_qualquer_vaga_administrativa) VALUES(42, 27223950, 51893573, 30, 518755152, true, 100, '2023-08-18 16:52:55.270', 5685505, NULL, 2023, NULL, '2015-09-01', NULL, 1013, false, false, NULL, 'NOMEADA ATRAVÉS DA PORTARIA 325/2015, INDICAÇÃO', NULL, 40, false, 518755152, NULL, 104887, '2023-08-18 16:50:53.102', '2023-08-18 15:02:39.031', 5685505, false);
INSERT INTO pessoas.historico_servidor_terceirizado (id_historico_servidor_terceirizado, id_servidor, id_ativo, id_usuario_alteracao, data_inicio, data_fim, justificativa_movimentacao, id_registro_atualizacao, data_atualizacao) VALUES(54472896, 1013, 4, 1, '2023-02-13', NULL, 'reste', 6135520, '2025-09-04 16:32:49.479');
INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(1013, '000513', 746592, NULL, '1', NULL, 1, 1, 2, 807, NULL, NULL, NULL, 0.00, NULL, 27223950, NULL, 30, false, '1', NULL, NULL, NULL, NULL, NULL, '2025-09-04 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6135520, 5624177, 11, '', '', 605, '2015-09-01 00:00:00.000', 0.00, NULL, NULL);



-- Auto-generated SQL script #202509051022
UPDATE pessoas.historico_servidor_terceirizado
	SET id_ativo=4
	WHERE id_historico_servidor_terceirizado=54497112;
