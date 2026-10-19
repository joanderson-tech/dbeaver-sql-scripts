SELECT
    'UPDATE comum.pessoa ' ||
    'SET pais_nacionalidade = ' ||
    CASE
        WHEN pais_nacionalidade IS NOT NULL
            THEN '''' || pais_nacionalidade || ''''
        ELSE 'NULL'
    END ||
    ' WHERE id_pessoa = ' || id_pessoa || ';' AS backup_update
FROM comum.pessoa
WHERE id_pais_nacionalidade = 31
  AND pais_nacionalidade <> 'BRASILEIRA';
  
-- Aplicar correções
UPDATE comum.pessoa
SET pais_nacionalidade = 'BRASILEIRA'
WHERE id_pais_nacionalidade = 31
  AND pais_nacionalidade <> 'BRASILEIRA';
  
  COMMIT;
  
  BEGIN;