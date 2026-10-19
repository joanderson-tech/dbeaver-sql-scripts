BEGIN;

ROLLBACK;

---########################################
-- PASSO 1: Criar a tabela temporária para as respostas das habilidades
--CREATE TEMP TABLE tmp_backup_respostas_habilidade AS
SELECT rahr.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch 
    ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah 
    ON rah.id_configuracao_relatorio_componente_habilidade = crch.id_configuracao_relatorio_componente_habilidade 
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr 
    ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
WHERE crc.id_configuracao_relatorio IN (45,46,52,53,43,44);

-- BAKUP PASSO 1
SELECT 
    'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (' ||
    'id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, ' ||
    'id_opcao_grupo_avaliacao_relatorio, periodo) ' ||
    'VALUES (' ||
        COALESCE(id_relatorio_avaliativo_habilidade_resposta::text, 'NULL') || ', ' ||
        COALESCE(id_relatorio_avaliativo_habilidade::text, 'NULL') || ', ' ||
        COALESCE(id_opcao_grupo_avaliacao_relatorio::text, 'NULL') || ', ' ||
        COALESCE(periodo::text, 'NULL') || 
    ');' AS sql_insert
FROM tmp_backup_respostas_habilidade;

--SOLUÇÃO DIRETA 
DELETE
FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta
WHERE id_relatorio_avaliativo_habilidade_resposta IN (SELECT DISTINCT id_relatorio_avaliativo_habilidade_resposta
FROM tmp_backup_respostas_habilidade);

---########################################
-- PASSO 2: Criar a tabela temporária para as avaliações de habilidade
--CREATE TEMP TABLE tmp_backup_relatorio_habilidade AS
SELECT rah.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_configuracao_relatorio_componente_habilidade = crch.id_configuracao_relatorio_componente_habilidade 
WHERE crc.id_configuracao_relatorio IN (45,46,52,53,43,44);

-- BAKUP PASSO 2
SELECT 
    'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (' ||
    'id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, ' ||
    'id_configuracao_relatorio_componente_habilidade) ' ||
    'VALUES (' ||
        COALESCE(id_relatorio_avaliativo_habilidade::text, 'NULL') || ', ' ||
        COALESCE(id_relatorio_avaliativo_componente::text, 'NULL') || ', ' ||
        COALESCE(id_configuracao_relatorio_componente_habilidade::text, 'NULL') || 
    ');' AS sql_insert
FROM tmp_backup_relatorio_habilidade;

--SOLUÇÃO DIRETA 
DELETE
FROM ensino_infantil.relatorio_avaliativo_habilidade
WHERE id_relatorio_avaliativo_habilidade IN (SELECT DISTINCT id_relatorio_avaliativo_habilidade
FROM tmp_backup_relatorio_habilidade);

---########################################
--ok
-- PASSO 3: Criar a tabela temporária com os dados das habilidades
CREATE TEMP TABLE tmp_backup_habilidades AS
SELECT crch.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch 
  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE crc.id_configuracao_relatorio IN (45,46,52,53,43,44);

-- BAKUP PASSO 3
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
-- PASSO 4: Criar a tabela temporária
--CREATE TEMP TABLE tmp_backup_rac AS
SELECT rac.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON 
rac.id_configuracao_relatorio_componente  = crc.id_configuracao_relatorio_componente 
WHERE crc.id_configuracao_relatorio IN (45,46,52,53,43,44);

-- BAKUP PASSO 4
SELECT 
    'INSERT INTO ensino_infantil.relatorio_avaliativo_componente (' ||
    'id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, ' ||
    'id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, ' ||
    'id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, ' ||
    'avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, ' ||
    'parecer_final_fixo, parecer_final_descritivo) ' ||
    'VALUES (' ||
        COALESCE(id_relatorio_avaliativo_componente::text, 'NULL') || ', ' ||
        COALESCE(id_relatorio_avaliativo::text, 'NULL') || ', ' ||
        COALESCE(id_matricula_componente::text, 'NULL') || ', ' ||
        COALESCE(id_configuracao_relatorio_componente::text, 'NULL') || ', ' ||
        -- Campos de Texto (Avaliações Descritivas)
        CASE WHEN avaliacao_descritiva IS NULL THEN 'NULL' ELSE '''' || REPLACE(avaliacao_descritiva, '''', '''''') || '''' END || ', ' ||
        COALESCE(id_situacao_relatorio_avaliativo_componente::text, 'NULL') || ', ' ||
        COALESCE(id_registro_cadastro::text, 'NULL') || ', ' ||
        COALESCE(id_registro_atualizacao::text, 'NULL') || ', ' ||
        -- Datas
        CASE WHEN data_cadastro IS NULL THEN 'NULL' ELSE '''' || data_cadastro || '''' END || ', ' ||
        CASE WHEN data_alteracao IS NULL THEN 'NULL' ELSE '''' || data_alteracao || '''' END || ', ' ||
        -- Campos Descritivos Adicionais
        CASE WHEN avaliacao_descritiva_2 IS NULL THEN 'NULL' ELSE '''' || REPLACE(avaliacao_descritiva_2, '''', '''''') || '''' END || ', ' ||
        CASE WHEN avaliacao_descritiva_3 IS NULL THEN 'NULL' ELSE '''' || REPLACE(avaliacao_descritiva_3, '''', '''''') || '''' END || ', ' ||
        CASE WHEN avaliacao_descritiva_4 IS NULL THEN 'NULL' ELSE '''' || REPLACE(avaliacao_descritiva_4, '''', '''''') || '''' END || ', ' ||
        -- Pareceres
        COALESCE(parecer_final_fixo::text, 'NULL') || ', ' ||
        CASE WHEN parecer_final_descritivo IS NULL THEN 'NULL' ELSE '''' || REPLACE(parecer_final_descritivo, '''', '''''') || '''' END || 
    ');' AS sql_insert
