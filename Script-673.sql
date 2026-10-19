-- ADICIONANDO  AS NOVAS HABILIDADE CMPEX01 - O EU, O OUTRO E O NÓS
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO  '%(EI03EO07)%' ORDER BY hc.data_cadastro asc LIMIT 1
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 17 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 4 AND crc.id_componente_curricular = 506
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

-- Atualizando  AS HABILIDADES CMPEX01 - O EU, O OUTRO E O NÓS
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869985
	WHERE id_configuracao_relatorio_componente_habilidade=87;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869986
	WHERE id_configuracao_relatorio_componente_habilidade=88;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869987
	WHERE id_configuracao_relatorio_componente_habilidade=89;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869988
	WHERE id_configuracao_relatorio_componente_habilidade=90;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869989
	WHERE id_configuracao_relatorio_componente_habilidade=91;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869991
	WHERE id_configuracao_relatorio_componente_habilidade=92;


-- Atualizando  AS HABILIDADES CMPEX02 - CORPO, GESTOS E MOVIMENTOS

UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=426
	WHERE id_configuracao_relatorio_componente_habilidade=93;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=427
	WHERE id_configuracao_relatorio_componente_habilidade=94;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=428
	WHERE id_configuracao_relatorio_componente_habilidade=95;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=429
	WHERE id_configuracao_relatorio_componente_habilidade=96;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=430
	WHERE id_configuracao_relatorio_componente_habilidade=97;

-- Atualizando  AS HABILIDADES CMPEX03 - TRAÇOS, SONS, CORES E FORMAS

UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869992
	WHERE id_configuracao_relatorio_componente_habilidade=99;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869993
	WHERE id_configuracao_relatorio_componente_habilidade=100;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869994
	WHERE id_configuracao_relatorio_componente_habilidade=101;


-- ADICIONANDO  AS NOVAS HABILIDADE CMPEX04 - ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO  '%(EI03EF09)%' ORDER BY hc.data_cadastro asc LIMIT 1
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 20 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 4 AND crc.id_componente_curricular = 509
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


-- Atualizando  AS HABILIDADES CMPEX04 - ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869976
	WHERE id_configuracao_relatorio_componente_habilidade=102;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869977
	WHERE id_configuracao_relatorio_componente_habilidade=103;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869978
	WHERE id_configuracao_relatorio_componente_habilidade=104;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869979
	WHERE id_configuracao_relatorio_componente_habilidade=105;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869980
	WHERE id_configuracao_relatorio_componente_habilidade=106;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869981
	WHERE id_configuracao_relatorio_componente_habilidade=107;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869982
	WHERE id_configuracao_relatorio_componente_habilidade=108;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869983
	WHERE id_configuracao_relatorio_componente_habilidade=109;


-- Atualizando  AS HABILIDADES CMPEX05 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869968
	WHERE id_configuracao_relatorio_componente_habilidade=110;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869969
	WHERE id_configuracao_relatorio_componente_habilidade=111;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869970
	WHERE id_configuracao_relatorio_componente_habilidade=112;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869971
	WHERE id_configuracao_relatorio_componente_habilidade=113;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869972
	WHERE id_configuracao_relatorio_componente_habilidade=114;
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade
	SET id_habilidade_competencia=51869973
	WHERE id_configuracao_relatorio_componente_habilidade=115;

-- ADICIONANDO  AS NOVAS HABILIDADE CMPEX05 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO  '%(EI03ET07|EI03ET08)%' ORDER BY hc.data_cadastro asc LIMIT 2
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 21 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 4 AND crc.id_componente_curricular = 510
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
