SELECT *
FROM basico.unificacao_estudante ue
WHERE ue.id_pessoa_manter IN (751983, 51916261, 754364);

SELECT *
FROM comum.pessoa p
WHERE p.id_pessoa IN (751983, 51916261, 754364);
--754364 51916261 cpf 15034811405


SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '%MARIA LAURA PEREIRA DA SILVA%';

SELECT *
FROM comum.pessoa p
WHERE p.cpf_cnpj = '11484318455';

SELECT *
FROM discente d
WHERE d.id_pessoa IN (751983, 51916261, 754364);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (1020227);


