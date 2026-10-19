select *
from basico.matricula_estudante_serie mes
where mes.id_estudante = 1018188;

DELETE FROM ensino.frequencia_aluno WHERE id_frequencia in (150380290, 150398140, 150418387, 150418588, 150418599, 150418601, 150418638, 150418642, 150418657, 150418664, 150418667, 150418691, 150418696, 150418722, 150418749, 150436859, 150455215, 150559418, 150559425, 150559456, 150559466, 150579367, 150653685, 150653700, 150653716, 150709548, 150709558, 150709561, 150728540, 150766546, 150794704, 150825132, 150901288, 150901302, 150901327, 150968399, 150968431, 150968435, 150968441, 151022096, 151022090, 151099267, 151099300, 151099303, 151204924, 151204939, 151204949);

DELETE FROM comum.alteracao_status_aluno WHERE id_alteracao=544332880;

DELETE FROM basico.alteracao_matricula_serie WHERE id_alteracao_matricula_serie in (699336,699808,699809);

DELETE FROM ensino.observacao_discente WHERE id_observacao_discente in (541666712,544332910);

DELETE FROM basico.movimentacao_estudante WHERE id_movimentacao_estudante in(78815, 79144);

DELETE FROM matricula.emissao_documento_matricula WHERE id_emissao_documento_matricula in (1155011,1155013);

DELETE FROM ensino.matricula_componente WHERE id_matricula_componente in (17843102,17843103);

DELETE FROM basico.matricula_estudante_serie WHERE id_matricula_discente_serie=1385381;




select * from  matricula.renovacao_matricula rm  where rm.id_discente= 1018188;

select * from matricula.renovacao_matricula_resultado rmr where rmr.id_renovacao_matricula = 84132460;

select * from matricula.emissao_documento_matricula where  id_matricula_estudante_serie = 1625103;

select * from basico.alteracao_matricula_serie where id_matricula_discente_serie = 1625103;

select  * from matricula.vaga_serie_movimentacao vsm where vsm.id_renovacao_matricula = 84132460;

DELETE FROM educacenso.educacenso_pessoa WHERE id_educacenso_pessoa=207395;


begin;

DELETE FROM matricula.emissao_documento_matricula WHERE id_emissao_documento_matricula in (1155011,1155013);

DELETE FROM basico.alteracao_matricula_serie WHERE id_alteracao_matricula_serie in (965123, 965124);

DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao in (3214597, 3214598, 3214599, 3251156);

DELETE FROM matricula.renovacao_matricula_resultado WHERE id_renovacao_matricula_resultado=721030;

DELETE FROM matricula.renovacao_matricula WHERE id_renovacao_matricula=84132460;

DELETE FROM basico.matricula_estudante_serie WHERE id_matricula_discente_serie=1625103;

rollback ;

commit;

--backup
INSERT INTO basico.matricula_estudante_serie (id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie, bloquear_renovacao) VALUES(1625103, 1018188, 4, NULL, NULL, NULL, false, 7774145, '2025-10-23 12:59:43.888', NULL, 52236748, 2026, 518766200, NULL, 1, 'N', NULL, NULL, NULL, 83934510, NULL, NULL, 8159643, '2026-04-07 14:36:39.000', false, NULL, NULL, NULL, NULL, 1, false);

INSERT INTO matricula.renovacao_matricula (id_renovacao_matricula, id_discente, id_nova_serie, id_registro_entrada, id_situacao_ano_anterior, data_cadastro, observacoes, id_escola, id_serie, id_calendario_matricula, numero_renovacao, id_vaga_serie, id_matricula_anterior, data_cancelamento, id_registro_cancelamento, nee, compussoria, periodo, tipo_renovacao) VALUES(84132460, 1018188, 1625103, 7774145, 1, '2025-10-23 12:59:43.843', '', 52232869, 1005219, 83879888, '2026039869', 83934510, 1576832, '2025-11-17 12:41:06.000', 7834035, false, NULL, NULL, 1);

INSERT INTO matricula.renovacao_matricula_resultado (id_renovacao_matricula_resultado, numero_processamento, id_calendario_matricula, data_procesamento, id_renovacao_matricula, id_situacao_matricula_serie, id_vaga_serie_solicitada, id_vaga_serie_concedida, metodo_selecao_vaga, id_matricula_discente_serie_gerado, id_listagem_processamento_renovacao_matricula) VALUES(721030, 1, 83879888, '2025-10-23 12:59:43.743', 84132460, 1, 83934510, 83934510, 'PÓS PROCESSAMENTO', 1625103, 83891522);

INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(3214597, 83934510, 'S', NULL, NULL, 84132460, 7774145, 2, '2025-10-23', NULL, NULL);
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(3214598, 83934510, 'C', NULL, NULL, 84132460, 7774145, 2, '2025-10-23', NULL, NULL);
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(3214599, 83934510, 'E', NULL, NULL, 84132460, 7774145, 2, '2025-10-23', NULL, NULL);
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(3251156, 83934510, 'A', NULL, NULL, 84132460, 7834035, 2, '2025-11-17', NULL, NULL);

INSERT INTO basico.alteracao_matricula_serie (id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo) VALUES(965123, 145746, 1625103, 1, '2026-04-07 14:35:43.831', 4009, 73789, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.alteracao_matricula_serie (id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo) VALUES(965124, 145746, 1625103, 4, '2026-04-07 14:36:39.886', 4008, 73790, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO matricula.emissao_documento_matricula (id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao) VALUES(1155011, 1, 1625103, 7774145, '2025-10-23');
INSERT INTO matricula.emissao_documento_matricula (id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao) VALUES(1155013, 4, 1625103, 7774145, '2025-10-23');





