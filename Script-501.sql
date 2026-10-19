
begin;
with dias_agg (dia) as (values
	('2025-05-10'),
	('2025-06-14'),
	('2025-09-13'),
	('2025-10-11') ),
turmas_agg as (
	select distinct	 
		coalesce(t.id_turma_agrupadora, t.id_turma) as id_turma,
		d.dia
	from dias_agg d, ensino.turma t
	where t.id_situacao_turma not in (4,9) 
	and t.ano = 2025
	and coalesce(t.id_turma_agrupadora, t.id_turma) not in (
		select 
			ae.id_turma 
		from ava.aula_extra ae
		where ae.id_turma = coalesce(t.id_turma_agrupadora, t.id_turma) 
		and ae.data_aula = d.dia::date
	)
)
insert into ava.aula_extra (id, id_turma, data_aula, criado_em, numero_aulas, tipo, descricao) (
	select
		nextval('hibernate_sequence') as id,
		t.id_turma,
		t.dia::date,
		now()::timestamp as criado_em,
		1 as numero_aulas,
		3 as tipo,
		'Sábado Letivo' as descricao
	from turmas_agg t);

WITH datas (dia, descricao) AS (VALUES
  	('2025-05-10', 'Sábado Letivo'),
	('2025-06-14', 'Sábado Letivo'),
	('2025-09-13', 'Sábado Letivo'),
	('2025-10-11', 'Sábado Letivo') )
SELECT distinct 'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'|| t.id_turma ||','''|| d.dia || ''','''||current_date||''',1,3, '''||d.descricao||''');'
	FROM ensino.turma t
	join basico.turma_serie ts on t.id_turma_serie  = ts.id_turma_serie 
	join basico.curriculo_basico cb  on cb.id_curriculo_basico  = ts.id_curriculo_medio 
	join ensino.docente_turma dt on dt.id_turma  = t.id_turma 
	join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico  = ts.id_curriculo_medio 
	and cbc.permite_alocacao_adjunto and cbc.id_componente_curricular = t.id_disciplina, datas d
	WHERE dt.ativo and not dt.finalizada 
	and (now() between dt.data_inicio and dt.data_fim ) and t.id_turma_agrupadora IS NOT NULL
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date);

--Backup
 WITH dias_agg (dia) AS (
VALUES
	('2025-05-10'),
	('2025-06-14'),
	('2025-09-13'),
	('2025-10-11') ),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);


commit;

 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687513,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687513,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687513,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687513,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687520,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687520,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687520,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687520,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687757,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687757,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687757,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687764,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687764,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687764,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687771,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687771,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687771,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687792,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687792,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687792,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687792,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687799,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687799,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687799,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687799,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687806,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687806,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687806,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687806,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687813,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687813,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687813,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687813,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687838,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687838,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687838,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687838,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687883,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687883,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687883,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687883,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687890,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687890,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687890,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687890,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687897,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687897,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687897,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687897,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687904,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687904,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687904,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),687904,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688240,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688240,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688240,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688240,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688247,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688247,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688247,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688247,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688254,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688254,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688254,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688254,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688261,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688261,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688261,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688261,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688278,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688278,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688278,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688278,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688279,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688279,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688279,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688279,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688280,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688280,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688280,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688280,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688281,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688281,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688281,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688281,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688282,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688282,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688282,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688282,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688283,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688283,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688283,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688283,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688284,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688284,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688284,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688284,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688294,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688294,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688294,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688294,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688295,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688295,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688295,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688295,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688296,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688296,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688296,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688296,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688297,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688297,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688297,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688297,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688298,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688298,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688298,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688298,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688299,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688299,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688299,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688299,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688300,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688300,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688300,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688300,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688310,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688310,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688310,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688310,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688311,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688311,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688311,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688311,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688312,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688312,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688312,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688312,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688313,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688313,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688313,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688313,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688314,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688314,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688314,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688314,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688315,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688315,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688315,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688315,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688316,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688316,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688316,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688316,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688342,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688342,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688342,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688342,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688343,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688343,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688343,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688343,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688344,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688344,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688344,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688344,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688345,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688345,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688345,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688345,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688346,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688346,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688346,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688346,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688347,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688347,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688347,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688347,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688348,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688348,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688348,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688348,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688374,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688374,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688374,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688374,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688375,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688375,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688375,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688375,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688376,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688376,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688376,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688376,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688377,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688377,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688377,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688377,'2025-10-11','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688378,'2025-05-10','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688378,'2025-06-14','2025-05-13',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),688378,'2025-09-13','2025-05-13',1,3, 'Sábado Letivo'); 


