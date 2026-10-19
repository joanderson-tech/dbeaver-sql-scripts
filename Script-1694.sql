SELECT DISTINCT t
FROM escola.escola e
JOIN basico.turma_serie ts ON
ts.id_escola = e.id_escola
--JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL BENEDITO LOPES%'
AND ts.ano = 2025
AND ts.nome ILIKE '%MULTIVM1A5B%'
AND ts.ativo;
AND t.id_situacao_turma <> 4;
