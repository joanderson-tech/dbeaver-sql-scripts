BEGIN;

-- ==============================================================================
-- PASSO 1: Criar a tabela temporária mapeando o registro NOVO (com NULL)
-- com o valor da resposta vindo da matrícula ANTIGA
-- ==============================================================================
CREATE TEMP TABLE tmp_migracao_update AS
SELECT 
    rahr_novo.id_relatorio_avaliativo_habilidade_resposta AS id_rahr_novo,
    rahr_antigo.id_relatorio_avaliativo_habilidade_resposta AS id_rahr_antigo,
    rahr_antigo.id_opcao_grupo_avaliacao_relatorio AS nova_opcao_resposta,
    rahr_antigo.periodo
FROM ensino_infantil.relatorio_avaliativo ra_antigo
-- 1.1 Mapeia componentes e habilidades da matrícula ANTIGA (1357694)
JOIN ensino_infantil.relatorio_avaliativo_componente rac_antigo 
    ON rac_antigo.id_relatorio_avaliativo = ra_antigo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_antigo 
    ON mc_antigo.id_matricula_componente = rac_antigo.id_matricula_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_antigo 
    ON rah_antigo.id_relatorio_avaliativo_componente = rac_antigo.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_antigo 
    ON rahr_antigo.id_relatorio_avaliativo_habilidade = rah_antigo.id_relatorio_avaliativo_habilidade
-- 1.2 Mapeia componentes, habilidades e respostas da matrícula NOVA (1360912)
JOIN ensino_infantil.relatorio_avaliativo ra_novo 
    ON ra_novo.id_matricula_discente_serie = 1360912 AND ra_novo.ativo IS TRUE
JOIN ensino_infantil.relatorio_avaliativo_componente rac_novo 
    ON rac_novo.id_relatorio_avaliativo = ra_novo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_novo 
    ON mc_novo.id_matricula_componente = rac_novo.id_matricula_componente 
   AND mc_novo.id_componente_curricular = mc_antigo.id_componente_curricular
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_novo 
    ON rah_novo.id_relatorio_avaliativo_componente = rac_novo.id_relatorio_avaliativo_componente
   AND rah_novo.id_configuracao_relatorio_componente_habilidade = rah_antigo.id_configuracao_relatorio_componente_habilidade
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_novo 
    ON rahr_novo.id_relatorio_avaliativo_habilidade = rah_novo.id_relatorio_avaliativo_habilidade
   AND rahr_novo.periodo = rahr_antigo.periodo
WHERE ra_antigo.id_matricula_discente_serie = 1357694
  AND ra_antigo.ativo IS TRUE
  AND rahr_antigo.id_opcao_grupo_avaliacao_relatorio IS NOT NULL
  AND rahr_antigo.periodo IN (1, 2);


-- ==============================================================================
-- PASSO 2: Gerar String de Backup (Voltar o valor para NULL na matrícula nova)
-- ==============================================================================
SELECT 
    COUNT(t.id_rahr_novo) AS quantidade_registros, 
    'UPDATE ensino_infantil.relatorio_avaliativo_habilidade_resposta SET id_opcao_grupo_avaliacao_relatorio = NULL WHERE id_relatorio_avaliativo_habilidade_resposta IN (' 
    || string_agg(t.id_rahr_novo::TEXT, ', ') 
    || ');' AS backup_sql_reverter_update
FROM tmp_migracao_update t;


UPDATE ensino_infantil.relatorio_avaliativo_habilidade_resposta SET id_opcao_grupo_avaliacao_relatorio = NULL WHERE id_relatorio_avaliativo_habilidade_resposta IN (925553, 925554, 925557, 925558, 925561, 925562, 925565, 925566, 925569, 925570, 925573, 925574, 925577, 925578, 925581, 925582, 925585, 925586, 925589, 925590, 925593, 925594, 925597, 925598, 925601, 925602, 925605, 925606, 925609, 925610, 925613, 925614, 925617, 925618, 925621, 925622, 925625, 925626, 925629, 925630, 925633, 925634, 925637, 925638, 925641, 925642, 925645, 925646, 925649, 925650, 925653, 925654, 925657, 925658, 925662, 925661, 925666, 925665, 925670, 925669, 925673, 925674, 925677, 925678, 925681, 925682, 925685, 925686, 925689, 925690, 925693, 925694, 925697, 925698, 925701, 925702);


-- ==============================================================================
-- PASSO 3: Executar o UPDATE na matrícula NOVA
-- ==============================================================================
UPDATE ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr
SET id_opcao_grupo_avaliacao_relatorio = t.nova_opcao_resposta
FROM tmp_migracao_update t
WHERE rahr.id_relatorio_avaliativo_habilidade_resposta = t.id_rahr_novo;


-- ==============================================================================
-- PASSO 4: Deletar as respostas antigas da matrícula ANTIGA
-- ==============================================================================
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta
WHERE id_relatorio_avaliativo_habilidade_resposta IN (
    SELECT id_rahr_antigo FROM tmp_migracao_update
);


-- ==============================================================================
-- PASSO 5: Validação e Limpeza
-- ==============================================================================
-- Conferir o resultado final na matrícula NOVA (devem aparecer preenchidos sem duplicar):
SELECT 
    ra.id_matricula_discente_serie,
    rahr.id_relatorio_avaliativo_habilidade_resposta,
    rahr.id_relatorio_avaliativo_habilidade,
    rahr.id_opcao_grupo_avaliacao_relatorio,
    rahr.periodo
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac 
    ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah 
    ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr 
    ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_matricula_discente_serie = 1360912
  AND ra.ativo IS TRUE
ORDER BY rahr.id_relatorio_avaliativo_habilidade, rahr.periodo;

DROP TABLE tmp_migracao_update;

-- Se o resultado da consulta estiver correto:
-- COMMIT;

-- Se quiser desfazer:
 ROLLBACK;