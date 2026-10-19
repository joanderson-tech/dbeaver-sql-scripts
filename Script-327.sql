begin;
rollback;

--Updated Rows	1016
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

--Updated Rows	96
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


----
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
	VALUES(nextval('hibernate_sequence'),704977,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),704978,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),704979,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),704995,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),704996,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),704997,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705006,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705013,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705014,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705015,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705024,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705031,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705032,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705033,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705082,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705084,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705167,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705168,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705169,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705176,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705177,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705178,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705303,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705304,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705305,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705312,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705313,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705314,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705321,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705322,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705323,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705432,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705433,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705434,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705441,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705442,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705443,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705450,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705451,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705452,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705459,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705460,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705461,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705591,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705592,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),705593,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706499,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706532,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706533,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706534,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706541,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706542,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706543,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706856,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706863,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706864,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706865,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706872,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706873,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706874,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),706883,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707203,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707204,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707205,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707817,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707818,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707819,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707828,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707829,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707830,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707831,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707832,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707834,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707835,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707836,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707845,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707846,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707847,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707848,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707849,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707890,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707891,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707892,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707901,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707902,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707903,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707904,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707905,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707944,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707945,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707946,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707955,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707956,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707957,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707958,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
 INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),707959,'2024-11-30','2024-12-02',1,3, 'Sábado Letivo'); 
