SELECT p.nome, d.matricula FROM comum.pessoa p 
JOIN discente d ON d.id_pessoa = p.id_pessoa 
WHERE d.matricula = '202551883454';