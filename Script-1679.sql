SELECT t.codigo, t.id_situacao_turma,  t.* FROM escola.escola e 
JOIN basico.turma_serie ts on ts.id_escola = e.id_escola 
JOIN ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL BENEDITO LOPES%'
AND ts.ano =2025
AND ts.nome ILIKE '%MULTIVM1A5B%'
AND ts.ativo;
