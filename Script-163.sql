begin;
rollback;

with dias_agg (dia) as (values
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
        ('2024-12-14')
),
turmas_agg AS (
    SELECT DISTINCT	 
        COALESCE(t.id_turma_agrupadora, t.id_turma) AS id_turma,
        d.dia
    FROM dias_agg d, ensino.turma t
    WHERE t.id_situacao_turma NOT IN (4,9) 
        AND t.ano = 2024
        AND COALESCE(t.id_turma_agrupadora, t.id_turma) NOT IN (
            SELECT ae.id_turma 
            FROM ava.aula_extra ae
            WHERE ae.id_turma = COALESCE(t.id_turma_agrupadora, t.id_turma) 
                AND ae.data_aula = d.dia::date
        )
)
INSERT INTO ava.aula_extra (id, id_turma, data_aula, criado_em, numero_aulas, tipo, descricao) (
    SELECT
        nextval('hibernate_sequence') AS id,
        t.id_turma,
        t.dia::date,
        NOW()::timestamp AS criado_em,
        1 AS numero_aulas,
        3 AS tipo,
        'Sábado Letivo' AS descricao
    FROM turmas_agg t
)
RETURNING id_turma;

Para verificar se esses IDs estão cadastrados em determinadas datas, você pode usar uma consulta SQL que filtre esses IDs nas datas desejadas. Aqui está um exemplo de como você pode fazer isso:


SELECT 
    *
FROM 
    ava.aula_extra
WHERE 
    id_turma IN (
        684503, 684503, 684503, 684503, 684503, 684503, 684503, 684503, 684503, 
        684512, 684512, 684512, 684512, 684512, 684512, 684512, 684512, 684512, 684512, 
        684521, 684521, 684521, 684521, 684521, 684521, 684521, 684521, 684521, 684521, 684521, 
        684573, 684573, 684573, 684573, 684573, 684573, 684573, 684573, 684573, 684573, 684573, 684573, 
        684579, 684579, 684579, 684579, 684579, 684579, 684579, 684579, 684579, 684579, 684579, 684579, 
        684585, 684585, 684585, 684585, 684585, 684585, 684585, 684585, 684585, 684585, 684585, 684585, 
        684591, 684591, 684591, 684591, 684591, 684591, 684591, 684591, 684591, 684591, 684591, 684591, 
        684597, 684597, 684597, 684597, 684597, 684597, 684597, 684597, 684597, 684597, 684597, 684597, 
        684603, 684603, 684603, 684603, 684603, 684603, 684603, 684603, 684603, 684603, 684603, 684603, 
        684609, 684609, 684609, 684609, 684609, 684609, 684609, 684609, 684609, 684609, 684609, 684609, 
        684615, 684615, 684615, 684615, 684615, 684615, 684615, 684615, 684615, 
        684621, 684621, 684621, 684621, 684621, 684621, 684621, 684621, 684621, 
        684654, 684654, 684654, 684654, 684654, 684654, 684654, 684654, 684654, 
        684655, 684655, 684655, 684655, 684655, 684655, 684655, 684655, 684655, 
        684656, 684656, 684656, 684656, 684656, 684656, 684656, 684656, 684656, 
        684657, 684657, 684657, 684657, 684657, 684657, 684657, 684657, 684657, 
        684658, 684658, 684658, 684658, 684658, 684658, 684658, 684658, 684658, 
        684659, 684659, 684659, 684659, 684659, 684659, 684659, 684659, 684659, 
        684660, 684660, 684660
    )
    AND data_aula IN (
        '2024-03-23', '2024-04-20', '2024-05-11', '2024-06-08', 
        '2024-06-22', '2024-07-06', '2024-07-20', '2024-08-10', 
        '2024-09-14', '2024-10-19', '2024-11-09', '2024-12-14'
    );


Esta consulta irá retornar os IDs das turmas e as datas das aulas extra onde esses IDs de turma estão presentes nas datas especificadas. Certifique-se de substituir as datas e os IDs das turmas pelos valores reais que você está interessado em verificar.
