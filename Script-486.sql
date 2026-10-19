select * from matricula.calendario_matricula cm where cm.id_calendario_matricula = 52250936;
select * from matricula.solicitacao_transferencia st where st.id_solicitacao_transferencia = 52263014;
select * from matricula.vaga_serie_movimentacao vsm where vsm.id_solicitacao_transferencia   = 52263014;

select * from matricula.vaga_serie vs where vs.id_vaga_serie = 52250769;
52250769

select * from matricula.solicitacao_transferencia_opcao_escola stoe where stoe.id_solicitacao  = 52263014;

52250769

Erro SQL [23503]: ERROR: update or delete on table "solicitacao_transferencia_opcao_escola" violates foreign key constraint "solicitacao_transferencia_processamento_id_opcao_escola_fkey" on table "solicitacao_transferencia_processamento"
  Detalhe: Key (id_solicitacao_transferencia_opcao_escola)=(52263015) is still referenced from table "solicitacao_transferencia_processamento".


52248041
52263014

INSERT INTO matricula.solicitacao_transferencia (id_solicitacao_transferencia, id_tipo, id_status, observacoes_analise, id_registro_analise, data_analise, ano_escolar, numero, id_calendario_matricula, id_motivo_transferencia_int_proprio, id_matricula_discente_serie, visto_escola, data_solicitacao, id_matricula_discente_serie_gerado, id_registro_cadastro) VALUES(52263014, 1, 4, NULL, NULL, '2025-04-22', 2025, '2025001165', 52250936, NULL, 1325044, true, '2025-04-22', 1325139, 5691750);

INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(2135410, 52250946, 'S', 52263014, NULL, NULL, NULL, 4, '2025-04-22', NULL, NULL);
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(2135411, 52250946, 'C', 52263014, NULL, NULL, NULL, 4, '2025-04-22', NULL, NULL);
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(2135412, 52250946, 'E', 52263014, NULL, NULL, 5691755, 4, '2025-04-22', NULL, NULL);
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(2135555, 52250946, 'A', 52263014, NULL, NULL, NULL, 4, '2025-05-06', NULL, NULL);

INSERT INTO matricula.solicitacao_transferencia_opcao_escola (id_solicitacao_transferencia_opcao_escola, id_solicitacao, id_escola, ordem, parente, cpf_parente, id_turno, id_serie, periodo, periodo_teste) VALUES(52263015, 52263014, 2443, 1, false, NULL, 4, 5162362, 1, NULL);



begin;
rollback;

DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2135410;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2135411;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2135412;
DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2135555;

DELETE FROM matricula.solicitacao_transferencia_opcao_escola WHERE id_solicitacao_transferencia_opcao_escola=52263015;

DELETE FROM matricula.solicitacao_transferencia WHERE id_solicitacao_transferencia=52263014;





begin;

commit;

-- Auto-generated SQL script #202505091728
UPDATE matricula.vaga_serie
	SET id_calendario_matricula=52250936
	WHERE id_vaga_serie=52250769;



UPDATE matricula.vaga_serie
	SET id_calendario_matricula=52248041
	WHERE id_vaga_serie=52250769;

