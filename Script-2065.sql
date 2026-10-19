-- ## ESCOLA MUN MANOEL VENANCIO FILHO ENS FUND EM TEMPO INTEGRAL - ANOS INICIAIS E EDUCACAO INFANTIL
-- BACKUP 
  
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1826
  AND ts.ano = 2026
   AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51881312,52039376,52039347) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51881312 THEN 52062354
    WHEN mes.id_curriculo_medio = 52039376 THEN 52062411
    WHEN mes.id_curriculo_medio = 52039347 THEN 52062662
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1826 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51881312,52039376,52039347) 
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio ||  ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1826 
  AND ts.ano = 2026
  AND ts.id_curriculo_medio IN (51881312,52039376,52039347) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51881312 THEN 52062354
    WHEN id_curriculo_medio = 52039376 THEN 52062411
    WHEN id_curriculo_medio = 52039347 THEN 52062662
END
WHERE id_escola = 1826 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51881312,52039376,52039347) 
  
