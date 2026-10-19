 select
	distinct ae.data_aula,
	ts.id_turma_serie,
	max(ae.id) as id,
	ae.data_aula,
	ae.observacoes,
	ae.numero_aulas,
	ae.tipo,
	ae.descricao,
	ae.dia_equivalente
from
	ava.aula_extra ae
join ensino.turma t on
	t.id_turma = ae.id_turma
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
where
	ts.id_turma_serie = 52027655
group by
	ts.id_turma_serie,
	ae.data_aula,
	ae.observacoes,
	ae.numero_aulas,
	ae.tipo,
	ae.descricao,
	ae.dia_equivalente
order by
	data_aula asc;
	
---Updated Rows	1247
WITH datas (dia, descricao) AS (VALUES
	 ('2024-03-23', 'Sábado Letivo'),
    ('2024-04-20', 'Sábado Letivo'),
    ('2024-05-11', 'Sábado Letivo'),
    ('2024-06-08', 'Sábado Letivo'),
    ('2024-06-20', 'Sábado Letivo'),
    ('2024-07-06', 'Sábado Letivo'),
    ('2024-07-20', 'Sábado Letivo'),
    ('2024-08-10', 'Sábado Letivo'),
    ('2024-09-14', 'Sábado Letivo'),
    ('2024-10-19', 'Sábado Letivo'),
    ('2024-11-09', 'Sábado Letivo'),
    ('2024-12-14', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date);

--solução para turmas com professor adjunto - Updated Rows	335
WITH datas (dia, descricao) AS (VALUES
	 ('2024-03-23', 'Sábado Letivo'),
    ('2024-04-20', 'Sábado Letivo'),
    ('2024-05-11', 'Sábado Letivo'),
    ('2024-06-08', 'Sábado Letivo'),
    ('2024-06-22', 'Sábado Letivo'),
    ('2024-07-06', 'Sábado Letivo'),
    ('2024-07-20', 'Sábado Letivo'),
    ('2024-08-10', 'Sábado Letivo'),
    ('2024-09-14', 'Sábado Letivo'),
    ('2024-10-19', 'Sábado Letivo'),
    ('2024-11-09', 'Sábado Letivo'),
    ('2024-12-14', 'Sábado Letivo'))
SELECT distinct 'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'|| t.id_turma ||','''|| d.dia || ''','''||current_date||''',1,3, '''||d.descricao||''');'
	FROM ensino.turma t
	join basico.turma_serie ts on t.id_turma_serie  = ts.id_turma_serie 
	join basico.curriculo_basico cb  on cb.id_curriculo_basico  = ts.id_curriculo_medio 
	join ensino.docente_turma dt on dt.id_turma  = t.id_turma 
	join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico  = ts.id_curriculo_medio 
	and cbc.permite_alocacao_adjunto and cbc.id_componente_curricular = t.id_disciplina, datas d
	WHERE dt.ativo and not dt.finalizada and (now() between dt.data_inicio and dt.data_fim ) and t.id_turma_agrupadora IS NOT NULL
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date);

Backup:

--Backup

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





