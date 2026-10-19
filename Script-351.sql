select  id_discente, sum(frequencia) from ensino.frequencia_aluno  where ativo = trueValue() and (abonada is null or abonada = false) and id_turma = 683493 group by id_discente

select
	*
from
	ensino.data_aula_turma dat
join ensino.turma t on
	t.id_turma = dat.id_turma
where
	dat.ativo
	and dat.frequencia_lancada
	and dat.id_turma = 683493
	and dat.data_aula in ( '2024-03-08', '2024-03-15', '2024-03-22', '2024-04-05', '2024-04-12', '2024-04-13', '2024-04-19', '2024-04-26', '2024-05-03', '2024-05-04', '2024-05-10', '2024-05-17', '2024-05-24', '2024-05-31', '2024-06-07', '2024-06-14', '2024-06-15', '2024-07-05', '2024-07-06', '2024-07-12', '2024-07-19', '2024-07-26', '2024-07-27', '2024-08-02', '2024-08-09', '2024-08-16', '2024-08-23', '2024-08-24', '2024-08-30', '2024-09-06', '2024-09-13', '2024-09-20', '2024-09-27', '2024-09-28', '2024-10-04', '2024-10-11', '2024-10-18', '2024-10-19', '2024-10-25', '2024-11-01', '2024-11-08', '2024-11-09', '2024-11-22', '2024-11-29', '2024-12-06', '2024-12-13', '2024-12-14', '2024-12-20' ); 
	

SELECT * FROM ensino.data_aula_turma dat JOIN ensino.turma t ON t.id_turma = dat.id_turma WHERE dat.ativo AND dat.frequencia_lancada AND dat.id_turma = 683493 AND dat.data_aula IN  ( '2024-03-08','2024-03-15','2024-03-22','2024-04-05','2024-04-12','2024-04-13','2024-04-19','2024-04-26','2024-05-03','2024-05-04','2024-05-10','2024-05-17','2024-05-24','2024-05-31','2024-06-07','2024-06-14','2024-06-15','2024-07-05','2024-07-06','2024-07-12','2024-07-19','2024-07-26','2024-07-27','2024-08-02','2024-08-09','2024-08-16','2024-08-23','2024-08-24','2024-08-30','2024-09-06','2024-09-13','2024-09-20','2024-09-27','2024-09-28','2024-10-04','2024-10-11','2024-10-18','2024-10-19','2024-10-25','2024-11-01','2024-11-08','2024-11-09','2024-11-22','2024-11-29','2024-12-06','2024-12-13','2024-12-14','2024-12-20' ); 

select * from ensino.data_aula_turma dat
where dat.id_turma = 683493;


select * from ensino.turma t
where t.id_turma =683493;

select * from ensino.horario_turma ht where ht.id_turma = 683493;


 select * from ensino.frequencia_aluno fa where fa.id_turma = 683493 and fa.horarios = 1 and  EXTRACT(DOW FROM fa."data" );

SELECT string_agg(fa.id_frequencia::varchar , ',' )
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 683493
  AND fa.horarios = 1
  AND EXTRACT(DOW FROM fa.data) = 5; -- 5 representa sexta-feira

  
   -- Updated Rows	3948
with dias_agg (dia) as (values
	('2024-03-23'),
	('2024-04-06'),
	('2024-04-20'),
	('2024-06-08'),
	('2024-08-17'),
	('2024-09-28'),
	('2024-10-19')),
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