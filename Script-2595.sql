SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'EJAMUL1'; ---51908662

SELECT * FROM  basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 51908662;

SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 51908662;

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069);


SELECT *  
    --'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.ano = 2026 
  AND ts.id_curriculo_medio IN (35548837, 35549268)
  AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069)
  AND ts.ativo = true
  order by ts.nome;
  
  
  
  SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.ano = 2026 
  AND ts.id_curriculo_medio IN (35550541, 35550998)
  AND ts.id_turma_serie_agrupadora IN (51910099, 51910428)
  AND ts.ativo = true
  order by ts.nome;

  
  SELECT cb.id_curriculo_basico,cb.codigo,  cb.id_serie, cb.ativo, *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (35554848, 35555398)
ORDER BY cb.codigo;
  
