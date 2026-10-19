-- Updated Rows	511
with dias_agg (dia) as (values
	('2024-10-26')),
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

--solução para turmas com professor adjunto - Updated Rows	52
WITH datas (dia, descricao) AS (VALUES
    ('2024-10-26', 'Sábado Letivo'))
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

commit;
rollback;
begin;


 WITH dias_agg (dia) AS (
VALUES
	('2024-10-26')),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);




  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692047,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692048,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692049,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692050,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692051,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692060,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692061,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692062,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692063,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692064,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692073,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692074,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692075,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692076,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692077,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692086,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692087,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692088,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692089,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692090,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692099,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692100,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692101,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692102,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692103,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692113,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692122,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692131,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692140,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692150,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692159,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692168,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692177,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692210,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692219,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692317,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692321,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692329,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692333,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692337,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692341,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692345,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692365,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692369,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692373,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692377,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692381,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692417,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),692421,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),693304,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),693713,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),693722,'2024-10-26','2024-10-16',1,3, 'Sábado Letivo');    

