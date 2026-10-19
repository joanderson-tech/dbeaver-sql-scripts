select
	m
from
	MatriculaEstudanteSerie m
inner join fetch m.turmaSerie
inner join fetch m.serie
inner join fetch m.serie.escola e
where
	m.discenteMedio.id = :idEstudante
	and m.ano = :ano
	and m.situacaoMatriculaSerie.id in ( 2, 3, 1, 7, 8, 10,-1 )
order by
	m.dataCadastro desc ;
	
select
	mes.data_consolidacao, * 
from
	basico.matricula_estudante_serie mes
join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
join basico.serie s on
	s.id_serie = ts.id_serie
join escola.escola e on
	e.id_escola = ts.id_escola
where
	mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
	and mes.id_estudante = 1358315
	and mes.ano_calendario = 2024;


select * from discente d  where matricula = '202352777123';

