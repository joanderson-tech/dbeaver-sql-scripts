begin;
rollback;
--------------------Updated Rows	95520 95.696
WITH datas (dia, descricao) AS (VALUES
	('2024-03-02','Sábado letivo'),
	('2024-03-09','Sábado letivo'),
	('2024-03-16','Sábado letivo'),
	('2024-03-23','Sábado letivo'),
	('2024-03-30','Sábado letivo'),
	('2024-04-06','Sábado letivo'),
	('2024-04-13','Sábado letivo'),
	('2024-04-20','Sábado letivo'),
	('2024-04-27','Sábado letivo'),
	('2024-05-04','Sábado letivo'),
	('2024-05-11','Sábado letivo'),
	('2024-05-18','Sábado letivo'),
	('2024-05-25','Sábado letivo'),
	('2024-06-01','Sábado letivo'),
	('2024-06-08','Sábado letivo'),
	('2024-06-15','Sábado letivo'),
	('2024-06-22','Sábado letivo'),
	('2024-06-29','Sábado letivo'),
	('2024-07-06','Sábado letivo'),
	('2024-07-13','Sábado letivo'),
	('2024-07-20','Sábado letivo'),
	('2024-07-27','Sábado letivo'),
	('2024-08-03','Sábado letivo'),
	('2024-08-10','Sábado letivo'),
	('2024-08-17','Sábado letivo'),
	('2024-08-24','Sábado letivo'),
	('2024-08-31','Sábado letivo'),
	('2024-09-07','Sábado letivo'),
	('2024-09-14','Sábado letivo'),
	('2024-09-21','Sábado letivo'),
	('2024-09-28','Sábado letivo'),
	('2024-10-05','Sábado letivo'),
	('2024-10-12','Sábado letivo'),
	('2024-10-19','Sábado letivo'),
	('2024-10-26','Sábado letivo'),
	('2024-11-02','Sábado letivo'),
	('2024-11-09','Sábado letivo'),
	('2024-11-16','Sábado letivo'),
	('2024-11-23','Sábado letivo'),
	('2024-11-30','Sábado letivo'),
	('2024-12-07','Sábado letivo'),
	('2024-12-14','Sábado letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date);