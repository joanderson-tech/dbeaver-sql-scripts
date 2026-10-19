SELECT cbc.*
FROM basico.curriculo_basico cb
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = cb.id_curriculo_basico
WHERE cb.codigo IN ('EFAF6', 'EFAF7')
	AND cb.ano_entrada_vigor = 2020
	AND cb.id_serie IN (1005223, 1005224);





SELECT * FROM 
basico.turma_serie ts WHERE id_turma_serie IN (52967620, 52967440, 52969179, 52967531, 52967439, 52967623, 52967485, 52967532);

