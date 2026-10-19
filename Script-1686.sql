
SELECT DISTINCT  t.* --string_agg(t.id_turma::varchar , ', ')  
FROM ensino.matricula_componente mc 
JOIN ensino.turma t on t.id_turma  = mc.id_turma 
WHERE t.id_turma_serie IN (53081433,53081434,53081435,53081436,52701073,53081437)
AND t.id_situacao_turma <> 4;-- 52701073,53081437