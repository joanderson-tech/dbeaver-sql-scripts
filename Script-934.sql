select
*
from
	matricula.vaga_serie_ocupacao vagaserieo0_
where
	vagaserieo0_.id_vaga_serie = 82043269
	and vagaserieo0_.id_tipo_ocupacao = 5;

select * from matricula.vaga_serie_ocupacao where id_vaga_serie = 82043269

select * from comum.pessoa p where p.nome ilike '%ANTHONY BRAYAN NUNES CLEMENTINO%'

select * from comum.informacoes_medicas;

 
	
	select coalesce(vs.vagas_validadas, 0) - coalesce(vs.vagas_ocupadas, 0) as livresVeteranos,* from matricula.vaga_serie vs
	where vs.id_escola = 51872596 
	and vs.ano_letivo = 2025
	and vs.removida = false
	and vs.id_vaga_serie = 82043269;
	
select * from matricula.vaga_serie_ocupacao; vso	where vso.id_vaga_serie = 82043269;
select * from matricula.vaga_serie_movimentacao; sm where sm.id_vaga_serie = 82043269;
select * from matricula.vaga_serie; where ovs.id_vaga_serie = 82043269;

select p.nome, * from comum.usuario u join comum.pessoa p on p.id_pessoa = u.id_pessoa where u.id_usuario = 105461;
	
--------------------	
DELETE FROM matricula.operacao_vaga_serie WHERE id_operacao_vaga_serie in (82043270, 82043272,82044784,82045260,82045310)

DELETE FROM matricula.vaga_serie_movimentacao WHERE id_vaga_serie_movimentacao=2852042;
DELETE FROM matricula.vaga_serie_ocupacao WHERE id_vaga_serie_ocupacao=82223732 AND id_tipo_ocupacao=5 AND id_vaga_serie=82043269 AND denominacao IS NULL AND ocupadas=0 AND data_processamento IS NULL AND efetivadas=0 AND solicitadas=0 AND ocupadas_nee=0 AND solicitadas_nee=0 AND efetivadas_nee=0;
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie=82043269;
	
INSERT INTO matricula.operacao_vaga_serie (id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee) VALUES(82043270, 82043269, NULL, 'NECESSIDADE DIANTE DA DEMANDA REPRIMIDA REFERENTE A PROCURA DAS FAMÍLIAS.', 24, 0, NULL, 0, NULL, 7289293, '2025-07-15 07:09:45.565', 'NOVA', 105461, 1, true);
INSERT INTO matricula.operacao_vaga_serie (id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee) VALUES(82043272, 82043269, NULL, NULL, 24, 0, NULL, 0, NULL, 7289293, '2025-07-15 07:09:54.359', 'SUBMETIDA', 105461, 1, true);
INSERT INTO matricula.operacao_vaga_serie (id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee) VALUES(82044784, 82043269, NULL, NULL, 24, 0, NULL, 0, NULL, 7289820, '2025-07-15 08:51:46.825', 'SUBMETIDA', 105461, 1, true);
INSERT INTO matricula.operacao_vaga_serie (id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee) VALUES(82045260, 82043269, NULL, NULL, 24, 0, 0, 0, NULL, 7289572, '2025-07-15 09:08:39.381', 'ALTERADA', 104889, 0, true);
INSERT INTO matricula.operacao_vaga_serie (id_operacao_vaga_serie, id_vaga_serie, id_vaga_serie_remanejamento, justificativa, vagas_informadas, vagas_solicitadas, vagas_validadas, vagas_ocupadas, vagas_efetivadas, id_registro_cadastro, data_cadastro, tipo, id_usuario, numero_turmas, aceita_novas_matriculas_nee) VALUES(82045310, 82043269, NULL, NULL, 24, 0, 0, 0, NULL, 7289900, '2025-07-15 09:22:51.171', 'SUBMETIDA', 105461, 0, true);
	
INSERT INTO matricula.vaga_serie_movimentacao (id_vaga_serie_movimentacao, id_vaga_serie, tipo_movimento, id_solicitacao_transferencia, id_estudante_inscrito, id_renovacao_matricula, id_registro_entrada, id_tipo_ocupacao_vaga, data_movimentacao, id_registro_acesso_publico, id_movimentacao_estudante_escola) VALUES(2852042, 82043269, 'A', NULL, NULL, NULL, NULL, 5, '2025-08-04', NULL, NULL);
INSERT INTO matricula.vaga_serie_ocupacao (id_vaga_serie_ocupacao, id_tipo_ocupacao, id_vaga_serie, denominacao, ocupadas, data_processamento, efetivadas, solicitadas, ocupadas_nee, solicitadas_nee, efetivadas_nee) VALUES(82223732, 5, 82043269, NULL, 0, NULL, 0, 0, 0, 0, 0);
INSERT INTO matricula.vaga_serie (id_vaga_serie, id_serie, numero_vagas, ano_letivo, id_escola, data_cadastro, id_turno, vagas_validadas, vagas_ocupadas, data_validacao, id_registro_validacao, vagas_solicitadas, vagas_efetivadas, vagas_ocupadas_1opc, vagas_ocupadas_2opc, vagas_ocupadas_mtl, vagas_ocupadas_antes_processamento, vagas_ocupadas_antes_listagem_2, ocupadas_interesse_op1, vagas_ocupadas_1opc_l1, vagas_ocupadas_2opc_l1, id_calendario_matricula, periodo, numero_turmas, aceita_novas_matriculas_nee, removida, exibir_remanescentes_bloqueadas, vagas_remanescentes_bloqueadas, desricao_remanescente_bloqueada, vagas_reservadas_militares, vagas_ocupadas_mtl_op2, vagas_ocupadas_mtl_2opc, id_registro_entrada) VALUES(82043269, 51872869, 24, 2025, 51872596, NULL, 1, 0, 0, NULL, 7289572, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76393089, 2, 0, true, false, true, false, NULL, NULL, NULL, NULL, 7289293);	
	
	
	