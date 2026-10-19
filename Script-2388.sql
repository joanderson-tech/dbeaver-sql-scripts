BEGIN;

WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia 
	FROM ensino_infantil.habilidade_competencia hc 
	WHERE hc.ativo = TRUE 
	  AND hc.id_habilidade_competencia IN (51870076, 51870077, 51870078, 51870079, 51870080, 51870081, 51870082, 51870083, 51870084, 51870085, 51870086, 51870087, 51870088, 51870089, 51870090, 51870091, 51870092, 51870093, 51870094, 51870095, 51870096, 51870097, 51870098, 51870099, 51870100, 51870101)
	ORDER BY hc.data_cadastro ASC 
	LIMIT 26
), 
-- 1. INSERÇÃO REAL NA TABELA DE CONFIGURAÇÃO
insere_configuracao AS (
	INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
	SELECT 
		nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 
		346, 
		hcn.id_habilidade_competencia, 
		TRUE 
	FROM habilidades_competencia_novas hcn
	ORDER BY hcn.id_habilidade_competencia
	RETURNING id_configuracao_relatorio_componente_habilidade -- Retorna os IDs gerados para usar no backup e na próxima tabela
), 
relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente 
	FROM ensino_infantil.relatorio_avaliativo ra 
	JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
	WHERE ra.ativo = TRUE 
	  AND crc.id_configuracao_relatorio = 42 
	  AND crc.id_componente_curricular = 229
), 
-- 2. INSERÇÃO REAL NA TABELA DE RELATÓRIO AVALIATIVO
insere_relatorio AS (
	INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade)
	SELECT 
		nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq'), 
		rac.id_relatorio_avaliativo_componente, 
		iconf.id_configuracao_relatorio_componente_habilidade 
	FROM relatorio_avaliativo_componente rac, insere_configuracao iconf
	ORDER BY rac.id_relatorio_avaliativo_componente, iconf.id_configuracao_relatorio_componente_habilidade
	RETURNING id_relatorio_avaliativo_habilidade -- Retorna os IDs gerados para a próxima inserção e backup
), 
-- 3. INSERÇÃO REAL NA TABELA DE RESPOSTAS (GERANDO OS 4 PERÍODOS CO CROSS JOIN)
insere_resposta AS (
	INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo)
	SELECT 
		nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq'), 
		irel.id_relatorio_avaliativo_habilidade, 
		gs.periodo 
	FROM insere_relatorio irel 
	CROSS JOIN generate_series(1, 4) AS gs(periodo) 
	ORDER BY irel.id_relatorio_avaliativo_habilidade, gs.periodo
	RETURNING id_relatorio_avaliativo_habilidade_resposta
),
-- --- CRIAÇÃO DOS SCRIPTS DE BACKUP (APENAS DELETES) ---
backup_configuracao AS (
    SELECT 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || id_configuracao_relatorio_componente_habilidade || ';' AS script_backup 
    FROM insere_configuracao
),
backup_relatorio AS (
    SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || id_relatorio_avaliativo_habilidade || ';' AS script_backup 
    FROM insere_relatorio
),
backup_resposta AS (
    SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || id_relatorio_avaliativo_habilidade_resposta || ';' AS script_backup 
    FROM insere_resposta
)
-- REUNINDO TODOS OS DELETES PARA EXIBIR NA TELA
SELECT script_backup FROM backup_configuracao
UNION ALL 
SELECT script_backup FROM backup_relatorio
UNION ALL 
SELECT script_backup FROM backup_resposta;

