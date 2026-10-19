SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (25) --  respectivamente: EF1A, EF2A, EF3A
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 25;
		--crc.id_configuracao_relatorio = 17,
		--crc.id_configuracao_relatorio = 18,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade;