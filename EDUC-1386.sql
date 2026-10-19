SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '%Laudecine Duarte%';

SELECT p.nome, * FROM rh.servidor s 
JOIN comum.pessoa p ON s.id_pessoa = p.id_pessoa 
WHERE s.id_servidor IN (136,280,374,382);

SELECT DISTINCT p.id_pessoa, d.id_discente, mes.id_matricula_discente_serie, p .nome, p.cpf_cnpj, d.matricula, p.data_cadastro, mes.ano_calendario, p.nome_mae, sms.descricao
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
JOIN basico.estudante e ON
e.id_estudante = d.id_discente
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
WHERE d.id_pessoa IN (748534, 752123, 752129, 754237)
ORDER BY mes.ano_calendario;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (975491, 978852, 978858, 980909);


SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_matricula_discente_serie  IN (1325938);

SELECT *
FROM basico.estudante e
WHERE e.id_estudante IN (975491, 978852, 978858, 980909);

SELECT p .nome, p.cpf_cnpj, d.matricula, p.data_cadastro, mes.ano_calendario, p.nome_mae, sms.descricao
FROM comum.pessoa p
JOIN discente d ON d.id_pessoa = p.id_pessoa
JOIN basico.estudante e ON e.id_estudante = d.id_discente
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente
--JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
--JOIN ensino.docente_turma dt ON dt.id_turma = mc.id_turma 
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
WHERE d.id_pessoa IN (748534, 752123, 752129, 754237)
ORDER BY mes.ano_calendario;

/*Dados da estudante: Maria José da Silva Santos / 
 CPF: 031.757.484-14 / 
 Data de nascimento: 27/09/1956 / 
 Nome da mãe: Josefa Maria da Conceição*/

/*
|id_pessoa|nome                      |cpf_cnpj     |data_nascimento|data_cadastro          |nome_mae                 |
|---------|--------------------------|-------------|---------------|-----------------------|-------------------------|
|748.534  |MARIA JOSÉ DA SILVA SANTOS|851.568.416  |1974-06-24     |2024-05-14 20:31:47.328|JOSÉ VALERIO DOS SANTOS  |
|752.123  |MARIA JOSE DA SILVA SANTOS|3.175.748.414|2017-11-13     |2024-07-10 10:36:37.102|JOSEFA CAETANO DA SILVA  |
|752.129  |MARIA JOSE DA SILVA SANTOS|3.175.748.414|2017-11-13     |2024-07-10 10:56:02.726|JOSEFA MARIA DA CONCEICAO|
|754.237  |MARIA JOSE DA SILVA SANTOS|             |1956-09-27     |2025-04-02 19:44:33.000|JOSEFA CAETANO DA SILVA  |

*/