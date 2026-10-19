SELECT mes.*
FROM discente d
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE p.nome ILIKE '%IANE GABRIELE CAMPOS DA SILVA%'
AND mes.ano_calendario in(2025, 2026);