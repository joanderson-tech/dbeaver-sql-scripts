-- Updated Rows	1019

begin;

rollback;
with dias_agg (dia) as (values
	('2024-11-30')),
turmas_agg as (
	select distinct	 
		coalesce(t.id_turma_agrupadora, t.id_turma) as id_turma,
		d.dia
	from dias_agg d, ensino.turma t
	where t.id_situacao_turma not in (4,9) 
	and t.ano = 2024
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

--solução para turmas com professor adjunto - Updated Rows	261
WITH datas (dia, descricao) AS (VALUES
    ('2024-11-30', 'Sábado Letivo'))
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
	('2024-11-30')),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);



 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699127,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699136,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699145,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699154,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699163,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699172,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699181,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699190,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699199,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699208,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699217,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699226,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699265,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699299,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699306,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699313,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699320,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699327,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699334,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699341,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699348,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699354,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699361,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo');
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699368,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699389,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699396,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699403,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699410,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699417,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699424,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699431,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699438,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699445,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699452,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699459,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699507,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699521,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699528,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699535,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699548,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699557,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699566,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699575,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699584,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699593,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699602,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699611,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699620,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699623,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699630,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699636,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699643,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699650,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699663,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699672,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699684,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699691,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699815,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699822,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699829,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699836,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699843,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699849,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699856,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699863,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699894,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699903,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699912,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),699977,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700033,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700088,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700137,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700165,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700221,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700230,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700393,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700402,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700492,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700519,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700522,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700529,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700611,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700614,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700627,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700630,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700637,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700644,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700657,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700660,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700667,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700680,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700683,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700690,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),700703,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701096,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701118,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701125,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701132,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701139,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701146,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701153,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701160,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701167,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701174,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701181,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701194,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701203,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701212,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701221,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701230,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701285,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701294,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701303,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701312,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701321,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701330,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701339,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701348,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701393,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701402,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701429,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701519,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701528,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701537,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701546,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701555,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701564,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701573,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701582,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701591,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701600,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701609,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701618,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701627,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701636,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701645,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701654,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701663,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701675,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701681,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701687,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701694,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701701,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701708,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701715,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701731,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701738,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701751,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701760,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701769,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701772,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701778,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701791,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701800,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701823,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701832,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701841,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701844,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701860,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701876,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701883,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701890,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701897,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),701991,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702018,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702063,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702072,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702100,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702109,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702118,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702157,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702164,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702180,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702187,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702236,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702245,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702254,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702272,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702300,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702318,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702354,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702363,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702366,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702422,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702431,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702440,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702449,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702458,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702467,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702476,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702487,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702502,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702509,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702516,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702523,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702530,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702537,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702544,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702574,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702580,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702587,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702674,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702683,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702692,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702742,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702755,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702761,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702768,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702775,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702797,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702804,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702862,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),702865,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703009,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703038,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703075,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703173,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703182,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703197,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703208,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703219,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703230,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703232,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703233,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703503,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703505,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703507,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703508,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703509,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703575,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703581,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703582,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703602,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703607,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703608,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703642,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703644,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703645,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703729,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703730,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),703731,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704016,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704018,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704019,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704227,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704351,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704645,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704894,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704896,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704908,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704910,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704912,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704913,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704914,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704936,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704938,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704940,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704941,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704942,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704950,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao)
	VALUES(nextval('hibernate_sequence'),704952,'2024-11-30','2024-11-29',1,3, 'Sábado Letivo'); 
