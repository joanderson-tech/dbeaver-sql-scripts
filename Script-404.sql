
 select
	fa.id_turma,
	cast(fa."data" as text) as data_aula,
	least (coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end),
	0),
	coalesce(ae.numero_aulas,
	fa.horarios)) as faltas,
	coalesce(ae.numero_aulas,
	fa.horarios) as horarios
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
left join ava.aula_extra ae on
	ae.id_turma = t.id_turma
	and ae.data_aula = fa."data"
where
	fa.ativo
	and fa.id_discente = 1391684
	and t.id_turma_serie = 61549366
	and extract(month from fa.data) = 6
group by
	fa.id_turma,
	fa."data",
	fa.frequencia,
	fa.horarios,
	ae.numero_aulas
order by
	data_aula;


select
	  COUNT(DISTINCT fa."data") AS total_aula,
	   SUM(COALESCE(ae.numero_aulas, fa.horarios)) AS total_horarios
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
left join ava.aula_extra ae on
	ae.id_turma = t.id_turma
	and ae.data_aula = fa."data"
WHERE 
    fa.ativo
    AND fa.id_discente = 1384963
    AND t.id_turma_serie = 61549366
 AND EXTRACT(MONTH FROM fa.data) = 6;


select
	  SUM(COALESCE(dat.quantidade_horarios)) AS total_horarios
from ensino.data_aula_turma dat
join ensino.turma t on t.id_turma = dat.id_turma
left join ava.aula_extra ae on
	ae.id_turma = t.id_turma
	and ae.data_aula = dat.data_aula 
where dat.ativo  
and t.id_turma_serie = 61549366
	and extract(month FROM dat.data_aula) = 6;

select * 
from
	ensino.frequencia_aluno fa where id_discente =  1384963;

select * from ensino.data_aula_turma dat;
