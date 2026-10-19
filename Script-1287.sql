SELECT * FROM comum.pessoa p WHERE p.nome ILIKE '%EVERARDO JOSÉ RODRIGUES%'; EVERARDO JOSÉ RODRIGUES HENRIQUE ALVES BATISTA


SELECT ts.id_escola, e.nome FROM basico.turma_serie ts 
JOIN escola.escola e ON e.id_escola = ts.id_escola 
WHERE ts.id_curriculo_medio = 51883942;

SELECT *  FROM escola.escola e WHERE e.nome ILIKE '%HENRIQUE ALVES BATISTA%'; -- 51877817

SELECT *  FROM escola.escola e WHERE e.nome ILIKE '%EVERARDO JOSE RODRIGUES%'; -- 51877804