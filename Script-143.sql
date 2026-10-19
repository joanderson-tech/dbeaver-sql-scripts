 select
	*
from
	basico.turma_serie ts
where
	ts.id_turma_serie  in (52471427) or ts.id_turma_serie_agrupadora = 52471427
order by
	ts.nome;

 select
	*
from
	basico.turma_serie ts
where
	ts.id_turma_serie_agrupadora  in (52471427)
	and ts.ativo = true
order by
	ts.nome;
	
--id_turma_serie
52471427

--id_serie
51900644

select * from basico.curriculo_basico_serie_multisseriada cbsm 
where cbsm.id_curriculo_basico =51870311;


select * from basico.matricula_estudante_serie mes 
where mes.id_turma_serie = 52471427;

select * from ensino.matricula_componente mc 
where mc.id_discente = 978788;


select * from basico.serie_multisseriada sm 
where sm.id_serie = 51900644;

select * from basico.calendario_escolar ce 


select * from basico.turma_serie ts 
where id_serie  = 51900644;

select * from basico.turma_serie ts 
where id_turma_serie_agrupadora  = 52518584;

select * from ensino.turma t 
where id_turma_serie = 52518586;


select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415;


select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415 and t.id_disciplina = 220

select * from ensino.turma t 
where id_turma_serie = 52518587;

-- 52518586  51869715

-- 52518585  51869714

select * from ensino.turma t 
where id_turma_serie in (52518586,52518585);

Foram recriadas a serie e assosiando os com a turma agrupadora 



begin;
commit;
rollback;


INSERT INTO basico.turma_serie
(id_turma_serie, ano, nome, id_serie, id_registro_entrada, data_cadastro, capacidade_aluno, ativo, id_turno, data_inicio, data_fim, id_curriculo_medio, id_escola, codigo_rh, tipo_importacao, codturma_censo2012, id_proxima_turma, nome_auxiliar, capacidade_sala_aula, id_modulo_inicial, numero_estudantes, regra_nao, progressao_parcial, justificativa_regra_nao, tipo_diario, periodo, identificador, id_unidade, atividade_complementar, descricao_horario, id_tipo_turma_serie, id_turma_serie_agrupadora, permite_disciplina_contraturno, justificativa_qtd_alunos, justificativa_indeferimento)
VALUES(nextval('hibernate_sequence'), 2024, 'EIMSVEIMPA-M0', 51869714, 5693785, '2024-01-22 09:50:49.249', 35, true, 4, null, NULL, 51873428, 51873415, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, false, false, NULL, 1, 1, NULL, NULL, false, NULL, 2, 52471427, NULL, NULL, NULL);

INSERT INTO basico.turma_serie
(id_turma_serie, ano, nome, id_serie, id_registro_entrada, data_cadastro, capacidade_aluno, ativo, id_turno, data_inicio, data_fim, id_curriculo_medio, id_escola, codigo_rh, tipo_importacao, codturma_censo2012, id_proxima_turma, nome_auxiliar, capacidade_sala_aula, id_modulo_inicial, numero_estudantes, regra_nao, progressao_parcial, justificativa_regra_nao, tipo_diario, periodo, identificador, id_unidade, atividade_complementar, descricao_horario, id_tipo_turma_serie, id_turma_serie_agrupadora, permite_disciplina_contraturno, justificativa_qtd_alunos, justificativa_indeferimento)
VALUES(nextval('hibernate_sequence'), 2024, 'EIMSVEIMPA-M1', 51869715, 5693785, '2024-01-22 09:50:49.249', 35, true, 4, null, NULL, 51873446, 51873415, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, false, false, NULL, 1, 1, NULL, NULL, false, NULL, 2, 52471427, NULL, NULL, NULL);


INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 220, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, true, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 513, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 509, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 510, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 512, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 514, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M1' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);


INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 220, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, NULL, true, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 513, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 509, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 510, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 512, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO ensino.turma
(ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente)
VALUES(2024, 1, 1, 35, NULL, NULL, NULL, NULL, 514, NULL, nextval ('ensino.turma_seq'), 'EIMSVEIMPA-M0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, NULL, 5693785, '2024-01-22 09:50:49.249', NULL, NULL, NULL, false, NULL, NULL, NULL, (select t.id_turma from ensino.turma t join basico.turma_serie ts on t.id_turma_serie = ts.id_turma_serie  where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415 and t.id_disciplina = 220), false, NULL, (select ts.id_turma_serie from basico.turma_serie ts where ts.ano = 2024 and ts.nome = 'EIMSVEIMPA-M0' and ts.id_escola = 51873415), NULL, false, false, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);


