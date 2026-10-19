   select
	SUM(CAST(fa.abonada AS INTEGER)) as abonada 
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
where fa.id_discente = 1019232
	and t.id_turma = 703499 
	and t.ano = 2023
AND (fa.ativo OR fa.abonada);
	

select
	SUM(cast(fa.abonada as INTEGER)) as abonada
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
where
	fa.id_discente = 975562
	and (fa.ativo
		or fa.abonada)
	and t.id_turma = 683957
and t.ano = 2022;


select * from ensino.frequencia_aluno fa
where fa.abonada = true
and fa.id_discente = 975562;

--ESCOLA MUNICIPAL MARIA JOSÉ VERÍSSIMO DE ANDRADE

select
	SUM(cast(fa.abonada as INTEGER)) as abonada
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
where
	fa.id_discente = 975562
	and (fa.ativo
		or fa.abonada)
	and t.ano = 2022
	and t.id_turma = 683960 ;