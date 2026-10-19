SELECT * FROM basico.curriculo_basico cb WHERE cb.ativo AND cb.codigo IN ( 'AI1INT-26','AI2INT-26');

SELECT * FROM basico.curriculo_basico cb WHERE cb.ativo AND cb.id_serie IN (53553723, 53553748, 53553681,53598367,53598382) ;
AND cb.ano_entrada_vigor = 2026;

SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 53553681;


-- Auto-generated SQL script #202605251732
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=1,possui_parte_diversificada=true	WHERE id_curriculo_basico=53553681;



-- Auto-generated SQL script #202605251715
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=20,possui_parte_diversificada=false	WHERE id_curriculo_basico=53553681;



SELECT * FROM basico.serie WHERE id_etapa_ensino IN (1, 2)

SELECT 
'UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = '||cb.id_curriculo_basico||';' AS solucao,
'UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=' || COALESCE('' || cb.tipo_diario_diversificado || '', 'NULL') ||' , possui_parte_diversificada='||cb.possui_parte_diversificada||'	WHERE id_curriculo_basico = '||cb.id_curriculo_basico||';' AS backup
FROM basico.curriculo_basico cb
WHERE cb.ativo
AND cb.id_curriculo_basico IN (53553723, 53553748, 53553681, 53598367, 53598382);



SELECT ts
FROM basico.curriculo_basico cb
JOIN basico.turma_serie ts ON ts.id_curriculo_medio = cb.id_curriculo_basico 
WHERE cb.ativo
AND cb.id_curriculo_basico IN (53553723, 53553748, 53553681, 53598367, 53598382)
AND ts.ativo ;


UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=FALSE WHERE id_curriculo_basico = 53553723;


 'tipo_diario_diversificado = ' || COALESCE('''' || cb.tipo_diario_diversificado || '''', 'NULL')

 
 
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53553723;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53553748;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53598367;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53598382;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53553681;



UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53553723;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53553748;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53598367;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53598382;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado='1' , possui_parte_diversificada=true	WHERE id_curriculo_basico = 53553681;


