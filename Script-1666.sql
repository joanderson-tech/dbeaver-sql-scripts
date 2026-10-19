SELECT EXISTS ( SELECT 1
FROM matricula.calendario_matricula cm
LEFT JOIN matricula.periodo_novos_alunos pna ON
pna.id_calendario_matricula = cm.id_calendario_matricula
WHERE cm.ativo
AND cm.vigente
AND ((cm.utiliza_periodo_matricula_online
	AND current_date BETWEEN pna.data_inicio AND pna.data_fim)
OR (cm.utiliza_matricula_antecipada_nee
	AND current_date BETWEEN data_inicio_novos_alunos_nee AND data_fim_novos_alunos_nee)) ) AS periodo_ativo;
FALSE



 SELECT cm.*
FROM matricula.calendario_matricula cm
LEFT JOIN matricula.periodo_novos_alunos pna ON
pna.id_calendario_matricula = cm.id_calendario_matricula
WHERE cm.ativo AND cm.vigente ;
AND ((cm.utiliza_periodo_matricula_online
	AND current_date BETWEEN pna.data_inicio AND pna.data_fim)
OR (cm.utiliza_matricula_antecipada_nee
	AND current_date BETWEEN data_inicio_novos_alunos_nee AND data_fim_novos_alunos_nee))
	
	2025-11-27 00:00:00.000
	
	
	-- Auto-generated SQL script #202601191540
UPDATE matricula.calendario_matricula
	SET data_fim_novos_alunos_nee='2025-11-27 00:00:00.000'
	WHERE id_calendario_matricula=83879888;
