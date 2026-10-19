SELECT s.descricao , se.descricao, se.id 
FROM basico.serie s
JOIN  basico.mapeamento_series_tce_se mssts ON mssts.id_serie = s.id_serie 
JOIN basico.series_tce_se se ON se.id = mssts.id_serie_tce
ORDER BY s.id_etapa_ensino, se.id ;