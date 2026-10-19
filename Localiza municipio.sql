-- localizar município
SELECT DISTINCT
    i.id_instituicao,
    i.nome,
    i.sigla,
    i.server_id AS site,
    i.status,
    split_part(
        split_part(
            (CASE
                WHEN ids.url LIKE '%10.0.10.39%' THEN 's4-db-01'
                WHEN ids.url LIKE '%10.0.10.46%' THEN 's3-db-02'
                WHEN ids.url LIKE '%10.0.10.64%' THEN 's3-db-01'
                WHEN ids.url LIKE '%10.0.10.36%' THEN 's2-db-02'
                WHEN ids.url LIKE '%10.0.10.254%' THEN 's2-db-01'
                WHEN ids.url LIKE '%10.0.10.118%' THEN 's1-db-02'
                WHEN ids.url LIKE '%10.0.10.192%' THEN 's1-db-01'
                ELSE replace(ids.url, 'jdbc:postgresql://', '')
            END),
        ':', 1),
    '/', 1) AS localizacao,
    is_educ21,
    container_based
FROM instituicao i
JOIN instituicao_data_source ids
    ON i.id_instituicao = ids.id_instituicao
WHERE i.status = 'ATIVO'
  AND i.sigla ILIKE '%pia%'
    AND ids.id_sistema IN (2);

saogoncalodoamarantern
saogoncalodoamarantern