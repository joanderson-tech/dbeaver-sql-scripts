SELECT mes.* FROM escola.escola e 
JOIN basico.turma_serie ts on ts.id_escola = e.id_escola 
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL BENEDITO LOPES%'
AND ts.ano =2025
AND ts.nome ILIKE '%MULTIVM1A5B%'
AND ts.ativo
AND T.id_situacao_turma = 1;


-- Auto-generated SQL script #202601211416
UPDATE ensino.turma	SET id_situacao_turma=3	WHERE id_turma (698760,698761,698762,698763,698764,698765,698766,698767,698768,704167);


698760,698761,698762,698763,698764,698765,698766,698767,698768,704167

