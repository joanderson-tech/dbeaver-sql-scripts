SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 52591898;



ROLLBACK ;

BEGIN;

-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie IN (' || STRING_AGG(mes.id_matricula_discente_serie::text, ', ') || ');' AS script_backup, 
     COUNT(mes.id_matricula_discente_serie) AS total_matriculas
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE  ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (52347956, 52347971, 52347986)
  AND ts.ativo = true
  GROUP BY mes.id_curriculo_medio;
  
--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 52347956 THEN 52591865
    WHEN mes.id_curriculo_medio = 52347971 THEN 52591883
    WHEN mes.id_curriculo_medio = 52347986 THEN 52591898
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (52347956, 52347971, 52347986)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE  ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (52347956, 52347971, 52347986)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 52347956 THEN 52591865
        WHEN ts.id_curriculo_medio = 52347971 THEN 52591883
        WHEN ts.id_curriculo_medio = 52347986 THEN 52591898
    END 
)
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (52347956, 52347971, 52347986);


COMMIT;
