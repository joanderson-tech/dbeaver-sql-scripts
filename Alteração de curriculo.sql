
BEGIN;

UPDATE basico.curriculo_basico SET ativo=TRUE  WHERE id_curriculo_basico=54908782;

--01 #### ESCOLA MUNICIPAL PROFESSORA ANA MARIA DE LIMA CABRAL 1038
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1038 
  AND ts.ano = 2026 
  AND ts.id_curriculo_medio IN (51927445)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51927445 THEN 55056126
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1038 
  AND ts.ano = 2026 
  AND ts.id_curriculo_medio IN (51927445)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1038 
  AND ts.ano = 2026 
  AND ts.id_curriculo_medio IN (51927445)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 51927445 THEN 55056126
    END 
)
AND ts.id_escola = 1038 
AND ts.ano = 2026 
AND ts.ativo = true
AND ts.id_curriculo_medio IN (51927445);

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




UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366777;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366213;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366225;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366226;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366214;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366403;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1363074;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366280;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366281;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366282;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366227;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366457;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366333;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366334;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366328;
UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51927445 WHERE id_matricula_discente_serie = 1366349;


UPDATE basico.turma_serie SET id_curriculo_medio = 51927445, tipo_diario = 11  WHERE id_turma_serie  = 54869525;

