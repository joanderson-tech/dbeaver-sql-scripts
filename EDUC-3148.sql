-- ## ESCOLA MUNICIPAL CHAPEUZINHO VERMELHO - ANOS INICIAIS EM TEMPO INTEGRAL

-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1828 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878310,51878326,51878342,51878358,51878374)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51878310 THEN 52040695
    WHEN mes.id_curriculo_medio = 51878326 THEN 52040711
    WHEN mes.id_curriculo_medio = 51878342 THEN 52040727
    WHEN mes.id_curriculo_medio = 51878358 THEN 52040743
    WHEN mes.id_curriculo_medio = 51878374 THEN 52050799 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1828 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878310, 51878326, 51878342, 51878358, 51878374)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1828 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878310,51878326,51878342,51878358,51878374)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51878310 THEN 52040695
    WHEN id_curriculo_medio = 51878326 THEN 52040711
    WHEN id_curriculo_medio = 51878342 THEN 52040727
    WHEN id_curriculo_medio = 51878358 THEN 52040743
    WHEN id_curriculo_medio = 51878374 THEN 52050799 
END
WHERE id_escola = 1828 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51878310, 51878326, 51878342, 51878358, 51878374);

-- ## ESCOLA MUNICIPAL LUIZ MOREIRA DA SILVA ENSINO FUNDAMENTAL - ANOS INICIAIS

-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1822 
  AND ts.ano = 2026
   AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878358, 51878374)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51878358 THEN 52040743
    WHEN mes.id_curriculo_medio = 51878374 THEN 52050799
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1822 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878358, 51878374)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio ||  ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1822 
  AND ts.ano = 2026
  AND ts.id_curriculo_medio IN (51878358, 51878374)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51878358 THEN 52040743
    WHEN id_curriculo_medio = 51878374 THEN 52050799 
END
WHERE id_escola = 1822 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51878358, 51878374)

-- ## ESCOLA MUNICIPAL MONSENHOR WALFREDO GURGEL ENSINO FUNDAMENTAL ANOS FINAIS EM TEMPO INTEGRAL

 -- BACKUP 
  SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1821 
  AND ts.ano = 2026
   AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51878390 THEN 52052396
    WHEN mes.id_curriculo_medio = 51878407 THEN 52052413
    WHEN mes.id_curriculo_medio = 51878424 THEN 52052430
    WHEN mes.id_curriculo_medio = 51878441 THEN 52052447
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1821 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio ||  ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1821 
  AND ts.ano = 2026
  AND ts.id_curriculo_medio IN (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51878390 THEN 52052396
    WHEN id_curriculo_medio = 51878407 THEN 52052413
    WHEN id_curriculo_medio = 51878424 THEN 52052430
    WHEN id_curriculo_medio = 51878441 THEN 52052447
END
WHERE id_escola = 1821 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51878390,51878407,51878424,51878441) 
  
  
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
  
-- ## EM ARLINDO MARTINS ENSINO FUNDAMENTAL - ANOS FINAIS EM TEMPO INTEGRAL E EDUCACAO DE JOVENS E ADULTOS
-- BACKUP 
  
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1824 
  AND ts.ano = 2026
   AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51878390 THEN 52052396
    WHEN mes.id_curriculo_medio = 51878407 THEN 52052413
    WHEN mes.id_curriculo_medio = 51878424 THEN 52052430
    WHEN mes.id_curriculo_medio = 51878441 THEN 52052447
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1824 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio ||  ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1824 
  AND ts.ano = 2026
  AND ts.id_curriculo_medio IN (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51878390 THEN 52052396
    WHEN id_curriculo_medio = 51878407 THEN 52052413
    WHEN id_curriculo_medio = 51878424 THEN 52052430
    WHEN id_curriculo_medio = 51878441 THEN 52052447
END
WHERE id_escola = 1824 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51878390,51878407,51878424,51878441) 
  
  

-- ## EM FRANCISCO DE OLIVEIRA MELO ENSINO FUNDAMENTAL DE TEMPO INTEGRAL ANOS FINAIS E EJA
-- BACKUP 
  
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1829 
  AND ts.ano = 2026
   AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51878390 THEN 52052396
    WHEN mes.id_curriculo_medio = 51878407 THEN 52052413
    WHEN mes.id_curriculo_medio = 51878424 THEN 52052430
    WHEN mes.id_curriculo_medio = 51878441 THEN 52052447
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1829 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio in (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio ||  ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1829 
  AND ts.ano = 2026
  AND ts.id_curriculo_medio IN (51878390,51878407,51878424,51878441) 
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51878390 THEN 52052396
    WHEN id_curriculo_medio = 51878407 THEN 52052413
    WHEN id_curriculo_medio = 51878424 THEN 52052430
    WHEN id_curriculo_medio = 51878441 THEN 52052447
END
WHERE id_escola = 1829 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51878390,51878407,51878424,51878441) 
  
  
-- ## ESCOLA MUNICIPAL FELIX ANTONIO
-- BACKUP 
  
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1825 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878310,51878326,51878342,51878358)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 51878310 THEN 52040695
    WHEN mes.id_curriculo_medio = 51878326 THEN 52040711
    WHEN mes.id_curriculo_medio = 51878342 THEN 52040727
    WHEN mes.id_curriculo_medio = 51878358 THEN 52040743
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1825 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878310, 51878326, 51878342, 51878358)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ' WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1825 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (51878310,51878326,51878342,51878358)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie
SET id_curriculo_medio = CASE 
    WHEN id_curriculo_medio = 51878310 THEN 52040695
    WHEN id_curriculo_medio = 51878326 THEN 52040711
    WHEN id_curriculo_medio = 51878342 THEN 52040727
    WHEN id_curriculo_medio = 51878358 THEN 52040743
END
WHERE id_escola = 1825 
  AND ano = 2026 
  AND id_turno = 1
  AND ativo = true
  AND id_curriculo_medio IN (51878310, 51878326, 51878342, 51878358);


