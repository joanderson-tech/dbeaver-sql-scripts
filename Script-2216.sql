SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo in('AI4INTE','AI5INTE') ;

SELECT * FROM basico.curriculo_basico cb WHERE cb.tipo_diario = 2;


SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 51881332;


SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 51912799;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51881332;


UPDATE basico.curriculo_basico	SET tipo_diario=2,possui_parte_diversificada=true	WHERE id_curriculo_basico IN (52040743,52050799);




----

