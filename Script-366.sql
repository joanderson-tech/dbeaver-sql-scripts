 select
	mes.ano_calendario,
	coalesce(ss.descricao,
	s.descricao) as serie,
	count(distinct mes.*) as qtd
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join basico.serie s on
	s.id_serie = eees.id_serie
join  basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino
left join basico.serie_multisseriada sm on
	sm.id_serie = s.id_serie
	and sm.id_serie_associada = mes.id_serie_multisseriado
left join basico.serie ss on
	ss.id_serie = sm.id_serie_associada
where
	mes.id_situacao_matricula_serie not in ( 4, 6, 5, 9, 12 )
	and mes.ano_calendario = 2025
group by
	s.id_etapa_ensino,
	mes.ano_calendario,
	coalesce(ss.descricao,
	s.descricao)
order by
	s.id_etapa_ensino,
	mes.ano_calendario,
	coalesce(ss.descricao,
	s.descricao); 
 select
	mes.ano_calendario,
	coalesce(ss.descricao,
	s.descricao) as serie,
	count(distinct mes.*) as qtd
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join basico.serie s on
	s.id_serie = eees.id_serie
join  basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino
left join basico.serie_multisseriada sm on
	sm.id_serie = s.id_serie
	and sm.id_serie_associada = mes.id_serie_multisseriado
left join basico.serie ss on
	ss.id_serie = sm.id_serie_associada
where
	mes.id_situacao_matricula_serie not in ( 4, 6, 5, 9, 12 )
	and mes.ano_calendario = 2025
group by
	mes.ano_calendario,
	coalesce(ss.descricao,
	s.descricao)
order by
	mes.ano_calendario,
	coalesce(ss.descricao,
	s.descricao); 
	
select s.descricao, ee.denominacao from basico.serie s join  basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino order by s.id_etapa_ensino;