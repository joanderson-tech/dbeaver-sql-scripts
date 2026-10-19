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
  
  
