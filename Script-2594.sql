SELECT cb.id_curriculo_basico,cb.codigo,  cb.id_serie, cb.ativo, *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (35554848, 35555398)
ORDER BY cb.codigo;



UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51909913;
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51910095;
UPDATE basico.turma_serie SET id_curriculo_medio = 35548837, tipo_diario = 2  WHERE id_turma_serie  = 51910308;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51910309;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51909914;
UPDATE basico.turma_serie SET id_curriculo_medio = 35549268, tipo_diario = 2  WHERE id_turma_serie  = 51910096;


select u.login, t.codigo, e.nome, t.id_turma_serie 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
    JOIN escola.escola e ON e.id_escola = ts.id_escola 
    where dt.ativo and t.id_turma_serie = 51910094 --IN (51909912, 51910094, 51910307, 51918069);

SELECT *
FROM ensino.nota_unidade nu
WHERE nu.id_matricula_componente IN (17039089)
AND nu.nota IS NOT NULL;

--quando a unidade for 1 coloca 0 id_descricao_nota como 16 
--quando a unidade for 2 coloca 0 id_descricao_nota como 17 

SELECT dn.* FROM ensino.descricao_nota AS dn;
WHERE id_descricao_nota = 16;





-- UPDATE para atualizar o id_descricao_nota com base na unidade
UPDATE ensino.nota_unidade
SET id_descricao_nota = CASE 
    WHEN unidade = 1 THEN 16
    WHEN unidade = 2 THEN 17
    ELSE id_descricao_nota -- Mantém o valor atual se não for unidade 1 nem 2
END
WHERE id_matricula_componente = 17039089
  AND nota IS NOT NULL;


SELECT mc.* 
FROM ensino.turma t 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie in (51910096, 51910095)
AND t.id_disciplina = 229
AND mc.id_matricula_componente = 17039089;

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


SELECT * FROM ensino.nota_unidade nu WHERE nu.id_matricula_componente IN (17018641, 17018642, 17018643, 17018644, 17018645, 17018646, 17020116, 17020117, 17020118, 17020758, 17020759, 17020760, 17020761, 17018648, 17018650, 17018651, 17018652, 17034087, 17034088, 17034089, 17034090, 17034091, 17041350, 17035557, 17018647, 17036161, 17039459, 17018649, 17030859, 17019769, 17019770, 17019771, 17019772, 17019775, 17019776, 17019777, 17019778, 17019779, 17030860, 17030861, 17030862, 17030863, 17019773, 17019774, 17030864, 17030865, 17030866, 17047469, 17057367, 17057368, 17051219, 17051220, 17051221, 17051222, 17051223, 17051224, 17051225, 17051226, 17051227, 17051228, 17051229, 17051230, 17051231, 17051232, 17051233, 17051234, 17051235, 17051236, 17051237, 17037124, 17037116, 17037117, 17037118, 17037119, 17037120, 17037121, 17037122, 17037335, 17037336, 17037337, 17037338, 17037123)


SELECT * 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio || ', tipo_diario = ' || ts.tipo_diario || '  WHERE id_turma_serie  = ' || ts.id_turma_serie  || ';' AS script_backup
FROM  basico.turma_serie ts 
WHERE ts.ano = 2026 
  AND ts.id_curriculo_medio IN (35548837, 35549268)
  AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069)
  AND ts.ativo = true
  order by ts.nome;
  
BEGIN;

--backup  
SELECT  
'UPDATE ensino.nota_unidade SET id_descricao_nota = ' || nu.id_descricao_nota  
|| ', unidade = ' || nu.unidade  || ' WHERE id_nota_unidade = ' || id_nota_unidade  || ';' AS backup 
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente
WHERE ts.ativo 
AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069) 
AND ts.ativo 
AND t.ano = 2026
AND nu.nota IS NOT NULL
AND NOT EXISTS (
      SELECT 1 
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.id_descricao_nota IN (16, 17)
  );

  
  -- Consulta para gerar o script de backup (rollback) em formato de instrução SQL
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
AND t.ano = 2026
  AND nu.nota IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.id_descricao_nota IN (16, 17)
  );
  


SELECT *
FROM backup_nota nu;

ROLLBACK;

BEGIN;

-- Solução UPDATE direto 
UPDATE ensino.nota_unidade nu
SET id_descricao_nota = CASE 
            WHEN nu.unidade = 1 THEN 16
            WHEN nu.unidade = 2 THEN 17
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
        AND nu_check.id_descricao_nota IN (16, 17)
  );

BEGIN;

  ROLLBACK;
  
  
  SELECT 
    'UPDATE ensino.nota_unidade SET id_descricao_nota = ' || 
    CASE 
        WHEN nu.unidade = 1 THEN '16'
        WHEN nu.unidade = 2 THEN '17'
        ELSE 'NULL'
    END || 
    ', unidade = ' ||
    CASE 
        WHEN nu.unidade = 1 THEN '1' 
        WHEN nu.unidade = 2 THEN '1'
        ELSE nu.unidade::text
    END ||
    ' WHERE id_nota_unidade = ' || id_nota_unidade || ';' AS solucao
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente
WHERE ts.ativo 
AND ts.id_turma_serie_agrupadora IN (51909912, 51910094, 51910307, 51918069) 
AND ts.ativo 
AND t.ano = 2026
AND nu.nota IS NOT NULL
AND NOT EXISTS (
      SELECT 1 
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.id_descricao_nota IN (16, 17)
  )
ORDER BY nu.unidade;


SELECT * FROM ensino.nota_unidade nu WHERE nu.id_matricula_componente = 17055514
 AND nu.nota IS NOT NULL


(unidade, id_matricula_componente, recuperacao, id_descricao_nota)=(1, 17055514, f, 16) already exists.

ROLLBACK;

BEGIN;


UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131739;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130791;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131763;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130795;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131703;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130799;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131751;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130803;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131727;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130807;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131731;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130815;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131743;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130811;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131723;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130819;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131715;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130827;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131707;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130823;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131759;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130831;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131755;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130839;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131699;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130835;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131719;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130843;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131747;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130851;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131735;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130847;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130787;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52130855;
UPDATE ensino.nota_unidade SET id_descricao_nota = 16, unidade = 1 WHERE id_nota_unidade = 52131711;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130856;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131712;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131736;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131724;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131752;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131756;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131764;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131732;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131708;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131720;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131740;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131704;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131728;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131744;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131716;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131760;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131700;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52131748;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130788;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130792;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130796;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130800;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130804;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130808;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130816;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130812;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130820;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130828;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130824;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130832;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130840;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130836;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130844;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130852;
UPDATE ensino.nota_unidade SET id_descricao_nota = 17, unidade = 1 WHERE id_nota_unidade = 52130848;

