

begin;
commit;
Rollback

WITH dias_agg (dia) AS (
VALUES
	('2023-04-15'),
	('2023-04-29'),
	('2023-05-13'),
	('2023-05-20'),
	('2023-06-03'),
	('2023-06-10'),
	('2023-07-08'),
	('2023-07-22'),
	('2023-08-05'),
	('2023-08-19'),
	('2023-09-16'),
	('2023-09-23'),
	('2023-10-14')
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
	AND t.ano = 2023
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
	

WITH dias_agg (dia) AS (
VALUES
	('2023-04-15'),
	('2023-04-29'),
	('2023-05-13'),
	('2023-05-20'),
	('2023-06-03'),
	('2023-06-10'),
	('2023-07-08'),
	('2023-07-22'),
	('2023-08-05'),
	('2023-08-19'),
	('2023-09-16'),
	('2023-09-23'),
	('2023-10-14')
), 
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);





