 select
	curriculob0_.id_curriculo_basico_componente_escola as id1_917_,
	curriculob0_.ativo as ativo917_,
	curriculob0_.ch_ano as ch3_917_,
	curriculob0_.ch_semana as ch4_917_,
	curriculob0_.id_componente_curricular as id7_917_,
	curriculob0_.id_curriculo_basico as id10_917_,
	curriculob0_.data_cadastro as data5_917_,
	curriculob0_.id_escola as id8_917_,
	curriculob0_.ordem as ordem917_,
	curriculob0_.id_registro_entrada as id9_917_
from
	basico.curriculo_basico_componente_escola curriculob0_
where
	1 = 1
	and curriculob0_.ativo = 'true'
	and curriculob0_.id_escola = '1009'
	and curriculob0_.id_curriculo_basico = '51978804'

 
insert into ensino.turma (agrupadora, ano, capacidade_aluno, id_categoria_componente, categoria_esportiva, codigo, codigo_rh, data_alteracao, data_cadastro, data_consolidacao, data_fim, data_inicio, descricao_horario, id_disciplina, execucao, extra, grupo, local, id_modulo, motivo_exclusao, nome_professor, numero_estudantes, observacao, ordem, periodo, processada, processada_rematricula, execucao_parcial_qtd_unidades, id_registro_atualizacao, id_registro_cadastro, id_situacao_turma, tipo, total_matriculados, id_turma_agrupadora, id_turma_serie, id_usuario_consolidacao, id_turma) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
insert into ensino.turma (agrupadora, ano, capacidade_aluno, id_categoria_componente, categoria_esportiva, codigo, codigo_rh, data_alteracao, data_cadastro, data_consolidacao, data_fim, data_inicio, descricao_horario, id_disciplina, execucao, extra, grupo, local, id_modulo, motivo_exclusao, nome_professor, numero_estudantes, observacao, ordem, periodo, processada, processada_rematricula, execucao_parcial_qtd_unidades, id_registro_atualizacao, id_registro_cadastro, id_situacao_turma, tipo, total_matriculados, id_turma_agrupadora, id_turma_serie, id_usuario_consolidacao, id_turma) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)

17:03:14,664 WARN  [JDBCExceptionReporter] SQL Error: 0, SQLState: 23505
17:03:14,665 ERROR [JDBCExceptionReporter] Batch entry 1 insert into ensino.turma (agrupadora, ano, capacidade_aluno, id_categoria_componente, categoria_esportiva, codigo, codigo_rh, data_alteracao, data_cadastro, data_consolidacao, data_fim, data_inicio, descricao_horario, id_disciplina, execucao, extra, grupo, local, id_modulo, motivo_exclusao, nome_professor, numero_estudantes, observacao, ordem, periodo, processada, processada_rematricula, execucao_parcial_qtd_unidades, id_registro_atualizacao, id_registro_cadastro, id_situacao_turma, tipo, total_matriculados, id_turma_agrupadora, id_turma_serie, id_usuario_consolidacao, id_turma) values ('FALSE', 2025, 40, 1, NULL, 'EIPREMEIP1K', NULL, NULL, '2025-05-13 17:02:35.419-03', NULL, NULL, NULL, NULL, 220, NULL, 'FALSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'FALSE', 'FALSE', NULL, NULL, NULL, 1, 1, NULL, 685459, 52046311, NULL, 685460) was aborted: ERROR: duplicate key value violates unique constraint "idx_turma_serie_situacao"
  Detalhe: Key (id_disciplina, id_turma_serie, id_situacao_turma)=(220, 52046311, 1) already exists.  Call getNextException to see other errors in the batch.
17:03:14,666 WARN  [JDBCExceptionReporter] SQL Error: 0, SQLState: 23505
17:03:14,667 ERROR [JDBCExceptionReporter] ERROR: duplicate key value violates unique constraint "idx_turma_serie_situacao"
  Detalhe: Key (id_disciplina, id_turma_serie, id_situacao_turma)=(220, 52046311, 1) already exists.
  
  insert into ensino.turma (agrupadora, ano, capacidade_aluno, id_categoria_componente, categoria_esportiva, codigo, codigo_rh, data_alteracao, data_cadastro, data_consolidacao, data_fim, data_inicio, descricao_horario, id_disciplina, execucao, extra, grupo, local, id_modulo, motivo_exclusao, nome_professor, numero_estudantes, observacao, ordem, periodo, processada, processada_rematricula, execucao_parcial_qtd_unidades, id_registro_atualizacao, id_registro_cadastro, id_situacao_turma, tipo, total_matriculados, id_turma_agrupadora, id_turma_serie, id_usuario_consolidacao, id_turma) values ('FALSE', 2025, 40, 1, NULL, 'EIPREMEIP1K', NULL, NULL, '2025-05-13 17:10:43.252-03', NULL, NULL, NULL, NULL, 220, NULL, 'FALSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'FALSE', 'FALSE', NULL, NULL, NULL, 1, 1, NULL, 685461, 52046312, NULL, 685462);
  
  was aborted: ERROR: duplicate key value violates unique constraint "idx_turma_serie_situacao"
  Detalhe: Key (id_disciplina, id_turma_serie, id_situacao_turma)=(220, 52046312, 1) already exists.  Call getNextException to see other errors in the batch.
17:11:37,303 WARN  [JDBCExceptionReporter] SQL Error: 0, SQLState: 23505
17:11:37,304 ERROR [JDBCExceptionReporter] ERROR: duplicate key value violates unique constraint "idx_turma_serie_situacao"
  Detalhe: Key (id_disciplina, id_turma_serie, id_situacao_turma)=(220, 52046312, 1) already exists.
  
 select * from ensino.turma t where t.id_disciplina = 220 ;
 SELECT t.* FROM ensino.turma AS t WHERE id_turma = 685428

select * from ensino.turma t; where t.id_turma_serie = 52046312;

SELECT ts.* FROM basico.turma_serie AS ts WHERE id_serie  = 51869714;
SELECT ts.* FROM basico.turma_serie AS ts WHERE id_turma_serie = 52046309
  
  begin;
  rollback;
  
  insert
	into
	ensino.turma (agrupadora,
	ano,
	capacidade_aluno,
	id_categoria_componente,
	categoria_esportiva,
	codigo,
	codigo_rh,
	data_alteracao,
	data_cadastro,
	data_consolidacao,
	data_fim,
	data_inicio,
	descricao_horario,
	id_disciplina,
	execucao,
	extra,
	grupo,
	local,
	id_modulo,
	motivo_exclusao,
	nome_professor,
	numero_estudantes,
	observacao,
	ordem,
	periodo,
	processada,
	processada_rematricula,
	execucao_parcial_qtd_unidades,
	id_registro_atualizacao,
	id_registro_cadastro,
	id_situacao_turma,
	tipo,
	total_matriculados,
	id_turma_agrupadora,
	id_turma_serie,
	id_usuario_consolidacao,
	id_turma)
values ('FALSE',
2025,
40,
1,
null,
'EIPREMEIP1K',
null,
null,
'2025-05-13 17:02:35.419-03',
null,
null,
null,
null,
220,
null,
'FALSE',
null,
null,
null,
null,
null,
null,
null,
1,
1,
'FALSE',
'FALSE',
null,
null,
null,
1,
1,
null,
685459,
52046311,
null,
685460);
  
  
  was aborted: ERROR: duplicate key value violates unique constraint "idx_turma_serie_situacao"