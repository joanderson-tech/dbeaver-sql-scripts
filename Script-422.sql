 WITH dias_agg (dia) AS (
VALUES
	('2025-05-10'),
	('2025-06-14')),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);

begin;
commit;
 

-- Updated Rows	2178 10/05/2025 e 14/06/2025
with dias_agg (dia) as (values
	('2025-05-10'),
	('2025-06-14')),
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

--solução para turmas com professor adjunto - Updated Rows24
WITH datas (dia, descricao) AS (VALUES
    ('2025-05-10', 'Sábado Letivo'),
    ('2025-06-14', 'Sábado Letivo'))
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


begin;
rollback;


 commit;
 


  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708223,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708223,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708224,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708224,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708225,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708225,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708232,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708232,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708233,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708233,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708234,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),708234,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709644,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709644,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709645,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709645,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709646,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709646,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709653,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709653,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709654,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709654,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709655,'2025-05-10','2025-03-25',1,3, 'Sábado Letivo');  
  INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval('hibernate_sequence'),709655,'2025-06-14','2025-03-25',1,3, 'Sábado Letivo');  