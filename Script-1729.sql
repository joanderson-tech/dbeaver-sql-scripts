SELECT * 
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio IN (52168262, 52168252)
AND ts.ano = 2025
AND ts.id_escola IN (1234,1228,1229);

SELECT *
FROM basico.curriculo_basico
WHERE codigo IN ('EFAF6', 'EFAF7');




-- EFAF7 --
UPDATE basico.turma_serie
SET id_curriculo_medio = (SELECT id_curriculo_basico FROM basico.curriculo_basico cb WHERE cb.codigo IN ('EFAF6', 'EFAF7') AND cb.ano_entrada_vigor = 2026 AND cb.id_serie IN (1005224))
WHERE id_turma_serie IN (52967441, 52967450, 52967443, 52967533, 52967621, 52967442, 52973900);

-- EFAF6 --
UPDATE basico.turma_serie
SET id_curriculo_medio = (SELECT id_curriculo_basico FROM basico.curriculo_basico cb WHERE cb.codigo IN ('EFAF6', 'EFAF7') AND cb.ano_entrada_vigor = 2026 AND cb.id_serie IN (1005223))
WHERE id_turma_serie IN (52967620, 52967440, 52969179, 52967531, 52967439, 52967623, 52967485, 52967532);


--backup
-- EFAF7 --
UPDATE basico.turma_serie SET id_curriculo_medio = 52168262 WHERE id_turma_serie IN (52967441, 52967450, 52967443, 52967533, 52967621, 52967442, 52973900);

-- EFAF6 --
UPDATE basico.turma_serie SET id_curriculo_medio = 52168252 WHERE id_turma_serie IN (52967620, 52967440, 52969179, 52967531, 52967439, 52967623, 52967485, 52967532);


