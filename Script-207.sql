SELECT DISTINCT
    i.server_id as site,
    i.id_instituicao,
    i.sigla,
    split_part(
        (CASE
            WHEN ids.url LIKE '%10.0.10.39%' THEN 's4-portal-db-01'
            WHEN ids.url LIKE '%10.0.10.46%' THEN 's3-portal-db-02'
            WHEN ids.url LIKE '%10.0.10.64%' THEN 's3-portal-db-01'
            WHEN ids.url LIKE '%10.0.10.36%' THEN 's2-portal-db-02'
            WHEN ids.url LIKE '%10.0.10.254%' THEN 's2-portal-db-01'
            WHEN ids.url LIKE '%10.0.10.118%' THEN 's1-portal-db-02'
            WHEN ids.url LIKE '%10.0.10.192%' THEN 's1-portal-db-01'
            ELSE ids.url
        END),
        'jdbc:postgresql://',
    1) as localizacao
FROM instituicao i 
JOIN instituicao_data_source ids
ON i.id_instituicao = ids.id_instituicao
WHERE 
    i.sigla ilike '%Macau%'
    and ids.id_sistema in(2,3);