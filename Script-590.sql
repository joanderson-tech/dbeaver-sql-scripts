select
	*
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
	and f.id_turma = 685674;
group by
	data_aula
order by
	data_aula;
