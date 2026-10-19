SELECT p.id_pessoa, p.nome, p.cpf_cnpj , p.data_nascimento, p.data_cadastro , p.ultima_atualizacao
FROM comum.pessoa p
WHERE p.nome_ascii ILIKE '%MARIA JOSE DA SILVA SANTOS%';

SELECT p.nome_mae, *
FROM comum.pessoa p
WHERE p.nome_ascii ILIKE '%MARIA JOSE DA SILVA SANTOS%'
AND p.nome_mae ILIKE '%JOSEFA MARIA DA CONCEICAO%'

SELECT  p.nome, p.cpf_cnpj ,d.matricula, p.data_nascimento,p.nome_mae, p.data_cadastro
FROM discente d
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE  p.nome_ascii ILIKE '%MARIA JOSE DA SILVA SANTOS%';

SELECT *
FROM discente d
WHERE d.id_pessoa IN (748534);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (978858);

SELECT *
FROM basico.unificacao_estudante ue ;
--id_pessoa sem cpf 2025 754237

--idPessoa 748534,752123,752129,754237
-- estudante 975491,978852,978858,980909


SELECT * FROM ensino.turma t WHERE t.id_turma_serie IN (51882218,52811752);