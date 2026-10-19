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
  AND NOT EXISTS (
      SELECT 1
      FROM ensino.nota_unidade nu_check
      WHERE nu_check.id_matricula_componente = nu.id_matricula_componente
        AND nu_check.unidade = nu.unidade
        AND nu_check.id_descricao_nota = 16
  );