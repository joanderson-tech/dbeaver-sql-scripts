




SELECT 'UPDATE ensino.nota_unidade SET id_descricao_nota = ' || 
    COALESCE(nu.id_descricao_nota::text, 'NULL') || 
    ', unidade = ' || nu.unidade || 
    ' WHERE id_nota_unidade = ' || nu.id_nota_unidade || ';' AS backup
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN ensino.matricula_componente mc ONmc.id_turma = t.id_turma
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


SELECT * FROM ensino.nota_unidade nu
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




  SELECT 
    nu.*, 
    CASE 
        WHEN nu.unidade IN (1, 2) THEN 16
        ELSE nu.id_descricao_nota
    END AS novo_id_descricao_nota
FROM ensino.nota_unidade nu
JOIN ensino.matricula_componente mc ON mc.id_matricula_componente = nu.id_matricula_componente
JOIN ensino.turma t ON t.id_turma = mc.id_turma
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
WHERE ts.ativo
  AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069)
  AND t.ano = 2026
  AND nu.nota IS NOT NULL
  -- TRAVA DE SEGURANÇA:
  -- Garante que só exibe linhas onde a unidade ainda NÃO possui o id_descricao_nota = 16
  AND NOT EXISTS (
      SELECT 1
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.unidade = nu.unidade
        AND nu_check.id_descricao_nota = 16
  );
  
  

  
  
  
  
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
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130791;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130795;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130799;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130803;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130807;
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
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130835;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130843;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130851;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130847;
UPDATE ensino.nota_unidade SET id_descricao_nota = NULL, unidade = 1 WHERE id_nota_unidade = 52130855;

