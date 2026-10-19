SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo ILIKE '%CICLO II%'

--1º segmento da EJA
SELECT 
'UPDATE basico.curriculo_basico 	SET tipo_diario =38 	WHERE id_curriculo_basico = '|| cb.id_curriculo_basico||';' AS solução, 
'UPDATE basico.curriculo_basico 	SET tipo_diario = '|| cb.tipo_diario||'	WHERE id_curriculo_basico = '|| cb.id_curriculo_basico||';' AS backup
FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico  IN (35554848, 35548837, 35555398, 35549268, 51908662)
AND cb.ativo;

SELECT 
'UPDATE basico.curriculo_basico 	SET tipo_diario=38 	WHERE id_curriculo_basico = '|| ts.id_turma_serie||';' AS solução, 
'UPDATE basico.turma_serie SET tipo_diario= '|| ts.tipo_diario||'	WHERE id_turma_serie = '|| ts.id_turma_serie||';' AS backup
FROM basico.turma_serie ts WHERE ts.id_curriculo_medio IN (35554848, 35548837, 35555398, 35549268, 51908662)
AND ts.ativo;