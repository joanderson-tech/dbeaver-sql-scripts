begin;
rollback;

select s.descricao , t2.id_turma, s.id_etapa_ensino from ensino.turma t2
join basico.turma_serie ts on ts.id_turma_serie = t2.id_turma_serie
join basico.serie s on s.id_serie = ts.id_serie 
WHERE
	t2.id_situacao_turma NOT IN (4, 9)
	and t2.ano = 2023
	and s.id_etapa_ensino = 4
;

SELECT
	dt.*
FROM
	ensino.turma t
	join basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie
	join basico.serie s on s.id_serie = ts.id_serie 
	join ensino.docente_turma dt on dt.id_turma = t.id_turma 
WHERE
	t.id_situacao_turma NOT IN (4, 9)
	AND t.ano = 2023
	and s.id_etapa_ensino = 4
and t.id_situacao_turma =1;



--solução
WITH dias_agg (dia) AS (
VALUES
	('2024-03-18'),
	('2024-05-27'),
	('2024-06-24'),
	('2024-07-08'),
	('2024-08-19'),
	('2024-11-18'),
	('2024-12-16')
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
	join basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie
	join basico.serie s on s.id_serie = ts.id_serie 
WHERE
	t.id_situacao_turma NOT IN (4, 9)
	AND t.ano = 2023
	and s.id_etapa_ensino = 4
	and t.id_situacao_turma =1
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
	('2024-03-18'),
	('2024-05-27'),
	('2024-06-24'),
	('2024-07-08'),
	('2024-08-19'),
	('2024-11-18'),
	('2024-12-16')
), 
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);




