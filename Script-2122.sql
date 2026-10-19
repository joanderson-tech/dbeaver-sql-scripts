UPDATE ensino.docente_turma	SET id_docente=921 	WHERE id_docente_turma IN (52090849,52113153);

UPDATE pessoas.historico_servidor_terceirizado 	SET id_servidor=921 WHERE id_historico_servidor_terceirizado=52115031;
DELETE FROM rh.servidor WHERE id_servidor=976;


--backup 
UPDATE pessoas.historico_servidor_terceirizado 	SET id_servidor=976 WHERE id_historico_servidor_terceirizado=52115031;
INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(976, '8560', 749530, NULL, '0', NULL, 4, 1, 1, 2890, NULL, NULL, NULL, 0.00, NULL, 605, NULL, 28, false, '8', NULL, NULL, NULL, '2026-03-31 00:00:00.000', NULL, '2026-03-21 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, NULL, NULL, NULL, 'Solicitado por Fernanda Menezes Santana (ticket 202603002557)', NULL, NULL, NULL, 5666378, 5653451, NULL, '', '', NULL, NULL, 0.00, NULL, NULL);



COMMIT;

select * from rh.servidor s where s.id_servidor = 976;

select * from pessoas.historico_servidor_terceirizado  s where s.id_servidor = 976;

select * from pessoas.vaga_administrativa   s where s.id_servidor = 1013;

select * from rh.historico_transferencia_servidores s where s.id_servidor = 1013;




ROLLBACK;

BEGIN;

DELETE FROM rh.servidor WHERE id_servidor=976;


s