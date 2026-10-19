SELECT *
-- 'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM basico.turma_serie ts
WHERE ts.ano = 2026
AND ts.id_curriculo_medio IN (35559167, 35558311);
--  AND ts.id_turma_serie_agrupadora IN (51910099, 51910428)
AND ts.ativo = TRUE
ORDER BY ts.nome;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (35550541, 35550998);

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (35559167, 35558311);

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (51908672);

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (51908672);


SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie IN (51910047, 51910099, 51910428) OR ts.id_turma_serie_agrupadora IN (51910047, 51910099, 51910428) 
AND ts.ativo ;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie IN (51901501, 51908054, 51908589, 51910100, 51910101, 51910429, 51910430, 51911102, 51911103, 51912156, 51913415, 51924770, 51927240, 51929923, 52118681, 52195050, 52234511, 52324003, 51910099, 51910428)