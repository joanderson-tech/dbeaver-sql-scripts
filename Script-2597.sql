SELECT * FROM ensino.nota_unidade nu WHERE nu.id_matricula_componente   IN (17039008, 17039017, 17039026, 17039035, 17039044, 17039053, 17039054, 17039055, 17039056, 17039057, 17039058, 17039059, 17039060, 17039062, 17039071, 17039080, 17039089, 17039090, 17039091, 17039092, 17039093, 17039094, 17039095, 17039096, 17039098, 17039107, 17039116, 17039125, 17039134, 17039143, 17039152, 17039161, 17039170, 17039171, 17039172, 17039173, 17039174, 17039175, 17039176, 17039177, 17047471);

SELECT DISTINCT mc.id_matricula_componente 
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
