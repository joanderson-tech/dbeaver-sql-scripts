BEGIN;

--SOLUÇÃO
UPDATE basico.curriculo_basico 	SET tipo_diario_diversificado=31	WHERE id_curriculo_basico IN (51896095, 51886491, 51880997, 51886498, 51880990, 51881004, 51881011);

UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 51896712 WHERE id_matricula_discente_serie IN (1320065, 1320064, 1317355, 1317356, 1320066, 1317410, 1317411, 1317415, 1317362, 1319975, 1319890, 1319889, 1319887, 1319888);
UPDATE basico.turma_serie SET id_curriculo_medio = 51896712 WHERE id_turma_serie IN (51896181, 51896571);


-- PASSO 1: Criar a tabela temporária com os dados das habilidades
CREATE TEMP TABLE tmp_backup_habilidades AS
SELECT crch.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch 
  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE crc.id_configuracao_relatorio IN (45,46,52,53,43,44, 47);

-- BAKUP PASSO 1
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

--SOLUÇÃO DIRETA 
DELETE
FROM ensino_infantil.configuracao_relatorio_componente_habilidade
WHERE id_configuracao_relatorio_componente_habilidade IN (SELECT DISTINCT id_configuracao_relatorio_componente_habilidade
FROM tmp_backup_habilidades);

---########################################

-- PASSO 2: Criar a tabela temporária
CREATE TEMP TABLE tmp_dados_configuracao_relatorio_componente AS
SELECT *
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (45,46,52,53,43,44, 47);

-- BAKUP PASSO 2
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

--SOLUÇÃO DIRETA 
DELETE
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio_componente IN (SELECT DISTINCT id_configuracao_relatorio_componente
FROM tmp_dados_configuracao_relatorio_componente);


---########################################
-- PASSO 3: Criar a tabela temporária com as configurações principais
CREATE TEMP TABLE tmp_backup_config_mae AS
SELECT *
FROM ensino_infantil.configuracao_relatorio
WHERE id_configuracao_relatorio IN (45,46,52,53,43,44, 47);

--- BAKUP PASSO 3
SELECT 
    'INSERT INTO ensino_infantil.configuracao_relatorio (' ||
    'id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, ' ||
    'id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, ' ||
    'id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo) ' ||
    'VALUES (' ||
        COALESCE(id_configuracao_relatorio::text, 'NULL') || ', ' ||
        COALESCE(id_curriculo_basico::text, 'NULL') || ', ' ||
        COALESCE(id_periodicidade_relatorio::text, 'NULL') || ', ' ||
        COALESCE(id_grupo_avaliacao_relatorio::text, 'NULL') || ', ' ||
        COALESCE(ativo::text, 'NULL') || ', ' ||
        CASE WHEN codigo IS NULL THEN 'NULL' ELSE '''' || codigo || '''' END || ', ' ||
        COALESCE(id_registro_cadastro::text, 'NULL') || ', ' ||
        COALESCE(id_registro_atualizacao::text, 'NULL') || ', ' ||
        CASE WHEN data_cadastro IS NULL THEN 'NULL' ELSE '''' || data_cadastro::text || '''' END || ', ' ||
        CASE WHEN data_alteracao IS NULL THEN 'NULL' ELSE '''' || data_alteracao::text || '''' END || ', ' ||
        COALESCE(possui_parecer_descritivo::text, 'NULL') || 
    ');' AS sql_insert
FROM tmp_backup_config_mae;

--SOLUÇÃO DIRETA 
DELETE FROM ensino_infantil.configuracao_relatorio WHERE id_configuracao_relatorio 
IN (SELECT DISTINCT id_configuracao_relatorio
FROM tmp_backup_config_mae);

COMMIT;