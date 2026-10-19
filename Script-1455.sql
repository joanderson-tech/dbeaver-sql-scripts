SELECT DISTINCT consulta.cpf, consulta.nome, consulta.nome_mae, consulta.data_nascimento
FROM( SELECT ei.cpf AS cpf, trim(ei.nome) AS nome, trim(ei.nome_mae) AS nome_mae, ei.data_nascimento AS data_nascimento
FROM matricula.estudante_inscrito ei
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = ei.id_calendario_matricula
WHERE cm.vigente
AND ei.id_status NOT IN ( 5, 11, 13 )
UNION SELECT p.cpf_cnpj AS cpf, trim(p.nome) AS nome, trim(p.nome_mae) AS nome_mae, p.data_nascimento AS data_nascimento
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN matricula.calendario_matricula cm ON
cm.ano = mes.ano_calendario
WHERE cm.vigente
AND mes.id_situacao_matricula_serie NOT IN ( 10, 11, 5, 4, 6, 9 )
UNION SELECT p.cpf_cnpj AS cpf, trim(p.nome) AS nome, trim(p.nome_mae) AS nome_mae, p.data_nascimento AS data_nascimento
FROM comum.pessoa p
JOIN discente d ON
p.id_pessoa = d.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN matricula.solicitacao_transferencia sol ON
sol.id_matricula_discente_serie_gerado = mes.id_matricula_discente_serie
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = sol.id_calendario_matricula
WHERE cm.vigente
AND sol.id_status NOT IN ( 6, 7, 3 ) ) AS consulta;