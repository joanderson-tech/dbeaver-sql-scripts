select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAIM4A' and ano = 2025 and id_disciplina = 220 and id_situacao_turma = 1;


select
	to_char(f.data, 'YYYY-MM-DD') as data_aula
from
	ensino.frequencia_aluno f
join ensino.turma t on
	t.id_turma = f.id_turma
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join basico.matricula_estudante_serie mes on
	mes.id_turma_serie = ts.id_turma_serie
	and mes.id_estudante = f.id_discente
	and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 6 )
where
	f.ativo = true
	and f.id_turma = 721932
group by
	data_aula
order by
	data_aula;

select * from ensino.frequencia_aluno fa where fa.id_turma = 721932 and ativo;


select fa.id_frequencia 
from ensino.frequencia_aluno fa
join ensino.turma t on t.id_turma = fa.id_turma 
where not fa.ativo
    and fa.id_turma in (721932)
    and not exists (select 1 from ensino.frequencia_aluno fa2 where fa2.data = fa.data and fa2.id_discente = fa.id_discente and fa2.id_turma = fa.id_turma and fa2.ativo);

