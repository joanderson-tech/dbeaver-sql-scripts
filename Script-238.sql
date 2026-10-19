BEGIN;
commit;
rollback;



SELECT 'UPDATE ensino.frequencia_aluno SET id_discente = 1018453 WHERE id_frequencia = ' || fa.id_frequencia || ';' scripr,
	   'UPDATE ensino.frequencia_aluno SET id_discente =' || fa.id_discente  || ' WHERE id_frequencia = ' || fa.id_frequencia || ';' backup
FROM ensino.frequencia_aluno fa 
WHERE fa.id_discente IN (977465 , 979707);