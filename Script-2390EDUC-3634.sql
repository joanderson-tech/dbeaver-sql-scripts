UPDATE ensino_infantil.configuracao_relatorio 	SET codigo='EFTIN0426'	WHERE id_configuracao_relatorio=42;

SELECT 
'UPDATE ensino_infantil.configuracao_relatorio_componente SET maximo_caracteres_relatorio = NULL, id_tipo_avaliacao_componente_relatorio = 2 WHERE id_configuracao_relatorio_componente = ' || crc.id_configuracao_relatorio_componente || ';' AS solucao, 
'UPDATE ensino_infantil.configuracao_relatorio_componente SET maximo_caracteres_relatorio = ' || COALESCE(crc.maximo_caracteres_relatorio::text, 'NULL') || ', id_tipo_avaliacao_componente_relatorio = ' || crc.id_tipo_avaliacao_componente_relatorio || ' WHERE id_configuracao_relatorio_componente = ' || crc.id_configuracao_relatorio_componente || ';' AS backup
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio = 42;


-- 229 Arte
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.id_habilidade_competencia IN (51870076, 51870077, 51870078, 51870079, 51870080, 51870081, 51870082, 51870083, 51870084, 51870085, 51870086, 51870087, 51870088, 51870089, 51870090, 51870091, 51870092, 51870093, 51870094, 51870095, 51870096, 51870097, 51870098, 51870099, 51870100, 51870101)
	ORDER BY hc.data_cadastro asc LIMIT 26
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 346 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 229
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;


-- 223 CIENCIAS
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.id_habilidade_competencia 
	IN (478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488)
	ORDER BY hc.data_cadastro asc LIMIT 11
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	344 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 223
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;



-- 238 ED. FÍSICA
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.id_habilidade_competencia 
	IN (51870114, 51870115, 51870116, 51870118, 51870119, 51870120, 51870121, 51870122, 51870123, 51870124, 51870126, 51870127, 51870128)
	ORDER BY hc.data_cadastro asc LIMIT 13
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	342 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 238
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;


-- 230 ENSINO RELIGIOSO
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.id_habilidade_competencia 
	IN (513, 514, 515, 516, 517, 518, 519)
	ORDER BY hc.data_cadastro asc LIMIT 7
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	341 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 230
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;


-- 225 Geografia
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE 
	AND hc.id_habilidade_competencia IN (500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510)
	ORDER BY hc.data_cadastro asc LIMIT 11
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	343 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 225
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;


-- 224 História
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE 
	AND hc.id_habilidade_competencia IN (489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499)
	ORDER BY hc.data_cadastro asc LIMIT 11
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	345 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 224
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;



CREATE TEMP TABLE backup_habilidade_competencia AS
SELECT * FROM ensino_infantil.habilidade_competencia WHERE false;

