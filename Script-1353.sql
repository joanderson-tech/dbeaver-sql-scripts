SELECT *
FROM matricula.vaga_serie
WHERE id_vaga_serie IN (54730893, 54730902, 54730926, 54730892, 54730935, 54730887, 54730924, 54730904, 54730906, 54730940, 54730944, 54730925, 54730899, 54730888, 54730941, 54730943, 54730946, 54730917, 54730900, 54730890, 54730908, 54730923, 54730915, 54730889, 54730938, 54730901, 54730891, 54730903);

SELECT *-- string_agg(id_operacao_vaga_serie ::varchar , ', ') 
FROM matricula.operacao_vaga_serie ovs WHERE ovs.id_vaga_serie IN (54730893, 54730902, 54730926, 54730892, 54730935, 54730887, 54730924, 54730904, 54730906, 54730940, 54730944, 54730925, 54730899, 54730888, 54730941, 54730943, 54730946, 54730917, 54730900, 54730890, 54730908, 54730923, 54730915, 54730889, 54730938, 54730901, 54730891, 54730903);


DELETE FROM matricula.operacao_vaga_serie
WHERE id_operacao_vaga_serie IN (54731710, 54731812, 54731813, 54731816, 54731817, 54731819, 54731820, 54731822, 54731823, 54731876, 54731914, 54734081, 54734087, 54734088, 54734091, 54734092, 54734094, 54734095, 54734096, 54734097, 54734099, 54734115, 54734117, 54734119, 54734120, 54734122, 54734123, 54734124, 54734125, 54734138, 54734140, 54734142, 54734143, 54734145, 54734146, 54734147, 54734148, 54734389, 54734390, 54734392, 54734394, 54734395, 54734397, 54734398, 54734399, 54734400);







INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731710, 54730935, NULL, NULL, 41, 41, 41, 41, 41, 6286230, '2025-10-17 10:45:05.485', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731812, 54730892, NULL, 'Atualização.', 55, 55, 57, 55, 55, 6286230, '2025-10-17 10:49:41.387', 'ALTERADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731813, 54730887, NULL, NULL, 48, 48, 48, 48, 48, 6286230, '2025-10-17 10:49:44.651', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731816, 54730888, NULL, NULL, 46, 46, 46, 46, 46, 6286230, '2025-10-17 10:49:44.665', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731817, 54730890, NULL, NULL, 64, 64, 64, 64, 64, 6286230, '2025-10-17 10:49:44.669', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731819, 54730889, NULL, NULL, 64, 64, 64, 64, 64, 6286230, '2025-10-17 10:49:44.677', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731820, 54730891, NULL, NULL, 48, 48, 48, 48, 48, 6286230, '2025-10-17 10:49:44.681', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731822, 54730892, NULL, NULL, 55, 55, 57, 55, 55, 6286230, '2025-10-17 10:49:44.689', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731823, 54730893, NULL, NULL, 55, 55, 55, 55, 55, 6286230, '2025-10-17 10:49:44.693', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731876, 54730893, NULL, 'Atualização ', 55, 55, 56, 55, 55, 6286230, '2025-10-17 10:56:58.286', 'ALTERADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54731914, 54730887, NULL, 'Atualização.', 48, 48, 50, 48, 48, 6286238, '2025-10-17 11:03:10.051', 'ALTERADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734081, 54730923, NULL, 'Novos alunos.', 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:06:37.463', 'ALTERADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734087, 54730924, NULL, 'Novos alunos.', 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:07:38.652', 'ALTERADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734088, 54730906, NULL, NULL, 34, 34, 34, 34, 34, 6287345, '2025-10-21 09:07:41.815', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734091, 54730915, NULL, NULL, 71, 71, 71, 71, 71, 6287345, '2025-10-21 09:07:41.873', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734092, 54730917, NULL, NULL, 71, 71, 71, 71, 71, 6287345, '2025-10-21 09:07:41.892', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734094, 54730926, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:07:41.917', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734095, 54730908, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:07:41.922', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734096, 54730925, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:07:41.927', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734097, 54730923, NULL, NULL, 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:07:41.933', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734099, 54730924, NULL, NULL, 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:07:41.942', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734115, 54730906, NULL, NULL, 34, 34, 34, 34, 34, 6287345, '2025-10-21 09:08:11.854', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734117, 54730917, NULL, NULL, 71, 71, 71, 71, 71, 6287345, '2025-10-21 09:08:11.864', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734119, 54730915, NULL, NULL, 71, 71, 71, 71, 71, 6287345, '2025-10-21 09:08:11.873', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734120, 54730925, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:08:11.877', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734122, 54730908, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:08:11.886', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734123, 54730926, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:08:11.891', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734124, 54730924, NULL, NULL, 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:08:11.896', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734125, 54730923, NULL, NULL, 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:08:11.901', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734138, 54730906, NULL, NULL, 34, 34, 34, 34, 34, 6287345, '2025-10-21 09:08:11.988', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734140, 54730917, NULL, NULL, 71, 71, 71, 71, 71, 6287345, '2025-10-21 09:08:12.028', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734142, 54730915, NULL, NULL, 71, 71, 71, 71, 71, 6287345, '2025-10-21 09:08:12.060', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734143, 54730925, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:08:12.072', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734145, 54730908, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:08:12.097', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734146, 54730926, NULL, NULL, 77, 77, 77, 77, 77, 6287345, '2025-10-21 09:08:12.110', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734147, 54730924, NULL, NULL, 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:08:12.122', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734148, 54730923, NULL, NULL, 60, 60, 62, 60, 60, 6287345, '2025-10-21 09:08:12.128', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734389, 54730917, NULL, 'Atualização.', 71, 71, 72, 71, 71, 6287477, '2025-10-21 10:50:09.359', 'ALTERADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734390, 54730906, NULL, NULL, 34, 34, 34, 34, 34, 6287477, '2025-10-21 10:50:11.862', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734392, 54730917, NULL, NULL, 71, 71, 72, 71, 71, 6287477, '2025-10-21 10:50:11.899', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734394, 54730915, NULL, NULL, 71, 71, 71, 71, 71, 6287477, '2025-10-21 10:50:11.933', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734395, 54730925, NULL, NULL, 77, 77, 77, 77, 77, 6287477, '2025-10-21 10:50:11.953', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734397, 54730908, NULL, NULL, 77, 77, 77, 77, 77, 6287477, '2025-10-21 10:50:11.964', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734398, 54730926, NULL, NULL, 77, 77, 77, 77, 77, 6287477, '2025-10-21 10:50:11.969', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734399, 54730923, NULL, NULL, 60, 61, 62, 61, 61, 6287477, '2025-10-21 10:50:11.975', 'VALIDADA', 105737, 2, true);
INSERT INTO matricula.operacao_vaga_serie
(id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee)
VALUES(54734400, 54730924, NULL, NULL, 60, 61, 62, 61, 61, 6287477, '2025-10-21 10:50:11.980', 'VALIDADA', 105737, 2, true);