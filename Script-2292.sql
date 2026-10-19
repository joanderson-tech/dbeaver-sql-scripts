SELECT 
'UPDATE basico.turma_serie SET tipo_diario = 37 WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS SOLUÇÃO,
'UPDATE basico.turma_serie SET tipo_diario =' || ts.tipo_diario || ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS BACKUP
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (51899009, 51898996)
AND ts.tipo_diario <> 37;






