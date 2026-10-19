SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE 'Ramilly Nadylla Alves da Silva';

SELECT *
FROM discente d
WHERE d.id_pessoa = 748978;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 975780
AND mes.ano_calendario = 2026;

SELECT *
FROM matricula.solicitacao_transferencia st
WHERE st.id_matricula_discente_serie IN (1329029, 1329036, 1329035, 1328213);