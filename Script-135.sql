begin;
commit;
rollback;
-- Updated Rows	95520
with dias_agg (dia) as (values
        ('2024-03-02'),
	('2024-03-09'),
	('2024-03-16'),
	('2024-03-23'),
	('2024-03-30'),
	('2024-04-06'),
	('2024-04-13'),
	('2024-04-20'),
	('2024-04-27'),
	('2024-05-04'),
	('2024-05-11'),
	('2024-05-18'),
	('2024-05-25'),
	('2024-06-01'),
	('2024-06-08'),
	('2024-06-15'),
	('2024-06-22'),
	('2024-06-29'),
	('2024-07-06'),
	('2024-07-13'),
	('2024-07-20'),
	('2024-07-27'),
	('2024-08-03'),
	('2024-08-10'),
	('2024-08-17'),
	('2024-08-24'),
	('2024-08-31'),
	('2024-09-07'),
	('2024-09-14'),
	('2024-09-21'),
	('2024-09-28'),
	('2024-10-05'),
	('2024-10-12'),
	('2024-10-19'),
	('2024-10-26'),
	('2024-11-02'),
	('2024-11-09'),
	('2024-11-16'),
	('2024-11-23'),
	('2024-11-30'),
	('2024-12-07'),
	('2024-12-14')),
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
	from turmas_agg t
);

select * from ensino.turma t2;
--Soluçao
--Updated Rows	95718
WITH dias_agg (dia) AS (
VALUES
	('2024-03-02'),
	('2024-03-09'),
	('2024-03-16'),
	('2024-03-23'),
	('2024-03-30'),
	('2024-04-06'),
	('2024-04-13'),
	('2024-04-20'),
	('2024-04-27'),
	('2024-05-04'),
	('2024-05-11'),
	('2024-05-18'),
	('2024-05-25'),
	('2024-06-01'),
	('2024-06-08'),
	('2024-06-15'),
	('2024-06-22'),
	('2024-06-29'),
	('2024-07-06'),
	('2024-07-13'),
	('2024-07-20'),
	('2024-07-27'),
	('2024-08-03'),
	('2024-08-10'),
	('2024-08-17'),
	('2024-08-24'),
	('2024-08-31'),
	('2024-09-07'),
	('2024-09-14'),
	('2024-09-21'),
	('2024-09-28'),
	('2024-10-05'),
	('2024-10-12'),
	('2024-10-19'),
	('2024-10-26'),
	('2024-11-02'),
	('2024-11-09'),
	('2024-11-16'),
	('2024-11-23'),
	('2024-11-30'),
	('2024-12-07'),
	('2024-12-14')
), 
turmas_agg AS (
SELECT
	DISTINCT	 
		CASE 
			WHEN t.id_turma_agrupadora IS NOT NULL THEN 
				t.id_turma_agrupadora
		ELSE 
				t.id_turma
	END AS id_turma,
		d.dia
FROM
	dias_agg d,
	ensino.turma t
WHERE
	t.id_situacao_turma NOT IN (4, 9)
	AND t.ano = 2024
)	
INSERT
	INTO
	ava.aula_extra (id,
	id_turma,
	data_aula,
	criado_em,
	numero_aulas,
	tipo,
	descricao) (
	SELECT
		nextval('hibernate_sequence') AS id,
		t.id_turma,
		t.dia::date,
		now()::timestamp AS criado_em,
		1 AS numero_aulas,
		3 AS tipo,
		'Sábado Letivo' AS descricao
	FROM
		turmas_agg t
);



 --Backup
 WITH dias_agg (dia) AS (
VALUES
	('2024-03-02'),
	('2024-03-09'),
	('2024-03-16'),
	('2024-03-23'),
	('2024-03-30'),
	('2024-04-06'),
	('2024-04-13'),
	('2024-04-20'),
	('2024-04-27'),
	('2024-05-04'),
	('2024-05-11'),
	('2024-05-18'),
	('2024-05-25'),
	('2024-06-01'),
	('2024-06-08'),
	('2024-06-15'),
	('2024-06-22'),
	('2024-06-29'),
	('2024-07-06'),
	('2024-07-13'),
	('2024-07-20'),
	('2024-07-27'),
	('2024-08-03'),
	('2024-08-10'),
	('2024-08-17'),
	('2024-08-24'),
	('2024-08-31'),
	('2024-09-07'),
	('2024-09-14'),
	('2024-09-21'),
	('2024-09-28'),
	('2024-10-05'),
	('2024-10-12'),
	('2024-10-19'),
	('2024-10-26'),
	('2024-11-02'),
	('2024-11-09'),
	('2024-11-16'),
	('2024-11-23'),
	('2024-11-30'),
	('2024-12-07'),
	('2024-12-14')
), 
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);
 