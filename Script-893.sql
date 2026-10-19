select * from ensino.alteracao_matricula am where am.id_matricula_disciplina in (17163196,17169067,17023689);

begin;

rollback;

DELETE FROM ensino.matricula_componente WHERE id_matricula_componente=17169067;

INSERT INTO ensino.matricula_componente (id_situacao_matricula, id_discente, media_final, numero_faltas, id_matricula_componente, id_turma, id_recuperacao, apto, id_registro_cadastro, data_cadastro, ano, periodo, id_componente_curricular, id_restricoes, recuperacao, observacao, id_usuario_consolidacao, data_consolidacao, rematricula, media_anual, frequencia, id_matricula_componente_importada, prova_especial, id_historico_implantado, media_anual_modulo, motivo_exclusao, data_atualizacao, justificativa_aproveitamento, id_registro_atualizacao, data_reabertura_ficha, data_alteracao_aproveitamento, id_tipo_matricula_componente, escola_aproveitamento, id_aproveitamento, media_exame_nacional, ausente_recuperacao, nao_optou, conselho_classe, id_matricula_estudante_serie, carga_horaria_implantada, parecer_descritivo_implantado, conceito_implantado, avaliacao_por_conceito) VALUES(5, 980723, 0.00, 28, 17169067, 683926, NULL, NULL, NULL, '2023-01-19 15:09:36.356', 2022, NULL, 220, NULL, NULL, NULL, 104977, '2023-01-19 15:10:28.578', NULL, NULL, 85.9, NULL, 0.0, NULL, NULL, NULL, '2023-01-19 15:10:27.040', NULL, 5747778, NULL, NULL, 1, NULL, NULL, NULL, false, false, false, NULL, NULL, NULL, NULL, false);

commit;