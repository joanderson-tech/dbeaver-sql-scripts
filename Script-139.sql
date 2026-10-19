begin;
rollback;

--Updated Rows	2898
with dias_agg (dia) as (values
	('2024-05-25'),
	('2024-06-08'),
	('2024-06-15'),
	('2024-07-13'),
	('2024-08-10'),
	('2024-08-24'),
	('2024-09-14'),
	('2024-10-19'),
	('2024-11-09')),
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

ALTER TABLE basico.serie
ADD COLUMN permite_participar_sol_cadastro_reserva bool NOT NULL DEFAULT FALSE;


--Backup
 WITH dias_agg (dia) AS (
VALUES
	('2024-05-25'),
	('2024-06-08'),
	('2024-06-15'),
	('2024-07-13'),
	('2024-08-10'),
	('2024-08-24'),
	('2024-09-14'),
	('2024-10-19'),
	('2024-11-09')),
registros as (
select id
from ava.aula_extra ae
where ae.criado_em::date = now()::date
and ae.data_aula in (select dia::date from dias_agg)
)
delete from ava.aula_extra 
where id in (select id from registros);