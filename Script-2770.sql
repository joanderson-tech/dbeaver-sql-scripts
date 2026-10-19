
BEGIN;

--01 #### ESC MUL ALFREDO SILVERIO 3116
-- BACKUP 
SELECT 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 3116
AND ts.ano = 2026
AND ts.id_curriculo_medio IN (52363955)
AND ts.ativo = TRUE
ORDER BY ts.nome;
  
--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 52363955 THEN 52406273
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
AND ts.id_escola = 3116
AND ts.ano = 2026
AND ts.id_curriculo_medio IN (52363955)
AND ts.ativo = TRUE;

-- BACKUP 
SELECT 'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 3116
AND ts.ano = 2026
AND ts.id_curriculo_medio IN (52363955)
AND ts.ativo = TRUE
ORDER BY ts.nome;
  
--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico, tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 52363955 THEN 52406273
    END 
)
AND ts.id_escola = 3116
AND ts.ano = 2026
AND ts.ativo = TRUE
AND ts.id_curriculo_medio IN (52363955);


-- Solução Sub-turmas
UPDATE basico.turma_serie SET id_curriculo_medio=52393675 WHERE id_turma_serie=52363978;
UPDATE basico.turma_serie SET id_curriculo_medio=52393688 WHERE id_turma_serie=52363979;

--backup
UPDATE basico.turma_serie SET id_curriculo_medio=52280311 WHERE id_turma_serie=52363978;
UPDATE basico.turma_serie SET id_curriculo_medio=52280325 WHERE id_turma_serie=52363979;


COMMIT ;

ROLLBACK;

SELECT *
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (54955032, 54955033, 54955031)
AND t.id_disciplina IN (227, 238);

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = 54955031
OR ts.id_turma_serie_agrupadora = 54955031;


SELECT DISTINCT ts.*
FROM basico.turma_serie ts
--JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_escola = 3116
AND ts.ano = 2026
AND ts.ativo 
AND ts.id_turma_serie IN (52363978, 52363979, 52363977);

ROLLBACK;

SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 52406273;

SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = '2e3MULINT' = 52406273

SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico IN (52280311, 52280325, 52393675, 52393688)

52363978, 52363979, 52363955

52280311
52393675
52280325
52393688

SELECT * FROM escola.escola e WHERE e.nome ILIKE 'ESC MUL ALFREDO SILVERIO'


UPDATE basico.turma_serie Set nome = 'MULTIMMUL1A' WHERE id_turma_serie = 52382894;
UPDATE basico.turma_serie Set nome = 'MULTIMMU45A' WHERE id_turma_serie = 52382898;
