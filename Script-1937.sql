
--Trocar a estrutura e aplicar nas turmas 
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=35, possui_parte_diversificada = true WHERE id_curriculo_basico IN (52030949,52030965);

UPDATE basico.turma_serie SET id_curriculo_medio = 52030949 WHERE id_turma_serie IN (51899431, 51899576, 51955883, 51899577, 51901646);

UPDATE basico.turma_serie SET id_curriculo_medio=52030965 	WHERE id_turma_serie=51899432;



SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio IN (52030949,52030965);


SELECT * FROM ensino.turma t where t.id_turma_serie = 51899432;
