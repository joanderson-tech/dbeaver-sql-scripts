 select
	distinct e.nome as nome_escola,
	ts.nome as nome_turma,
	ts.id_turma_serie as id_turma_serie,
	s.descricao as nome_serie,
	d.matricula as matricula_estudante,
	p.nome as nome_estudante,
	mes.id_estudante as idEstudante,
	est.participa_bolsa_familia as participa_bolsa_familia, 
	mes.id_situacao_matricula_serie
from
	basico.matricula_estudante_serie mes
join basico.estudante est on est.id_estudante = mes.id_estudante
join escola.escola_etapa_ensino_serie eees on eees.id_escola_etapa_ensino_serie = mes.id_serie_escola and eees.ativo
join basico.turma_serie ts on ts.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
join escola.escola e on e.id_escola = coalesce(ts.id_escola, eees.id_escola)
join basico.serie s on s.id_serie = coalesce(ts.id_serie, eees.id_serie)
join basico.etapa_ensino es on
	es.id_etapa_ensino = s.id_etapa_ensino
join public.discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
left join ensino.matricula_componente mc on
	mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
where
	mes.ano_calendario = 2023
	and e.id_escola = 52232930
	and t.codigo ilike '%EJAAFN3A%'
	and ts.id_turma_serie is not null
order by
	e.nome,
	mes.id_situacao_matricula_serie,
	ts.nome,
	p.nome,
	s.descricao; 
	
select * from ensino.matricula_componente mc;