-- Inserções na tabela temporaria
INSERT INTO backup_habilidade_competencia (id_habilidade_competencia, descricao, ativo, data_cadastro, habilitado_para_conteudo_ministrado, prioridade_ordenacao) VALUES
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP03) Localizar palavras no dicionário para esclarecer significados, reconhecendo o significado mais plausível para o contexto que deu origem à consulta.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP04) Usar acento gráfico (agudo ou circunflexo) em paroxítonas terminadas em -i(s), -l, -r, -ão(s).', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP05) Identificar a função na leitura e usar, adequadamente, na escrita ponto final, de interrogação, de exclamação, dois pontos e travessão em diálogos (discurso direto), vírgula em enumerações e em separação de vocativo e de aposto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP07) Identificar em textos e usar na produção textual a concordância entre artigo, substantivo e adjetivo (concordância no grupo nominal).', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP09) Ler e compreender, com autonomia, boletos, faturas e carnês, dentre outros gêneros do campo da vida cotidiana, de acordo com as convenções do gênero (campos, itens elencados, medidas de consumo, código de barras) e considerando a situação comunicativa e a finalidade do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP10) Ler e compreender, com autonomia, cartas pessoais de reclamação, dentre outros gêneros do campo da vida cotidiana, de acordo com as convenções do gênero carta e considerando a situação comunicativa e o tema/assunto/finalidade do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP11) Planejar e produzir, com autonomia, cartas pessoais de reclamação, dentre outros gêneros do campo da vida cotidiana, de acordo com as convenções do gênero carta e com a estrutura própria desses textos (problema, opinião, argumentos), considerando a situação comunicativa e o tema/assunto/finalidade do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP12) Assistir, em vídeo digital, a programa infantil com instruções de montagem, de jogos e brincadeiras e, a partir dele, planejar e produzir tutoriais em áudio ou vídeo.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP13) Identificar e reproduzir, em textos injuntivos instrucionais (instruções de jogos digitais ou impressos), a formatação própria desses textos (verbos imperativos, indicação de passos a ser seguidos) e formato específico dos textos orais ou escritos desses gêneros (lista/apresentação de materiais e instruções/passos de jogo).', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP14) Identificar, em notícias, fatos, participantes, local e momento/tempo da ocorrência do fato noticiado.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP15) Distinguir fatos de opiniões/sugestões em textos (informativos, jornalísticos, publicitários, etc.).', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP16) Produzir notícias sobre fatos ocorridos no universo escolar, digitais ou impressas, para o jornal da escola, noticiando os fatos e seus atores e comentando decorrências, de acordo com as convenções do gênero notícia e considerando a situação comunicativa e o tema/assunto do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP18) Analisar o padrão entonacional e a expressão facial e corporal de âncoras de jornais radiofônicos ou televisivos e de entrevistadores/entrevistados.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP19) Ler e compreender textos expositivos de divulgação científica para crianças, considerando a situação comunicativa e o tema/assunto do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP20) Reconhecer a função de gráficos, diagramas e tabelas em textos, como forma de apresentação de dados.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP22) Planejar e produzir, com certa autonomia, verbetes de enciclopédia infantil, digitais ou impressos, considerando a situação comunicativa e o tema/assunto/finalidade do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP23) Identificar e reproduzir, em verbetes de enciclopédia infantil, digitais ou impressos, a formatação e diagramação específica desse gênero (título do verbete, definição, detalhamento, curiosidades), considerando a situação comunicativa e o tema/assunto/finalidade do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP24) Identificar e reproduzir, em seu formato, tabelas, diagramas e gráficos em relatórios de observação e pesquisa, como forma de apresentação de dados.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP25) Planejar e produzir, com certa autonomia, verbetes de dicionário, digitais ou impressos, considerando a situação comunicativa e o tema/assunto/finalidade do texto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04LP27) Identificar, em textos dramáticos, marcadores das falas das personagens e de cena.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP12) Recorrer ao dicionário para esclarecer dúvida sobre a escrita de palavras, especialmente no caso de palavras com relações irregulares fonema-grafema.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP14) Identificar em textos e usar na produção textual pronomes pessoais, possessivos e demonstrativos, como recurso coesivo anafórico.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP16) Identificar e reproduzir, em notícias, manchetes, lides e corpo de notícias simples para público infantil e cartas de reclamação (revista infantil), digitais ou impressos, a formatação e diagramação específica de cada um desses gêneros, inclusive em suas versões orais.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP18) Escutar, com atenção, apresentações de trabalhos realizados por colegas, formulando perguntas pertinentes ao tema e solicitando esclarecimentos sempre que necessário.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP19) Recuperar as ideias principais em situações formais de escuta de exposições, apresentações e palestras.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP20) Expor trabalhos ou pesquisas escolares, em sala de aula, com apoio de recursos multissemióticos (imagens, diagrama, tabelas etc.), orientando-se por roteiro escrito, planejando o tempo de fala e adequando a linguagem à situação comunicativa.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP21) Ler e compreender, de forma autônoma, textos literários de diferentes gêneros e extensões, inclusive aqueles sem ilustrações, estabelecendo preferências por gêneros, temas, autores.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP22) Perceber diálogos em textos narrativos, observando o efeito de sentido de verbos de enunciação e, se for o caso, o uso de variedades linguísticas no discurso direto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP26) Ler e compreender, com certa autonomia, narrativas ficcionais que apresentem cenários e personagens, observando os elementos da estrutura narrativa: enredo, tempo, espaço, personagens, narrador e a construção do discurso indireto e discurso direto.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP29) Identificar, em narrativas, cenário, personagem central, conflito gerador, resolução e o ponto de vista com base no qual histórias são narradas, diferenciando narrativas em primeira e terceira pessoas.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF35LP25) Criar narrativas ficcionais, com certa autonomia, utilizando detalhes descritivos, sequências de eventos e imagens apropriadas para sustentar o sentido do texto, e marcadores de tempo, espaço e de fala de personagens.', true, NOW(), false, NULL);

