SELECT *
FROM comum.pessoa
WHERE nome ILIKE '%MOISES DANTAS DE SOUSA%';

SELECT *
FROM rh.servidor s
WHERE s.id_pessoa = 751105;

SELECT * FROM pessoas.vaga_historico WHERE id_servidor IN (1059,2123 ) ;

SELECT * FROM pessoas.historico_servidor_terceirizado WHERE id_servidor IN (1059,2123 ) ;


ROLLBACK;

BEGIN;

COMMIT;

--SOLUÇÃO
DELETE FROM pessoas.historico_servidor_terceirizado WHERE id_historico_servidor_terceirizado=53774053;
DELETE FROM pessoas.vaga_historico WHERE id_vaga_historico=53774051;
DELETE FROM rh.servidor WHERE id_servidor=2123;



---BACKUP
INSERT INTO rh.servidor (id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, codigo_rh, id_designacao, codigo_rh_pessoa_old, codigo_rh_pessoa_new, codigo_rh_old, reducao_regime, codigo_inep, qualificacao, codigo_legado, data_ultimo_login_mobile, id_entrada, ja_alocado_completamente_apos_encaminhamento, id_tipo_contrato_servidor, forma_vacancia, data_resposta_ficha_atualizacao, id_instituicao, justificativa_finalizacao, justificativa_reducao_regime, justificativa_remocao_reducao_regime, ds_referencia, id_registro_atualizacao, id_registro_cadastro, id_classe_servidor, numero_contrato_1, numero_contrato_2, id_unidade_transferida, data_transferencia, salario, numero_termo_aditivo, quantidade_meses_termo_aditivo) VALUES(2123, '701028', 751105, NULL, '1', NULL, 4, 1, 2, 1953, NULL, NULL, NULL, 0.00, NULL, 3284, NULL, 40, false, '8', NULL, NULL, NULL, '2026-02-13 00:00:00.000', NULL, '2026-02-13 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, NULL, NULL, NULL, 'alteração', NULL, NULL, NULL, 6025684, 6025585, 11, '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO pessoas.vaga_historico (id_vaga_historico, data_inicio, data_fim, id_servidor, ch_semanal, id_vaga_administrativa, justificativa_alocacao, data_atualizacao, id_registro_atualizacao, vaga_readaptacao, dt_publicacao, nr_portaria, dt_publicacao_fim, nr_portaria_fim, codigo_rh, id_afastamento, desalocacao_automatica, justificativa_desalocacao, id_encaminhamento_unidade, id_usuario_alocacao, data_alocacao) VALUES(53774051, '2026-02-10', '2026-02-10', 2123, 40, 462, 'AUX ADMINISTRATIVO', '2026-02-13 14:04:46.602', 6025647, false, NULL, NULL, NULL, NULL, NULL, NULL, false, 'alteeração', NULL, NULL, NULL);
INSERT INTO pessoas.historico_servidor_terceirizado (id_historico_servidor_terceirizado, id_servidor, id_ativo, id_usuario_alteracao, data_inicio, data_fim, justificativa_movimentacao, id_registro_atualizacao, data_atualizacao) VALUES(53774053, 2123, 1, 105778, '2026-02-13', '2026-02-13', 'alteração', 6025684, '2026-02-13 14:08:04.231');
