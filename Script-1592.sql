SELECT id_pessoa, p.nome, p.cpf_cnpj, p.nome_mae, p.data_nascimento, p.nome_pai , m.nome AS nome_municipio
FROM comum.pessoa p
LEFT JOIN comum.municipio m ON
p.id_municipio_naturalidade = m.id_municipio;