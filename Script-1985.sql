SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'AI1INT';


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 51881128;

-- Auto-generated SQL script #202603161535
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=31 	WHERE id_curriculo_basico=51881128;


--backup

UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=1 	WHERE id_curriculo_basico=51881128;