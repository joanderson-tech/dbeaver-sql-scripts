SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_configuracao_relatorio IN (2, 7, 8, 9, 42, 48, 49);


SELECT rac.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON 
rac.id_configuracao_relatorio_componente  = crc.id_configuracao_relatorio_componente 
WHERE crc.id_configuracao_relatorio IN (2, 7, 8, 9, 42, 48, 49);

SELECT *
FROM ensino_infantil.relatorio_avaliativo ra 
WHERE ra.id_configuracao_relatorio IN  (2, 7, 8, 9, 42, 48, 49);

id_configuracao_relatorio

relatorio_avaliativo_componente


BEGIN;


ROLLBACK;

CREATE TEMP TABLE tmp_dados_configuracao_relatorio_componente AS
SELECT *
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (2, 7, 8, 9, 42, 48, 49);



-- PASSO 2: Projetar os comandos de INSERT
SELECT 
    'INSERT INTO ensino_infantil.configuracao_relatorio_componente (' ||
    'id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, ' ||
    'id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, ' ||
    'id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) ' ||
    'VALUES (' ||
        COALESCE(id_configuracao_relatorio_componente::text, 'NULL') || ', ' ||
        COALESCE(id_configuracao_relatorio::text, 'NULL') || ', ' ||
        COALESCE(id_componente_curricular::text, 'NULL') || ', ' ||
        COALESCE(id_tipo_avaliacao_componente_relatorio::text, 'NULL') || ', ' ||
        COALESCE(maximo_caracteres_relatorio::text, 'NULL') || ', ' ||
        COALESCE(ativo::text, 'NULL') || ', ' ||
        COALESCE(id_registro_cadastro::text, 'NULL') || ', ' ||
        COALESCE(id_registro_atualizacao::text, 'NULL') || ', ' ||
        -- Tratamento especial para datas (precisam de aspas se não forem nulas)
        CASE WHEN data_cadastro IS NULL THEN 'NULL' ELSE '''' || data_cadastro || '''' END || ', ' ||
        CASE WHEN data_alteracao IS NULL THEN 'NULL' ELSE '''' || data_alteracao || '''' END || ', ' ||
        COALESCE(possui_parecer_final_fixo::text, 'NULL') || ', ' ||
        COALESCE(possui_parecer_final_descritivo::text, 'NULL') || 
    ');' AS comando_insert
FROM tmp_dados_configuracao_relatorio_componente;

-- Gerando os comandos de DELETE baseados na tabela temporária
DELETE
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio_componente IN (SELECT DISTINCT id_configuracao_relatorio_componente
FROM tmp_dados_configuracao_relatorio_componente);


-- PASSO 1: Criar a tabela temporária com os dados das habilidades
CREATE TEMP TABLE tmp_backup_habilidades AS
SELECT crch.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch 
  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE crc.id_configuracao_relatorio IN (2, 7, 8, 9, 42, 48, 49);

-- PASSO 2: Projetar os comandos de INSERT
SELECT 
    'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (' ||
    'id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, ' ||
    'id_habilidade_competencia, ativo) ' ||
    'VALUES (' ||
        COALESCE(id_configuracao_relatorio_componente_habilidade::text, 'NULL') || ', ' ||
        COALESCE(id_configuracao_relatorio_componente::text, 'NULL') || ', ' ||
        COALESCE(id_habilidade_competencia::text, 'NULL') || ', ' ||
        COALESCE(ativo::text, 'NULL') || 
    ');' AS backup_insert
FROM tmp_backup_habilidades;


DELETE
FROM ensino_infantil.configuracao_relatorio_componente_habilidade
WHERE id_configuracao_relatorio_componente_habilidade IN (SELECT DISTINCT id_configuracao_relatorio_componente_habilidade
FROM tmp_backup_habilidades);


ROLLBACK;




SELECT * FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta rah 

SELECT rahr.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_configuracao_relatorio_componente_habilidade  = crch.id_configuracao_relatorio_componente_habilidade 
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
WHERE crc.id_configuracao_relatorio IN (2, 7, 8, 9, 42, 48, 49);







INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES (8001, 2001, NULL, 1);

INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (2001, 431, 35);

INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (35, 6, 465, true);

INSERT INTO ensino_infantil.configuracao_relatorio (id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo) VALUES (2, 35497185, 4, 6, true, 'AI1', 5622554, 5622575, '2025-09-12 15:15:25.836', '2025-09-29 10:10:15', true);

INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, parecer_final_fixo, parecer_final_descritivo) VALUES (431, 48, 17004798, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO ensino_infantil.relatorio_avaliativo (id_relatorio_avaliativo, id_configuracao_relatorio, id_matricula_discente_serie, id_situacao_relatorio_avaliativo, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, id_parecer_descritivo_individual, situacao, justificativa_situacao) VALUES (48, 2, 1319932, 1, true, 5624757, NULL, '2026-03-02 16:06:02.032', NULL, 39, 0, NULL);

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES (6, 2, 222, 2, NULL, true, 5622554, NULL, '2025-09-12 15:15:25.835', NULL, false, false);