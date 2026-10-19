 select
	mes.ano_calendario,
	e.nome as escola,
	s.descricao as serie,
	count(distinct mes.*) as qtd
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join escola.escola e on
	e.id_escola = eees.id_escola
left join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie_multisseriado
join basico.serie s on
	s.id_serie = coalesce(ts.id_serie,
	eees.id_serie)
where
	mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
	and mes.ano_calendario = 2024
group by
	mes.ano_calendario,
	e.nome,
	s.descricao
order by
	mes.ano_calendario,
	e.nome,
	s.descricao; 