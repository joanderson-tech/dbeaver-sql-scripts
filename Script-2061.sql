SELECT *
FROM basico.mapeamento_series_tce_se mssts;

SELECT *
FROM basico.series_tce_se;

SELECT DISTINCT s.id_serie AS serie, s.descricao AS serieTCE, se.
FROM basico.serie s
JOIN basico.turma_serie ts ON
ts.id_serie = s.id_serie
WHERE ts.ano = 2026
AND ts.ativo;

SELECT s.id_serie AS serie, se.descricao AS serieTCE
FROM basico.serie s
JOIN  basico.mapeamento_series_tce_se mssts ON mssts.id_serie = s.id_serie 
JOIN basico.series_tce_se se ON se.id = mssts.id_serie_tce
ORDER BY s.id_etapa_ensino;


JOIN basico.series_tce_se se ON
se.codigo = s.sigla;

--Falta
1005302		MULTI 1ª FASE (1ª A 4ª ETAPAS), 
51899684	MULTI 1ª FASE (1ª E 2ª ETAPAS), 
51899685	MULTI 1ª FASE (3ª E 4ª ETAPAS)
1005339		MULTIANUAL (1º A 3º ANO), 
9621413		MULTIANUAL (1º A 5º ANO), 
51880499	MULTIANUAL (1º E 2º ANO), 
51880546	MULTIANUAL (2º E 3º ANO), 
51880201	MULTIANUAL (3° A 5°ANO), 
51880500	MULTIANUAL (3º E 4º ANO), 
5162362		MULTIANUAL (4º E 5º ANO)
51893578	MISTA (BERÇÁRIO + CRECHE + PRÉ), 
51899676	MISTA (BERÇÁRIO I E II), 
51869737	MISTA (CRECHE + PRÉ), 
51900646	MISTA (NÍVEL I E II), 
51900644	MISTA (PRÉ-ESCOLA 1º E 2º), 
51899688	MULTIANUAL (INFANTIL E ANOS INICIAIS)

INSERT INTO basico.mapeamento_series_tce_se (id_serie, id_serie_tce) VALUES(1005259, 1);

--Educação Infantil - CRECHE (0 A 3 ANOS) 1
51880199,51880200,51869713,51869716, 51899676

INSERT INTO basico.mapeamento_series_tce_se (id_serie, id_serie_tce)
VALUES 
    (51880199, 1),(51880200, 1),(51869713, 1),(51869716, 1),(51899676, 1),
  	(51869715, 2),(51869714, 2),(51893578, 2),(51869737, 2),(51900646, 2), (51900644, 2)
  	(1005218, 3),
  	(1005219, 4),(51880499, 4),
  	(1005220, 5),(1005339, 5),(51880546, 5),

/*
BERÇÁRIO I, 
BERÇÁRIO II, 
NÍVEL I, NÍVEL II,  
MISTA (BERÇÁRIO I E II)*/

--Educação Infantil - PRE-ESCOLA (4 A 5 ANOS) 2 
51869715,51869714, 51893578, 51869737, 51900646, 51900644 --

/*
1º PERÍODO, 2º PERÍODO, 
MISTA (BERÇÁRIO + CRECHE + PRÉ), 
MISTA (CRECHE + PRÉ), 
MISTA (NÍVEL I E II), 
MISTA (PRÉ-ESCOLA 1 º E 2 º), */

--Ensino Fundamental - 1º ANO 
1005218
--1º Ano

--Ensino Fundamental - 2º ANO
1005219, 51880499
/*
2º Ano,  
MULTIANUAL (1º E 2º ANO), */

--Ensino Fundamental - 3º ANO
1005220, 1005339, 51880546
/*
3º Ano,  
MULTIANUAL (1º A 3º ANO), 
MULTIANUAL (2º E 3º ANO)
*/
--Ensino Fundamental - 4º ANO
1005221, 51880500
/*4º Ano, 
MULTIANUAL (3º E 4º ANO)*/
--Ensino Fundamental - 5º ANO
1005222, 9621413, 51880201, 5162362, 51899688
/*5º Ano,  
MULTIANUAL (1º A 5º ANO), 
MULTIANUAL (3° A 5°ANO), 
MULTIANUAL (4º E 5º ANO), 
MULTIANUAL (INFANTIL E ANOS INICIAIS),*/

--Ensino Fundamental - 6º ANO
1005223
6º Ano
--Ensino Fundamental - 7º ANO
1005224
7º Ano
--Ensino Fundamental - 8º ANO
1005225	
8º Ano
--Ensino Fundamental - 9º ANO
1005226	
9º Ano
--EJA - 1º ao 5º ANO FUNDAMENTAL
15289953, 15289982, 15289983, 51880852, 1005302, 51899684, 51899685
/*1ª ETAPA (2º ANO), 
2ª ETAPA (3º ANO), 
3ª ETAPA (4º ANO), 
4ª ETAPA (5º ANO), 
MULTI 1ª FASE (1ª A 4ª ETAPAS),
MULTI 1ª FASE (1ª E 2ª ETAPAS), 
MULTI 1ª FASE (3ª E 4ª ETAPAS),*/

--EJA - 6º ao 9º ANO FUNDAMENTAL
15290011, 15290013, 51880853, 51880854
/*1ª ETAPA (6º ANO), 
2ª ETAPA (7º ANO), 
3ª ETAPA (8º ANO), 
4ª ETAPA (9º ANO)*/
--Atendimento Educacional Especializado
1005259	
Educação  Especial







