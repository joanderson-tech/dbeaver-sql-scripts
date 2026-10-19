SELECT 'UPDATE basico.curriculo_basico 	SET tipo_diario=38	WHERE id_curriculo_basico = ' || cb.id_curriculo_basico  || ';' AS SOLUCAO,
	   'UPDATE basico.curriculo_basico 	SET tipo_diario= '|| cb.tipo_diario ||' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico || ';' AS BACKUP
FROM basico.curriculo_basico cb WHERE cb.codigo IN ('AI3INT', 'AI4INT', 'AI5INT', 'AI3', 'AI4', 'AI5')
AND cb.ativo 
GROUP BY cb.id_curriculo_basico, cb.tipo_diario
ORDER BY  cb.tipo_diario;


SELECT 'UPDATE basico.curriculo_basico 	SET tipo_diario=38	WHERE id_curriculo_basico = ' || cb.id_curriculo_basico  || ';' AS SOLUCAO,
	   'UPDATE basico.curriculo_basico 	SET tipo_diario= '|| cb.tipo_diario ||' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico || ';' AS BACKUP
FROM basico.curriculo_basico cb WHERE cb.codigo IN ('AI3INT', 'AI4INT', 'AI5INT', 'AI3', 'AI4', 'AI5')
AND cb.ativo 
GROUP BY cb.id_curriculo_basico, cb.tipo_diario
ORDER BY  cb.tipo_diario;



SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub ;

UPDATE basico.curriculo_basico 	SET tipo_diario=38	WHERE id_curriculo_basico IN(35501103, 35500365, 35499472, 51896892, 51896922, 51896907);

SELECT * FROM  basico.turma_serie 	WHERE id_turma_serie IN (51887116, 51887117, 51891580, 51892361, 51892362, 51892359, 51904899, 51892131, 51896861, 51892132, 51892003, 51897108, 51897241, 51897252, 51897704, 51905679, 51905680, 51899801, 51897776, 51905690, 51907113, 51901926, 51902460, 51902461, 51902465, 51903802, 51903803, 51903848, 51903853, 51903931, 51903932, 51904069, 51903957, 51904074, 51904087, 51904088, 51904089);

