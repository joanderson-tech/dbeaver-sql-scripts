SELECT * --id_unidade, nome
FROM comum.unidade
WHERE instituicao_ensino_superior = trueValue()
AND UPPER(nome) ILIKE UPPER('UNIVERSIDADE DE CUIABÁ%')
ORDER BY nome