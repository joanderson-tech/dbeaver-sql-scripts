select
	id_pessoa,
	p.nome,
	p.cpf_cnpj,
	p.nome_mae,
	p.data_nascimento,
	p.nome_pai ,
	m.nome as nome_municipio
from
	comum.pessoa p
left join comum.municipio m on
	p.id_municipio_naturalidade = m.id_municipio