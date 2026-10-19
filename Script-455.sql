 select
	*
from
	(
	select
		distinct p.cpf_cnpj,
		p.nome,
		p.id_pessoa,
		s.id_servidor,
		s.siape,
		s.digito_siape,
		s.tipo_vinculo
	from
		rh.servidor s
	join comum.pessoa p
			using (id_pessoa)
	join comum.unidade u on
		u.id_unidade = s.id_unidade
	join escola.escola e on
		e.id_municipio = e.id_municipio
	where
		1 = 1
		and p.cpf_cnpj = 83530010472 
union
	select
		distinct p.cpf_cnpj,
		p.nome,
		p.id_pessoa,
		s.id_servidor,
		s.siape,
		s.digito_siape,
		s.tipo_vinculo
	from
		rh.servidor s
	join comum.pessoa p
			using (id_pessoa)
	join comum.unidade u on
		u.id_unidade = s.id_unidade
	join escola.escola e on
		e.id_municipio = e.id_municipio
	where
		1 = 1
		and s.siape ilike '83530010472'
		and e.id_escola = 51870576 ) as foo
order by
	nome
limit 50