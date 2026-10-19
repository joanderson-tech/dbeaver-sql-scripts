SELECT *--cb.codigo, cb.tipo_diario_diversificado 
FROM basico.curriculo_basico cb
WHERE id_curriculo_basico IN (51901615,51901625,51901635);

BEGIN;

--Para 3º, 4º e 5º ano, adicionar o tipo diário POR_COMPETENCIAS_PERNAMBUCO na parte diversificada e aplicar nas turmas criadas. 
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=35, possui_parte_diversificada = true	WHERE id_curriculo_basico IN (51901615,51901625,51901635);

--Trocar a estrutura e aplicar nas turmas 
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=35, possui_parte_diversificada = true WHERE id_curriculo_basico IN (52030949,52030965);
UPDATE basico.turma_serie SET id_curriculo_medio = 52030949 WHERE id_turma_serie IN (51899431, 51899576, 51955883, 51899577, 51901646);
UPDATE basico.turma_serie SET id_curriculo_medio = 52030965 	WHERE id_turma_serie=51899432;

COMMIT ;

--backup
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=NULL, possui_parte_diversificada = false WHERE id_curriculo_basico IN (51901615,51901625,51901635);

--Trocar a estrutura e aplicar nas turmas 
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=1, possui_parte_diversificada = false	WHERE id_curriculo_basico IN (52030949,52030965);

UPDATE basico.turma_serie SET id_curriculo_medio = 51901594 WHERE id_turma_serie IN (51899431, 51899576, 51955883, 51899577, 51901646);
UPDATE basico.turma_serie SET id_curriculo_medio=51901605 	WHERE id_turma_serie=51899432;












SELECT *
FROM basico.turma_serie ts
--JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio IN (51901594, 51901605)
AND ts.ativo ;

52030949
--1
52030965
--2
-- Auto-generated SQL script #202603051028
UPDATE basico.turma_serie
SET
id_curriculo_medio = 52030949
WHERE id_turma_serie IN (51899431, 51899576, 51955883, 51899577, 51901646);
