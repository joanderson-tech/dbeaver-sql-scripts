SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'EJAMUL1'; ---51908662

SELECT * FROM  basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico_serie_associada = 35548837;



SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 51908662;

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069);
--AND ts.id_curriculo_medio NOT IN (35554848, 35555398);

35554848, 35555398

SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico IN (35554848, 35555398, 35548837, 35549268);


SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie IN (51914856, 51924799, 52127722, 52231119, 52231121, 52232264);

SELECT cb.id_curriculo_basico,cb.codigo,  cb.id_serie, cb.ativo, *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (35548837, 35549268)
ORDER BY cb.codigo;

35554848, 35555398

SELECT * 
FROM ensino.matricula_componente mc 
JOIN basico.matricula_estudante_serie mes ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
WHERE mc.id_matricula_componente   
IN (17039008, 17039017, 17039026, 17039035, 17039044, 17039053, 17039054, 17039055, 17039056, 17039057, 17039058, 17039059, 17039060, 17039062, 17039071, 17039080, 17039089, 17039090, 17039091, 17039092, 17039093, 17039094, 17039095, 17039096, 17039098, 17039107, 17039116, 17039125, 17039134, 17039143, 17039152, 17039161, 17039170, 17039171, 17039172, 17039173, 17039174, 17039175, 17039176, 17039177, 17047471)
AND mes.id_turma_serie = 51910094;




--bakupk
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51909913;
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51910095;
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51910308;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51910309;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51909914;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51910096;


---solução 

BEGIN;

-- BACKUP 
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.ano = 2026 
  AND ts.id_curriculo_medio IN (35548837, 35549268)
  AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069)
  AND ts.ativo = true
  order by ts.nome;
  
--SOLUÇÃO
UPDATE basico.turma_serie ts
SET id_curriculo_medio = c_novo.id_curriculo_basico,
    tipo_diario = c_novo.tipo_diario
FROM basico.curriculo_basico c_novo
WHERE c_novo.id_curriculo_basico = (   
    CASE 
        WHEN ts.id_curriculo_medio = 35548837 THEN 35554848
        WHEN ts.id_curriculo_medio = 35549268 THEN 35555398
    END 
)
AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069)
AND ts.ano = 2026 
AND ts.ativo = true
AND ts.id_curriculo_medio IN (35548837, 35549268);

-- BACKUP 
SELECT  
  'UPDATE ensino.nota_unidade SET id_descricao_nota = ' || 
    COALESCE(nu.id_descricao_nota::text, 'NULL') || 
    ', unidade = ' || nu.unidade || 
    ' WHERE id_nota_unidade = ' || nu.id_nota_unidade || ';' AS backup
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente
WHERE ts.ativo 
  AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069) 
  AND mc.id_matricula_componente = 17039053
AND t.ano = 2026
  AND nu.nota IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.id_descricao_nota IN (16, 16)
  );

-- Solução UPDATE direto 
UPDATE ensino.nota_unidade nu
SET id_descricao_nota = CASE 
            WHEN nu.unidade = 1 THEN 16
            WHEN nu.unidade = 2 THEN 16
            ELSE nu.id_descricao_nota
        END,
    unidade = 1
FROM ensino.matricula_componente mc
JOIN ensino.turma t ON t.id_turma = mc.id_turma
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
WHERE nu.id_matricula_componente = mc.id_matricula_componente
  AND ts.ativo 
  AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069) 
  AND t.ano = 2026
  AND nu.nota IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.id_descricao_nota IN (16, 16)
  );

COMMIT ;


SELECT nu.* 
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente
WHERE ts.ativo 
AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069) 
AND ts.ativo 
AND t.ano = 2026
AND nu.nota IS NOT NULL;


SELECT mc.* 
FROM ensino.turma t 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie in (51910096, 51910095)
AND t.id_disciplina = 229
AND mc.id_matricula_componente = 17039053;


SELECT *
FROM ensino.nota_unidade nu
WHERE nu.id_matricula_componente IN (17039053);
AND nu.nota IS NOT NULL


SELECT nu.* 
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente
WHERE ts.ativo 
AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069) 
AND ts.ativo 
AND t.ano = 2026
AND nu.nota IS NOT NULL
AND nu.id_matricula_componente IN (17039053);
AND NOT EXISTS (
      SELECT 1 
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.id_descricao_nota IN (16, 17)
  );
  
  -- Consulta de diagnóstico para testar a matricula 17039053
SELECT 
    nu.id_nota_unidade,
    nu.id_matricula_componente,
    nu.nota,
    nu.id_descricao_nota,
    t.ano AS ano_turma,
    ts.ativo AS turma_serie_ativa,
    ts.id_turma_serie_agrupadora
FROM ensino.nota_unidade nu
LEFT JOIN ensino.matricula_componente mc ON mc.id_matricula_componente = nu.id_matricula_componente
LEFT JOIN ensino.turma t ON t.id_turma = mc.id_turma
LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
WHERE nu.id_matricula_componente = 17039053;


SELECT * FROM ensino.nota_unidade nu WHERE nu.id_nota_unidade  IN (52130775, 52130776, 52130777, 52130778, 52749934, 52749937, 52749940, 52749943, 52749946, 52749949, 52749952, 52749955, 52749958, 52749961, 52749964, 52749967, 52749970, 52749973, 52749976, 52749979, 52749982, 52749985, 52749988, 52749991, 52749994, 52749997, 52750000, 52750003, 52750006, 52750009, 52750012, 52750015);



UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131711;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131712;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131735;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131736;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131723;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131724;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131751;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131752;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131755;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131756;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131763;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131764;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131731;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131732;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131707;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131708;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131719;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131720;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131739;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131740;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131703;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131704;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131727;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131728;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131743;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131744;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131715;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131716;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131759;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131760;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131699;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131700;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131747;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131748;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130787;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130788;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130791;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130792;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130795;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130796;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130799;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130800;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130803;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130804;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130807;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130808;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130815;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130816;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130811;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130812;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130819;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130820;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130827;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130828;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130823;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130824;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130831;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130832;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130839;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130840;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130835;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130836;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130843;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130844;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130851;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130852;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130847;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130848;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130855;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130856;


