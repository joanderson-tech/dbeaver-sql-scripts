 select * FROM ava.topico_aula ta
    WHERE  ta.data = '2025-05-05'
      AND ta.id_turma = 681952;
 
 
SELECT
    *
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado = true
  AND ta.id_turma = 682125
  select * from ava.topico_aula taa where taa."data" = ta.dat"data"  
  
  
  SELECT
    ta.*
FROM
    ava.topico_aula ta
WHERE
    ta.descricao IS NOT NULL
    AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
    AND ta.data_cadastro >= '2025-01-01'
    AND ta.programado = TRUE
    AND ta.id_turma = 682125
    AND ta."data" IN (
        SELECT
            data
        FROM
            ava.topico_aula
        WHERE
            descricao IS NOT NULL
            AND (conteudo_ministrado IS NOT NULL AND TRIM(conteudo_ministrado) <> '')
            AND data_cadastro >= '2025-01-01'
            AND programado = false
            AND id_turma = 682125
        GROUP BY
            data
        HAVING
            COUNT(data) > 1
    );