FROM tmp_backup_rac;

--SOLUÇÃO DIRETA 
DELETE
FROM ensino_infantil.relatorio_avaliativo_componente
WHERE id_relatorio_avaliativo_componente IN (SELECT DISTINCT id_relatorio_avaliativo_componente
FROM tmp_backup_rac);


---########################################
--ok
-- PASSO 5: Criar a tabela temporária
CREATE TEMP TABLE tmp_dados_configuracao_relatorio_componente AS
SELECT *
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (45,46,52,53,43,44);

-- BAKUP PASSO 5
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
-- PASSO 6: Criar a tabela temporária para os relatórios avaliativos
--CREATE TEMP TABLE tmp_backup_relatorio_avaliativo AS
SELECT *
FROM ensino_infantil.relatorio_avaliativo
WHERE id_configuracao_relatorio IN (45,46,52,53,43,44);

SELECT * FROM tmp_backup_relatorio_avaliativo;

-- BAKUP PASSO 6
SELECT 
    'INSERT INTO ensino_infantil.relatorio_avaliativo (' ||
    'id_relatorio_avaliativo, id_configuracao_relatorio, id_matricula_discente_serie, ' ||
    'id_situacao_relatorio_avaliativo, ativo, id_registro_cadastro, id_registro_atualizacao, ' ||
    'data_cadastro, data_alteracao, id_parecer_descritivo_individual, situacao, justificativa_situacao) ' ||
    'VALUES (' ||
        COALESCE(id_relatorio_avaliativo::text, 'NULL') || ', ' ||
        COALESCE(id_configuracao_relatorio::text, 'NULL') || ', ' ||
        COALESCE(id_matricula_discente_serie::text, 'NULL') || ', ' ||
        COALESCE(id_situacao_relatorio_avaliativo::text, 'NULL') || ', ' ||
        COALESCE(ativo::text, 'NULL') || ', ' ||
        COALESCE(id_registro_cadastro::text, 'NULL') || ', ' ||
        COALESCE(id_registro_atualizacao::text, 'NULL') || ', ' ||
        -- Datas (com aspas se existirem)
        CASE WHEN data_cadastro IS NULL THEN 'NULL' ELSE '''' || data_cadastro::text || '''' END || ', ' ||
        CASE WHEN data_alteracao IS NULL THEN 'NULL' ELSE '''' || data_alteracao::text || '''' END || ', ' ||
        COALESCE(id_parecer_descritivo_individual::text, 'NULL') || ', ' ||
        COALESCE(situacao::text, 'NULL') || ', ' ||
        -- Justificativa (Texto)
        CASE WHEN justificativa_situacao IS NULL THEN 'NULL' ELSE '''' || REPLACE(justificativa_situacao, '''', '''''') || '''' END || 
    ');' AS sql_insert
FROM tmp_backup_relatorio_avaliativo;

--SOLUÇÃO DIRETA 
DELETE
FROM ensino_infantil.relatorio_avaliativo
WHERE id_relatorio_avaliativo
IN (SELECT DISTINCT id_relatorio_avaliativo
FROM tmp_backup_relatorio_avaliativo);


---########################################
--ok
-- PASSO 7: Criar a tabela temporária com as configurações principais
CREATE TEMP TABLE tmp_backup_config_mae AS
SELECT *
FROM ensino_infantil.configuracao_relatorio
WHERE id_configuracao_relatorio IN (45,46,52,53,43,44);

--- BAKUP PASSO 7
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


