SELECT s.*
FROM comum.pessoa p
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
WHERE p.nome = 'JONILA PEREIRA DA SILVA'

SELECT *
FROM pessoas.vaga_administrativa va WHERE va.id_servidor = 1584;