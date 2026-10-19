select
	distinct s.id_servidor,
	s.siape,
	s.digito_siape,
	s.data_transferencia,
	s.tipo_vinculo,
	p.id_pessoa,
	p.cpf_cnpj,
	p.nome,
	p.email,
	p.sexo,
	u.id_unidade,
	u.codigo_unidade,
	u.nome as unidade,
	c.id_categoria,
	c.descricao as categoria,
	ss.id_situacao,
	ss.descricao as situacao,
	e.id_escolaridade,
	e.descricao as escolaridade,
	f.id_formacao,
	f.denominacao as formacao ,
	cargo.denominacao as denominacaoCargo
from
	rh.servidor s
left join comum.pessoa p
		using (id_pessoa)
left join comum.unidade u on
	u.id_unidade = s.id_unidade
left join comum.responsavel_unidade ru on
	ru.id_servidor = s.id_servidor
left join rh.categoria c
		using (id_categoria)
left join rh.cargo cargo on
	cargo.id_cargo = s.id_cargo
left join rh.situacao_servidor ss
		using (id_situacao)
left join rh.escolaridade e on
	e.id_escolaridade = p.id_escolaridade
left join rh.formacao f
		using (id_formacao)
where
	1 = 1
	and s.tipo_vinculo = '10'
order by
	p.nome asc;
