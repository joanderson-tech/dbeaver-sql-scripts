INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(1, 'INF1', 'Educação Infantil - CRECHE (0 A 3 ANOS)', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(2, 'INF2', 'Educação Infantil - PRE-ESCOLA (4 A 5 ANOS)', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(3, 'FUN1', 'Ensino Fundamental - 1º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(4, 'FUN2', 'Ensino Fundamental - 2º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(5, 'FUN3', 'Ensino Fundamental - 3º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(6, 'FUN4', 'Ensino Fundamental - 4º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(7, 'FUN5', 'Ensino Fundamental - 5º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(8, 'FUN6', 'Ensino Fundamental - 6º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(9, 'FUN7', 'Ensino Fundamental - 7º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(10, 'FUN8', 'Ensino Fundamental - 8º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(11, 'FUN9', 'Ensino Fundamental - 9º ANO', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(12, 'EJA1', 'EJA - 1º ao 5º ANO FUNDAMENTAL', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(13, 'EJA2', 'EJA - 6º ao 9º ANO FUNDAMENTAL', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(14, 'AEE1', 'Atendimento Educacional Especializado', true);
INSERT INTO basico.series_tce_se (id, codigo, descricao, ativo) VALUES(15, 'COM1', 'Atividade Complementar', true);


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