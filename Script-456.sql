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
where
	1 = 1