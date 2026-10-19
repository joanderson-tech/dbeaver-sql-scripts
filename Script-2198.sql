SELECT *
FROM ambiente.ambiente_unidade_escolar aue ;

INSERT INTO basico.turma_serie (id_ambiente_unidade_escolar, ano, atividade_complementar, ativo, capacidade_aluno, capacidade_sala_aula, codigo_rh, id_curriculo_medio, data_atualizacao, data_cadastro, data_fim, data_inicio, descricao_horario, id_escola, id_proxima_turma, identificador, justificativa_indeferimento, justificativa_qtd_alunos, justificativa_regra_nao, id_modulo_inicial, nome, nome_auxiliar, numero_estudantes, periodo, permite_disciplina_contraturno, progressao_parcial, id_registro_atualizacao, id_registro_entrada, regra_nao, id_serie, tipo_diario, tipo_importacao, id_tipo_turma_serie, id_turma_serie_agrupadora, id_turno, id_unidade, versao_grade_horarios, id_turma_serie)
VALUES (NULL, 2026, 'FALSE', 'TRUE', 35, 35, NULL, 52535536, NULL, '2026-04-15 16:07:59.343-03', NULL, NULL, NULL, 52020536, NULL, NULL, NULL, NULL, '', NULL, 'EIUINTEIUUA', NULL, NULL, 1, NULL, 'FALSE', NULL, 78562, 'FALSE', 52077907, 11, NULL, 3, NULL, 1, NULL, 0, 52545341) was aborted: ERROR: basico.trigger_turma_serie: A Turma Serie possui um tipo diÃ¡rio diferente DO tipo diario DO currÃiculo


INSERT INTO basico.turma_serie 
(id_ambiente_unidade_escolar, ano, atividade_complementar, ativo, capacidade_aluno, capacidade_sala_aula, codigo_rh, id_curriculo_medio, data_atualizacao, data_cadastro, data_fim, data_inicio, descricao_horario, id_escola, id_proxima_turma, identificador, justificativa_indeferimento, justificativa_qtd_alunos, justificativa_regra_nao, id_modulo_inicial, nome, nome_auxiliar, numero_estudantes, periodo, permite_disciplina_contraturno, progressao_parcial, id_registro_atualizacao, id_registro_entrada, regra_nao, id_serie, tipo_diario, tipo_importacao, id_tipo_turma_serie, id_turma_serie_agrupadora, id_turno, id_unidade, versao_grade_horarios, id_turma_serie)
VALUES 
(NULL, 2026, 'FALSE', 'TRUE', 35, 35, NULL, 52535536, NULL, '2026-04-15 16:07:59.343-03', NULL, NULL, NULL, 52020536, NULL, NULL, NULL, NULL, '', NULL, 'EIUINTEIUUA', NULL, NULL, 1, NULL, 'FALSE', NULL, 78562, 'FALSE', 52077907, 11, NULL, 3, NULL, 1, NULL, 0, 52545341) 


-- Auto-generated SQL script #202604161122
UPDATE basico.curriculo_basico
	SET tipo_diario=11
	WHERE id_curriculo_basico=52535536;


-- Auto-generated SQL script #202604161122
UPDATE basico.curriculo_basico 	SET tipo_diario=24	WHERE id_curriculo_basico=52535536;

SELECT *
FROM basico.serie
WHERE id_serie = 52077907;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 52545341;

SELECT *
FROM basico.turma_serie ts;
WHERE ts.id_turma_serie = 52545341;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 52535536;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo = 'UNI4 INT';

INSERT INTO ensino.turma (agrupadora, ano, capacidade_aluno, id_categoria_componente, categoria_esportiva, codigo, codigo_rh, data_alteracao, data_cadastro, data_consolidacao, data_fim, data_inicio, descricao_horario, id_disciplina, execucao, extra, grupo, LOCAL, id_modulo, motivo_exclusao, nome_professor, numero_estudantes, observacao, ordem, periodo, permite_multiplos_professores, processada, processada_rematricula, execucao_parcial_qtd_unidades, id_registro_atualizacao, id_registro_cadastro, id_situacao_turma, tipo, total_matriculados, id_turma_agrupadora, id_turma_serie, id_usuario_consolidacao, id_turma)
VALUES ('TRUE', 2026, 35, NULL, NULL, 'EIUINTEIUUA', NULL, NULL, '2026-04-15 17:02:30.047-03'::timestamp, NULL, NULL, NULL, NULL, 220, NULL, 'FALSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'FALSE', 'FALSE', 'FALSE', NULL, NULL, 78563, 1, 1, NULL, NULL, 52545355, NULL, 690607) was aborted: ERROR: INSERT
OR UPDATE ON
TABLE "turma" violates FOREIGN KEY CONSTRAINT "turma_serie_fk"
  Detalhe: KEY (id_turma_serie)=(52545355) IS NOT present IN TABLE "turma_serie". CALL getNextException TO see other errors IN the batch.
  
  
  
  INSERT INTO basico.turma_serie (id_ambiente_unidade_escolar, ano, atividade_complementar, ativo, capacidade_aluno, capacidade_sala_aula, codigo_rh, id_curriculo_medio, data_atualizacao, data_cadastro, data_fim, data_inicio, descricao_horario, id_escola, id_proxima_turma, identificador, justificativa_indeferimento, justificativa_qtd_alunos, justificativa_regra_nao, id_modulo_inicial, nome, nome_auxiliar, numero_estudantes, periodo, permite_disciplina_contraturno, progressao_parcial, id_registro_atualizacao, id_registro_entrada, regra_nao, id_serie, tipo_diario, tipo_importacao, id_tipo_turma_serie, id_turma_serie_agrupadora, id_turno, id_unidade, versao_grade_horarios, id_turma_serie)
VALUES (NULL, 2026, 'FALSE', 'TRUE', 35, 35, NULL, 52535536, NULL, '2026-04-16 11:13:15.893-03', NULL, NULL, NULL, 52020536, NULL, NULL, NULL, NULL, '', NULL, 'EIUINTEIUUA', NULL, NULL, 1, NULL, 'FALSE', NULL, 78566, 'FALSE', 52077907, 11, NULL, 3, NULL, 1, NULL, 0, 52545558) was aborted: ERROR: basico.trigger_turma_serie: A Turma Serie possui um tipo diÃ¡rio diferente DO tipo diario DO currÃiculo