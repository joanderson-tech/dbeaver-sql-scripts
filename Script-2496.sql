
BEGIN;

--01 #### ESCOLA MUNICIPAL ADALIA DIAS 1037
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1037 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687114, 54687231, 54687374, 54687591, 54687713)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687114 THEN 55046133
    WHEN mes.id_curriculo_medio = 54687231 THEN 55046146
    WHEN mes.id_curriculo_medio = 54687374 THEN 55046159
    WHEN mes.id_curriculo_medio = 54687591 THEN 55046172
    WHEN mes.id_curriculo_medio = 54687713 THEN 55046185 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1037 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687114, 54687231, 54687374, 54687591, 54687713)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1037 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687114, 54687231, 54687374, 54687591, 54687713)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687114 THEN 55046133
        WHEN ts.id_curriculo_medio = 54687231 THEN 55046146
        WHEN ts.id_curriculo_medio = 54687374 THEN 55046159
        WHEN ts.id_curriculo_medio = 54687591 THEN 55046172
        WHEN ts.id_curriculo_medio = 54687713 THEN 55046185 
    END 
)
AND ts.id_escola = 1037 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687114, 54687231, 54687374, 54687591, 54687713);

--02 #### ESCOLA MUNICIPAL CORONEL JOSE LUCIO RIBEIRO 1041
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1041 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687205, 54687322, 54687465, 54687680, 54687791)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687205 THEN 55046198
    WHEN mes.id_curriculo_medio = 54687322 THEN 55046211
    WHEN mes.id_curriculo_medio = 54687465 THEN 55046224
    WHEN mes.id_curriculo_medio = 54687680 THEN 55046245
    WHEN mes.id_curriculo_medio = 54687791 THEN 55046258 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1041 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687205, 54687322, 54687465, 54687680, 54687791)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1041 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687205, 54687322, 54687465, 54687680, 54687791)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687205 THEN 55046198
        WHEN ts.id_curriculo_medio = 54687322 THEN 55046211
        WHEN ts.id_curriculo_medio = 54687465 THEN 55046224
        WHEN ts.id_curriculo_medio = 54687680 THEN 55046245
        WHEN ts.id_curriculo_medio = 54687791 THEN 55046258 
    END 
)
AND ts.id_escola = 1041 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687205, 54687322, 54687465, 54687680, 54687791);

--03 #### ESCOLA MUNICIPAL DONA MARIQUINHA 1043
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1043 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687153, 54687270, 54687413, 54687628, 54687739)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687153 THEN 55046271
    WHEN mes.id_curriculo_medio = 54687270 THEN 55046284
    WHEN mes.id_curriculo_medio = 54687413 THEN 55046297
    WHEN mes.id_curriculo_medio = 54687628 THEN 55046310
    WHEN mes.id_curriculo_medio = 54687739 THEN 55046323 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1043 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687153, 54687270, 54687413, 54687628, 54687739)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1043 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687153, 54687270, 54687413, 54687628, 54687739)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687153 THEN 55046271
        WHEN ts.id_curriculo_medio = 54687270 THEN 55046284
        WHEN ts.id_curriculo_medio = 54687413 THEN 55046297
        WHEN ts.id_curriculo_medio = 54687628 THEN 55046310
        WHEN ts.id_curriculo_medio = 54687739 THEN 55046323
    END 
)
AND ts.id_escola = 1043 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687153, 54687270, 54687413, 54687628, 54687739);

--04 #### ESCOLA MUNICIPAL JOAO CARVALHO BARBALHO 1048
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1048 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687166, 54687283, 54687426, 54687641, 54687752)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687166 THEN 55046336
    WHEN mes.id_curriculo_medio = 54687283 THEN 55046349
    WHEN mes.id_curriculo_medio = 54687426 THEN 55046362
    WHEN mes.id_curriculo_medio = 54687641 THEN 55046383
    WHEN mes.id_curriculo_medio = 54687752 THEN 55046396 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1048 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687166, 54687283, 54687426, 54687641, 54687752)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1048 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687166, 54687283, 54687426, 54687641, 54687752)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687166 THEN 55046336
        WHEN ts.id_curriculo_medio = 54687283 THEN 55046349
        WHEN ts.id_curriculo_medio = 54687426 THEN 55046362
        WHEN ts.id_curriculo_medio = 54687641 THEN 55046383
        WHEN ts.id_curriculo_medio = 54687752 THEN 55046396
    END 
)
AND ts.id_escola = 1048 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687166, 54687283, 54687426, 54687641, 54687752);

--05 #### ESCOLA MUNICIPAL PEDRO ALEXANDRINO DA SILVA  1052
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1052 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687179, 54687296, 54687439, 54687654, 54687765)
  AND ts.ativo = true
  order by ts.nome;


