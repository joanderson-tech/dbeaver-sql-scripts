SELECT *
FROM basico.mapeamento_series_tce_se mssts;

SELECT *
FROM basico.series_tce_se;

SELECT *
FROM basico.serie s;
JOIN basico.series_tce_se se ON
se.codigo = s.sigla;

SELECT s.descricao , se.descricao, s.id_etapa_ensino, se.id 
FROM basico.serie s
JOIN  basico.mapeamento_series_tce_se mssts ON mssts.id_serie = s.id_serie 
JOIN basico.series_tce_se se ON se.id = mssts.id_serie_tce
ORDER BY s.id_etapa_ensino;


INSERT INTO basico.mapeamento_series_tce_se (id_serie, id_serie_tce)
VALUES 
    (51880199, 1),(51880200, 1),(51869713, 1),(51869716, 1),(51899676, 1),
  	(51869715, 2),(51869714, 2),(51893578, 2),(51869737, 2),(51900646, 2), (51900644, 2),
  	(1005218, 3),
  	(1005219, 4),(51880499, 4),
  	(1005220, 5),(1005339, 5),(51880546, 5),
  	(1005221, 6),(51880500, 6),
  	(1005222, 7),(9621413, 7),(51880201, 7),(5162362, 7),(51899688, 7),
  	(1005223, 8),
  	(1005224, 9),
  	(1005225, 10),
  	(1005226, 11),
  	(15289953, 12),(15289982, 12),(15289983, 12),(51880852, 12),(1005302, 12), (51899684, 12), (51899685, 12),
	(15290011, 13),(15290013, 13),(51880853, 13),(51880854, 13),
	(1005259, 14);