--backup 
SELECT 'DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia IN (' || STRING_AGG(id_habilidade_competencia::text, ', ') || ');' AS backup
FROM backup_habilidade_competencia;

--Solução
INSERT INTO ensino_infantil.habilidade_competencia
SELECT * FROM backup_habilidade_competencia;

-- 221 LÍNGUA PORTUGUESA
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO '%(EF15LPO3|EF35LP05|EF35LP04|EF35LP01|EF15LP19|EF35LP21|EF35LP02|EF35LP22|EF35LP03|EF35LP26|EF15LP09|EF15LP12|EF35LP12|EF04LP01|EF04LP02|EF35LP13|EF04LP03|EF15LP10|EF15LP11|EF35LP10|EF04LP10|EF35LP06|EF04LP11|EF04LP15|EF04LP16|EF04LP19|EF04LP20|EF04LP21|EF15LP05|EF04LP04|EF04LP05|EF04LP06|EF35LP11|EF35LP18|EF15LP01|EF15LP02|EF15LP03|EF15LP04|EF15LP06|EF04LP12|EF15LP13|EF04LP13|EF04LP17|EF04LP22|EF04LP23|EF04LP24|EF35LP19|EF04LP26|EF15LP17|EF04LP07|EF04LP08|EF35LP14|EF04LP09|EF15LP07|EF15LP14|EF04LP14|EF35LP16|EF04LP18|EF35LP29|EF04LP25|EF35LP20|EF15LP15|EF15LP18|EF35LP25|EF04LP27)%'
	ORDER BY hc.data_cadastro asc LIMIT 65
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	348 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 221
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;


--Solução
INSERT INTO ensino_infantil.habilidade_competencia (id_habilidade_competencia, descricao, ativo, data_cadastro, habilitado_para_conteudo_ministrado, prioridade_ordenacao) VALUES
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04MA02) Mostrar, por decomposição e composição, que todo número natural pode ser escrito por meio de adições e multiplicações por potências de dez, para compreender o sistema de numeração decimal e desenvolver estratégias de cálculo.', true, NOW(), false, NULL),
(nextval('ensino_infantil.habilidade_competencia_seq'), '(EF04MA15) Determinar o número desconhecido que torna verdadeira uma igualdade que envolve as operações fundamentais com números naturais.', true, NOW(), false, NULL);

--backup
SELECT 'DELETE FROM ensino_infantil.habilidade_competencia WHERE id_habilidade_competencia = '|| id_habilidade_competencia||';' 
 FROM ensino_infantil.habilidade_competencia hc
WHERE hc.ativo = true
  AND hc.descricao SIMILAR TO '%(EF04MA02|EF04MA15)%'
ORDER BY hc.descricao ASC;

-- 221 MATEMÁTICA
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO '%(EF04MA01|EF04MA02|EF04MA03|EF04MA04|EF04MA05|EF04MA06|EF04MA13|EF04MA14|EF04MA15|EF04MA16|EF04MA26|EF04MA11|EF04MA12|EF04MA20|EF04MA21|EF04MA07|EF04MA17|EF04MA22|EF04MA27|EF04MA08|EF04MA09|EF04MA10|EF04MA18|EF04MA19|EF04MA25|EF04MA28)%'
	ORDER BY hc.data_cadastro asc LIMIT 26
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
	347 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 42 AND crc.id_componente_curricular = 222
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;

