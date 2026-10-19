BEGIN;

ROLLBACK;
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
SELECT 'UPDATE ensino.nota_unidade SET id_descricao_nota = ' || 
    COALESCE(nu.id_descricao_nota::text, 'NULL') || 
    ', unidade = ' || nu.unidade || 
    ' WHERE id_nota_unidade = ' || nu.id_nota_unidade || ';' AS backup
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente
WHERE ts.ativo
AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069)
AND t.ano = 2026
AND nu.nota IS NOT NULL
AND NOT EXISTS (
      SELECT 1
FROM ensino.nota_unidade nu_check
WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
AND nu_check.unidade = nu.unidade
AND nu_check.id_descricao_nota = 16);


-- Solução UPDATE direto 
UPDATE ensino.nota_unidade nu
SET id_descricao_nota = 
    CASE 
        WHEN nu.unidade IN (1, 2) THEN 16
        ELSE nu.id_descricao_nota
    END
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
AND nu_check.unidade = nu.unidade
AND nu_check.id_descricao_nota = 16);

COMMIT ;




UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51909913;
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51910095;
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51910308;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51910309;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51909914;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51910096;


UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131711;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131712;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131723;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131724;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52131735;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52131736;
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
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130775;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130776;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130779;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130780;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130783;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130784;
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
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130811;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130812;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130815;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130816;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130819;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130820;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130823;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130824;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130827;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130828;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130831;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130832;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130835;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130836;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130839;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130840;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130843;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130844;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130847;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130848;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130851;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130852;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130855;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52130856;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52110562;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52110563;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52110558;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52110559;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52110554;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 2 WHERE id_nota_unidade = 52110555;
