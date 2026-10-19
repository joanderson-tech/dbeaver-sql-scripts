SELECT 
'UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = '||cb.id_curriculo_basico||';' AS solucao,
'UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=' || COALESCE('' || cb.tipo_diario_diversificado || '', 'NULL') ||' , possui_parte_diversificada='||cb.possui_parte_diversificada||'	WHERE id_curriculo_basico = '||cb.id_curriculo_basico||';' AS backup
FROM basico.curriculo_basico cb
WHERE cb.ativo
AND cb.id_curriculo_basico IN (53553723, 53553748, 53553681, 53598367, 53598382);

BEGIN;

UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53598367;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53598382;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53553681;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53553723;
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=1, possui_parte_diversificada=true WHERE id_curriculo_basico = 53553748;

COMMIT;

UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53598367;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53598382;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=20 , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53553681;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53553723;
UPDATE basico.curriculo_basico	SET tipo_diario_diversificado=NULL , possui_parte_diversificada=false	WHERE id_curriculo_basico = 53553748;
