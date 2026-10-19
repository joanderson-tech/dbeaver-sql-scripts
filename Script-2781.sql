BEGIN;
]

ROLLBACK;
-- ==============================================================================
-- PASSO 1: Criar mapeamento de componentes (Antigo -> Novo)
-- ==============================================================================
CREATE TEMP TABLE tmp_map_componentes AS
SELECT 
    rac_antigo.id_relatorio_avaliativo_componente AS id_rac_antigo,
    rac_novo.id_relatorio_avaliativo_componente AS id_rac_novo,
    mc_antigo.id_componente_curricular
FROM ensino_infantil.relatorio_avaliativo ra_antigo
JOIN ensino_infantil.relatorio_avaliativo_componente rac_antigo 
    ON rac_antigo.id_relatorio_avaliativo = ra_antigo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_antigo 
    ON mc_antigo.id_matricula_componente = rac_antigo.id_matricula_componente
-- Junta com a matrícula nova pelo mesmo componente curricular
JOIN ensino_infantil.relatorio_avaliativo ra_novo 
    ON ra_novo.id_matricula_discente_serie = 1360912 AND ra_novo.ativo IS TRUE
JOIN ensino_infantil.relatorio_avaliativo_componente rac_novo 
    ON rac_novo.id_relatorio_avaliativo = ra_novo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_novo 
    ON mc_novo.id_matricula_componente = rac_novo.id_matricula_componente 
   AND mc_novo.id_componente_curricular = mc_antigo.id_componente_curricular
WHERE ra_antigo.id_matricula_discente_serie = 1357694
  AND ra_antigo.ativo IS TRUE;


-- ==============================================================================
-- PASSO 2: Mapear Habilidades e gerar novos IDs de forma explícita
-- ==============================================================================
CREATE TEMP TABLE tmp_novas_habilidades AS
SELECT 
    rah_antigo.id_relatorio_avaliativo_habilidade AS id_rah_antigo,
    -- Sequence da tabela de habilidades
    nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') AS id_rah_novo, 
    map_c.id_rac_novo,
    rah_antigo.id_configuracao_relatorio_componente_habilidade
FROM ensino_infantil.relatorio_avaliativo_habilidade rah_antigo
JOIN tmp_map_componentes map_c 
    ON map_c.id_rac_antigo = rah_antigo.id_relatorio_avaliativo_componente;




select DISTINCT rah.* --ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  
from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1360912) 
and ra.ativo 
and rahr.id_opcao_grupo_avaliacao_relatorio is not NULL;

76 --38
114 --39
38 --38


SELECT * FROM tmp_novas_habilidades;
-- ==============================================================================
-- PASSO 3: Inserir na tabela pai (relatorio_avaliativo_habilidade)
-- ==============================================================================
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (
    id_relatorio_avaliativo_habilidade,
    id_relatorio_avaliativo_componente,
    id_configuracao_relatorio_componente_habilidade
)
SELECT 
    id_rah_novo,
    id_rac_novo,
    id_configuracao_relatorio_componente_habilidade
FROM tmp_novas_habilidades;


-- ==============================================================================
-- PASSO 4: Inserir na tabela filha (relatorio_avaliativo_habilidade_resposta)
-- ==============================================================================
-- Ajustado: agora informamos explicitamente a sequence da tabela de respostas
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (
    id_relatorio_avaliativo_habilidade_resposta,
    id_relatorio_avaliativo_habilidade,
    id_opcao_grupo_avaliacao_relatorio,
    periodo
)
SELECT 
    nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq'),
    nh.id_rah_novo,
    rahr_antigo.id_opcao_grupo_avaliacao_relatorio,
    rahr_antigo.periodo
FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_antigo
JOIN tmp_novas_habilidades nh 
    ON nh.id_rah_antigo = rahr_antigo.id_relatorio_avaliativo_habilidade
WHERE rahr_antigo.id_opcao_grupo_avaliacao_relatorio IS NOT NULL
  AND rahr_antigo.periodo IN (1, 2);


-- ==============================================================================
-- PASSO 5: Remover registros da matrícula antiga (DELETE)
-- ==============================================================================
-- 5.1 Remove as respostas da matrícula antiga
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta
WHERE id_relatorio_avaliativo_habilidade IN (
    SELECT id_rah_antigo FROM tmp_novas_habilidades
);

-- 5.2 Remove as habilidades da matrícula antiga
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade
WHERE id_relatorio_avaliativo_habilidade IN (
    SELECT id_rah_antigo FROM tmp_novas_habilidades
);


-- ==============================================================================
-- PASSO 6: Limpeza de tabelas temporárias e Validação
-- ==============================================================================
DROP TABLE tmp_map_componentes;
DROP TABLE tmp_novas_habilidades;

-- Consulta de conferência na matrícula NOVA
SELECT 
    ra.id_matricula_discente_serie,
    rahr.id_relatorio_avaliativo_habilidade_resposta,
    mc.id_componente_curricular,
    crch.id_habilidade_competencia,
    rahr.id_opcao_grupo_avaliacao_relatorio,
    rahr.periodo
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac 
    ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah 
    ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr 
    ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch 
    ON crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
JOIN ensino.matricula_componente mc 
    ON mc.id_matricula_componente = rac.id_matricula_componente
WHERE ra.id_matricula_discente_serie = 1360912
  AND ra.ativo IS TRUE;

-- Para confirmar as alterações definitivamente:
-- COMMIT;

-- Para desfazer se algo não estiver correto:
-- ROLLBACK;