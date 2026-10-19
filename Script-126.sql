SELECT DISTINCT
    i.id_instituicao,
    i.nome,
    i.sigla,
    i.server_id as site,
    i.status,
    split_part(
        (CASE
            WHEN ids.url LIKE '%10.0.10.39%' THEN 's4-db-01'
            WHEN ids.url LIKE '%10.0.10.46%' THEN 's3-db-02'
            WHEN ids.url LIKE '%10.0.10.64%' THEN 's3-db-01'
            WHEN ids.url LIKE '%10.0.10.36%' THEN 's2-db-02'
            WHEN ids.url LIKE '%10.0.10.254%' THEN 's2-db-01'
            WHEN ids.url LIKE '%10.0.10.118%' THEN 's1-db-02'
            WHEN ids.url LIKE '%10.0.10.192%' THEN 's1-db-01'
            ELSE ids.url
        END),
        'jdbc:postgresql://',
    1) as localizacao, 
    is_educ21, 
    container_based
FROM instituicao i 
JOIN instituicao_data_source ids
ON i.id_instituicao = ids.id_instituicao
WHERE i.status = 'ATIVO'
    AND i.sigla ilike '%petrolina%'
--    AND i.server_id = 2
    AND ids.id_sistema IN (2, 3);