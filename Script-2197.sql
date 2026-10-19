SELECT *
FROM ambiente.ambiente_unidade_escolar aue ;

INSERT INTO basico.turma_serie (id_ambiente_unidade_escolar, ano, atividade_complementar, ativo, capacidade_aluno, capacidade_sala_aula, codigo_rh, id_curriculo_medio, data_atualizacao, data_cadastro, data_fim, data_inicio, descricao_horario, id_escola, id_proxima_turma, identificador, justificativa_indeferimento, justificativa_qtd_alunos, justificativa_regra_nao, id_modulo_inicial, nome, nome_auxiliar, numero_estudantes, periodo, permite_disciplina_contraturno, progressao_parcial, id_registro_atualizacao, id_registro_entrada, regra_nao, id_serie, tipo_diario, tipo_importacao, id_tipo_turma_serie, id_turma_serie_agrupadora, id_turno, id_unidade, versao_grade_horarios, id_turma_serie)
VALUES (NULL, 2026, 'FALSE', 'TRUE', 35, 35, NULL, 52535536, NULL, '2026-04-15 16:07:59.343-03', NULL, NULL, NULL, 52020536, NULL, NULL, NULL, NULL, '', NULL, 'EIUINTEIUUA', NULL, NULL, 1, NULL, 'FALSE', NULL, 78562, 'FALSE', 52077907, 11, NULL, 3, NULL, 1, NULL, 0, 52545341) was aborted: ERROR: basico.trigger_turma_serie: A Turma Serie possui um tipo diÃ¡rio diferente DO tipo diario DO currÃiculo


INSERT INTO basico.turma_serie 
(id_ambiente_unidade_escolar, ano, atividade_complementar, ativo, capacidade_aluno, capacidade_sala_aula, codigo_rh, id_curriculo_medio, data_atualizacao, data_cadastro, data_fim, data_inicio, descricao_horario, id_escola, id_proxima_turma, identificador, justificativa_indeferimento, justificativa_qtd_alunos, justificativa_regra_nao, id_modulo_inicial, nome, nome_auxiliar, numero_estudantes, periodo, permite_disciplina_contraturno, progressao_parcial, id_registro_atualizacao, id_registro_entrada, regra_nao, id_serie, tipo_diario, tipo_importacao, id_tipo_turma_serie, id_turma_serie_agrupadora, id_turno, id_unidade, versao_grade_horarios, id_turma_serie)
VALUES 
(NULL, 2026, 'FALSE', 'TRUE', 35, 35, NULL, 52535536, NULL, '2026-04-15 16:07:59.343-03', NULL, NULL, NULL, 52020536, NULL, NULL, NULL, NULL, '', NULL, 'EIUINTEIUUA', NULL, NULL, 1, NULL, 'FALSE', NULL, 78562, 'FALSE', 52077907, 11, NULL, 3, NULL, 1, NULL, 0, 52545341) 


SELECT * FROM basico.serie WHERE id_serie = 3;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = 52545341;

SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico = 52535536;


SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'UNI4 INT';