SELECT *
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 682741
AND fa."data" = '2025-07-26';


SELECT 'UPDATE ensino.frequencia_aluno SET ativo = FALSE WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script, 
			 'UPDATE ensino.frequencia_aluno SET ativo = true WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup, 
			  COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 682741
AND fa."data" = '2025-07-26'
AND ativo;

DELETE FROM ava.aula_extra WHERE id=52794948;

UPDATE ensino.frequencia_aluno SET ativo = FALSE WHERE id_frequencia IN (138696999, 138697000, 138697001, 138697002, 138697003, 138697004, 138697005, 138697006, 138697007, 138697008, 138697009, 138697010, 138697011, 138697012, 138697013, 138697014, 138697015, 138697016, 138697017, 138697018, 138697019, 138697020, 138697021, 138697022, 138697023);


INSERT INTO ava.aula_extra (id, id_turma, observacoes, data_aula, criado_em, criado_por, numero_aulas, tipo, aula_reposta, descricao, id_servidor, id_registro_cadastro, id_registro_atualizacao, dia_equivalente, de_interrupcao) VALUES(52794948, 682741, 'Reposição - 14/07', '2025-07-26', '2025-12-16 08:04:21.063', NULL, 1, 1, '2025-07-14', NULL, 153, 5717161, NULL, NULL, FALSE);


id_turma = 682741 AND data_aula = '2025-07-26';
52794948