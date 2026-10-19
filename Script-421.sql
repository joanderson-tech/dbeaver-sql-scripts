select
	a.ensino,
	a.dired,
	count(a.dired) as numero_escolas,
	a.codigo
from
	(
	select
		es.denominacao as ensino,
		u.nome as dired,
		e.nome as escolas,
		u.codigo_unidade as codigo
	from
		escola.escola_etapa_ensino_serie vs
	join basico.serie s
			using (id_serie)
	join escola.escola e
			using (id_escola)
	join comum.unidade uEscola on
		(e.id_unidade_escola = uEscola.id_unidade
			and uEscola.ativo)
	join basico.etapa_ensino es on
		s.id_etapa_ensino = es.id_etapa_ensino
	join comum.unidade u on
		e.id_unidade_escola = u.id_unidade
	join comum.municipio m on
		e.id_municipio = m.id_municipio
	where
		m.id_municipio = 2402501
		and u.ativo = true
	group by
		es.denominacao,
		u.nome,
		e.nome,
		u.codigo_unidade
	order by
		es.denominacao,
		u.codigo_unidade ) a
group by
	a.ensino,
	a.dired,
	a.codigo
order by
	ensino,
	codigo;
	


select
	*
	from
		escola.escola_etapa_ensino_serie vs
		join escola.escola e on e.id_escola = vs.id_escola
		join basico.serie s on s.id_serie = vs.id_serie 
		join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino 
		where e.nome = 'EM ANTONIO DE OLIVEIRA'
		and ee.id_etapa_ensino = 4;
		
	
	SELECT x.* FROM basico.etapa_ensino x;
	



select
		es.id_etapa_ensino, es.denominacao, *
	from
		escola.escola_etapa_ensino_serie vs
	join basico.serie s
			using (id_serie)
	join escola.escola e
			using (id_escola)
	join comum.unidade uEscola on
		(e.id_unidade_escola = uEscola.id_unidade
			and uEscola.ativo)
	join basico.etapa_ensino es on
		s.id_etapa_ensino = es.id_etapa_ensino
	join comum.unidade u on
		e.id_unidade_escola = u.id_unidade
	join comum.municipio m on
		e.id_municipio = m.id_municipio
	where
		m.id_municipio = 2402501
		and u.ativo = true
		and e.id_escola = 2437;
	group by
		es.denominacao,
		u.nome,
		e.nome,
		u.codigo_unidade
	order by
		es.denominacao,
		u.codigo_unidade;