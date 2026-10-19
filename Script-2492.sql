
/*Escola: ESCOLA MUNICIPAL PROFESSORA ANA MARIA DE LIMA CABRAL

Turmas: 

EJA - MULTISSERIADA - 1º E 2º NÍVEL - NOTURNO - EJAF1NEJAMA

 EJA1SM -> EJA1SM-26 (2026)

 EJA MULTI (3° E 4° NÍVEL) - NOTURNO - EJAF2NEM3E4A 

Ativa: 3E4NVL →  Foi adicionado os componenetes de "Educação física" e "Língua inglesa".*/


SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%ESCOLA MUNICIPAL PROFESSORA ANA MARIA DE LIMA CABRAL%';

ESCOLA MUNICIPAL DAVID SIMONETTI
MUL1a3-DS - Aplicar a estrutura MUL1a3DS26
MUL4a5-DS - Aplicar a estrutura MUL4a5DS26



--MUL1e2-AD - Aplicar a estrutura MUL12-AD26
SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('3E4NVL')
ORDER BY cb.codigo; 51927445

eu encontrei essa turma EJAF2NEM3E4A que ta com esse curriculo 3E4NVL

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo IN ('EJA1SM-26')
ORDER BY cb.codigo; 55056126


SELECT  DISTINCT ts.*
FROM  basico.turma_serie ts 
WHERE ts.id_escola = 1038
AND ts.ano = 2026
--AND ts.id_turno = 1
AND ts.id_curriculo_medio IN (54908782)--(55046654, 55046667)
AND ts.ativo = TRUE;

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie = 54955031 OR ts.id_turma_serie_agrupadora = 54955031;

SELECT * FROM basico.serie_multisseriada sm WHERE sm.id_serie = 54649631;

SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 55056126;

SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 54908782;


SELECT cb.codigo, cb.ano_entrada_vigor, *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (54736275, 54736265, 55056126)
ORDER BY cb.codigo; 55056126


SELECT cb.codigo, cb.ano_entrada_vigor, *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (54908536, 54908547, 54908782)
ORDER BY cb.codigo; 



54908782, 54908536, 54908547