--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687179 THEN 55046409
    WHEN mes.id_curriculo_medio = 54687296 THEN 55046422
    WHEN mes.id_curriculo_medio = 54687439 THEN 55046435
    WHEN mes.id_curriculo_medio = 54687654 THEN 55046448
    WHEN mes.id_curriculo_medio = 54687765 THEN 55046461 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1052 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687179, 54687296, 54687439, 54687654, 54687765)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1052 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687179, 54687296, 54687439, 54687654, 54687765)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687179 THEN 55046409
        WHEN ts.id_curriculo_medio = 54687296 THEN 55046422
        WHEN ts.id_curriculo_medio = 54687439 THEN 55046435
        WHEN ts.id_curriculo_medio = 54687654 THEN 55046448
        WHEN ts.id_curriculo_medio = 54687765 THEN 55046461 
    END 
)
AND ts.id_escola = 1052 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687179, 54687296, 54687439, 54687654, 54687765);

--06 #### ESCOLA MUNICIPAL ZUZA GRANDE  1054
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1054 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687192, 54687309, 54687452, 54687667, 54687778)
  AND ts.ativo = true
  order by ts.nome;


--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687192 THEN 55046474
    WHEN mes.id_curriculo_medio = 54687309 THEN 55046487
    WHEN mes.id_curriculo_medio = 54687452 THEN 55046500
    WHEN mes.id_curriculo_medio = 54687667 THEN 55046513
    WHEN mes.id_curriculo_medio = 54687778 THEN 55046526 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1054 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687192, 54687309, 54687452, 54687667, 54687778)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1054 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687192, 54687309, 54687452, 54687667, 54687778)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687192 THEN 55046474
        WHEN ts.id_curriculo_medio = 54687309 THEN 55046487
        WHEN ts.id_curriculo_medio = 54687452 THEN 55046500
        WHEN ts.id_curriculo_medio = 54687667 THEN 55046513
        WHEN ts.id_curriculo_medio = 54687778 THEN 55046526  
    END 
)
AND ts.id_escola = 1054 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687192, 54687309, 54687452, 54687667, 54687778);

--07 #### ESCOLA MUNICIPAL DAVID SIMONETTI 1042 Não tem estudante, estou deixando caso seja alguem alocado a turma
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1042 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687140, 54687257, 54687400, 54687612, 54687726)
  AND ts.ativo = true
  order by ts.nome;


--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687140 THEN 55046539
    WHEN mes.id_curriculo_medio = 54687257 THEN 55046560
    WHEN mes.id_curriculo_medio = 54687400 THEN 55046573
    WHEN mes.id_curriculo_medio = 54687612 THEN 55046586
    WHEN mes.id_curriculo_medio = 54687726 THEN 55046599 
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1042 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687140, 54687257, 54687400, 54687612, 54687726)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1042 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687140, 54687257, 54687400, 54687612, 54687726)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687140 THEN 55046539
        WHEN ts.id_curriculo_medio = 54687257 THEN 55046560
        WHEN ts.id_curriculo_medio = 54687400 THEN 55046573
        WHEN ts.id_curriculo_medio = 54687612 THEN 55046586
        WHEN ts.id_curriculo_medio = 54687726 THEN 55046599 
    END 
)
AND ts.id_escola = 1042 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687140, 54687257, 54687400, 54687612, 54687726);

--08 #### ESCOLA MUNICIPAL ADALIA DIAS 1037
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1037 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687829)
  AND ts.ativo = true
  order by ts.nome;


--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687829 THEN 55046620
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1037 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687829)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1037 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687829)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687829 THEN 55046620
    END 
)
AND ts.id_escola = 1037 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687829);

--09 #### ESCOLA MUNICIPAL CORONEL JOSE LUCIO RIBEIRO 1041
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1041 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687842)
  AND ts.ativo = true
  order by ts.nome;


--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687842 THEN 55046641
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1041 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687842)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1041 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687842)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687842 THEN 55046641
    END 
)
AND ts.id_escola = 1041 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687842);

--10 #### ESCOLA MUNICIPAL DAVID SIMONETTI 1042
-- BACKUP 
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 1042 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687855,54687868)
  AND ts.ativo = true
  order by ts.nome;


--SOLUÇÃO
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = CASE 
    WHEN mes.id_curriculo_medio = 54687855 THEN 55046654
    WHEN mes.id_curriculo_medio = 54687868 THEN 55046667
END
FROM basico.turma_serie ts
WHERE mes.id_turma_serie = ts.id_turma_serie
  AND ts.id_escola = 1042 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687855,54687868)
  AND ts.ativo = true;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1042 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.id_curriculo_medio IN (54687855,54687868)
  AND ts.ativo = true
  order by ts.nome;

--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 54687855 THEN 55046654
        WHEN ts.id_curriculo_medio = 54687868 THEN 55046667
    END 
)
AND ts.id_escola = 1042 
AND ts.ano = 2026 
AND ts.id_turno = 1
AND ts.ativo = true
AND ts.id_curriculo_medio IN (54687855,54687868);

COMMIT;




