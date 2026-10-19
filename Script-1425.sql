Maria José da Silva Santos
--Nome mae e cpf igual 752129 
CPF: 031.757.484-14  
DATA de nascimento: 27 / 09 / 1956  
Nome da mãe: Josefa Maria da Conceição

SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '%Maria Jose da Silva Santos%'

SELECT p.id_pessoa, p.nome , p.cpf_cnpj, p.data_nascimento , p.nome_mae
FROM comum.pessoa p
WHERE p.id_pessoa IN (752123, 752129, 754237, 748534);

SELECT *
FROM discente d
WHERE d.id_pessoa IN (752123, 752129, 754237, 748534);

SELECT *
FROM discente d
WHERE d.matricula = '202430020180'