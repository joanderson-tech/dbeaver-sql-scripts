
WITH dias_agg (dia) AS (
VALUES
	('2024-03-23'),
	('2024-04-20'),
	('2024-05-11'),
	('2024-06-08'),
	('2024-06-22'),
	('2024-07-06'),
	('2024-07-20'),
	('2024-08-10'),
	('2024-09-14'),
	('2024-10-19'),
	('2024-11-09'),
	('2024-12-14')),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);