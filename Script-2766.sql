SELECT *
FROM basico.curriculo_basico cb
WHERE cb.ano_entrada_vigor = 2026;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo in('MU4E5-26', 'MULTI1A3');

SELECT *
FROM escola.escola e
WHERE e.nome ILIKE 'ESCOLA MUNICIPAL QUILOMBOLA FRANCISCA ILMA BESSA';

SELECT *
FROM basico.turma_serie ts
WHERE ts.ano = 2026
/*AND ts.id_escola = 52377824
AND ts.nome IN ('MULTIMMU45A', 'MULTIMMUL1A')
AND ativo*/
AND ts.id_turma_serie IN (52382898,52382894) OR ts.id_turma_serie_agrupadora IN (52382898,52382894)
ORDER BY ts.nome;

SELECT *
FROM basico.turma_serie ts
WHERE ts.ano = 2026
AND ts.id_turma_serie IN (52382898,52382894) OR ts.id_turma_serie_agrupadora IN (52382898,52382894)
ORDER BY ts.nome;

/*MULTIMMU45A
MULTIMMUL1A*/