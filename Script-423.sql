select
	p.codigo,
	p.nome,
	p.descricao,
	p.valor,
	p.id_sistema,
	p.tempo_maximo,
	p.bloquear_alteracao,
	s.descricao as nome_sistema,
	p.id_subsistema,
	ss.nome as nome_subsistema,
	p.tipo,
	p.padrao,
	p.valor_minimo,
	p.valor_maximo
from
	comum.parametro p
left outer join comum.sistema s on
	(p.id_sistema = s.id)
left outer join comum.subsistema ss on
	(p.id_subsistema = ss.id)
	 where p.nome not ilike '%SENHA%'  and upper(p.codigo) like upper(senha) ;