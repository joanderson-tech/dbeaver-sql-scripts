SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico in (35558311,35559167);

BEGIN;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.ano = 2026 
  AND ts.id_curriculo_medio IN (35550541, 35550998)
  AND ts.id_turma_serie_agrupadora IN (51910099, 51910428)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 35550541 THEN 35558311
        WHEN ts.id_curriculo_medio = 35550998 THEN 35559167
    END 
)
AND ts.id_turma_serie_agrupadora IN (51910099, 51910428)
AND ts.ano = 2026 
AND ts.ativo = true
AND ts.id_curriculo_medio IN (35550541, 35550998);

COMMIT ;





UPDATE basico.turma_serie SET id_curriculo_medio = 35550541, tipo_diario = 10  WHERE id_turma_serie  = 51910429;
UPDATE basico.turma_serie SET id_curriculo_medio = 35550541, tipo_diario = 10  WHERE id_turma_serie  = 51910100;
UPDATE basico.turma_serie SET id_curriculo_medio = 35550998, tipo_diario = 0  WHERE id_turma_serie  = 51910430;
UPDATE basico.turma_serie SET id_curriculo_medio = 35550998, tipo_diario = 0  WHERE id_turma_serie  = 51910101;

