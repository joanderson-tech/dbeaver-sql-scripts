SELECT 
    e.nome AS "NOME ESCOLA",
    CASE
    WHEN TRIM(p.nome_responsavel_matricula) <> '' THEN p.nome_responsavel_matricula
    ELSE p.nome_mae 
END AS "RESPONSAVEL",
    p.numero_documento_responsavel_matricula AS "CPF RESPONSAVEL",
    CASE
    WHEN TRIM(p.grau_parentesco_responsavel_matricula) <> '' THEN p.grau_parentesco_responsavel_matricula
    ELSE 'MAE'
END AS "GRAU DE PARENTESCO",
    COALESCE(p.endereco, 'NÃO INFORMADO') AS "ENDERECO",
    COALESCE(p.numero, 'NÃO INFORMADO') AS "NUMERO",
    COALESCE(p.bairro, 'NÃO INFORMADO') AS "BAIRRO",
    COALESCE(m.nome, 'NÃO INFORMADO') AS "CIDADE",
    COUNT(d.id_discente) AS "QUANTIDADE DE FILHOS NA UNIDADE ESCOLAR"
FROM discente d 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola 
JOIN escola.escola e ON e.id_escola = eees.id_escola 
LEFT JOIN comum.municipio m ON m.id_municipio = p.id_municipio_contato 
WHERE 
    1=1
    AND mes.ano_calendario = 2025
    AND mes.id_situacao_matricula_serie NOT IN (5, 6, 9)
GROUP BY 
    e.nome,
    p.nome_responsavel_matricula,
    p.nome_mae,
    p.numero_documento_responsavel_matricula,
    p.grau_parentesco_responsavel_matricula,
    p.endereco,
    p.numero,
    p.bairro,
    m.nome;