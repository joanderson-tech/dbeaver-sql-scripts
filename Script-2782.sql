BEGIN;

-- ==============================================================================
-- PASSO 1: Criar e popular a tabela temporária com o mapeamento e backup
-- ==============================================================================
CREATE TEMP TABLE tmp_respostas_migracao AS
SELECT 
    rah_antigo.id_relatorio_avaliativo_habilidade AS id_rah_antigo,
    rah_novo.id_relatorio_avaliativo_habilidade AS id_rah_novo,
    rahr_antigo.id_relatorio_avaliativo_habilidade_resposta AS id_rahr_antigo,
    rahr_antigo.id_opcao_grupo_avaliacao_relatorio,
    rahr_antigo.periodo
FROM ensino_infantil.relatorio_avaliativo ra_antigo
-- Mapeia os componentes e habilidades da matrícula ANTIGA (1357694)
JOIN ensino_infantil.relatorio_avaliativo_componente rac_antigo 
    ON rac_antigo.id_relatorio_avaliativo = ra_antigo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_antigo 
    ON mc_antigo.id_matricula_componente = rac_antigo.id_matricula_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_antigo 
    ON rah_antigo.id_relatorio_avaliativo_componente = rac_antigo.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_antigo 
    ON rahr_antigo.id_relatorio_avaliativo_habilidade = rah_antigo.id_relatorio_avaliativo_habilidade
-- Mapeia os componentes e habilidades da matrícula NOVA (1360912)
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
WHERE ra_antigo.id_matricula_discente_serie = 1357694
  AND ra_antigo.ativo IS TRUE
  AND rahr_antigo.id_opcao_grupo_avaliacao_relatorio IS NOT NULL
  AND rahr_antigo.periodo IN (1, 2);

  
-- ==============================================================================
-- PASSO 2: Backup das respostas na matrícula NOVA usando a tabela temporária
-- ==============================================================================
SELECT 
    COUNT(trm.id_rahr_antigo) AS quantidade_registros, 
    'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN (' 
    || string_agg(trm.id_rahr_antigo::TEXT, ', ') 
    || ');' AS backup_sql
FROM tmp_respostas_migracao trm;


-- ==============================================================================
-- PASSO 3: Inserir as respostas na matrícula NOVA usando a tabela temporária
-- ==============================================================================
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (
    -- Se o banco exigir Sequence manual, descomente a linha abaixo:
     id_relatorio_avaliativo_habilidade_resposta,
    id_relatorio_avaliativo_habilidade,
    id_opcao_grupo_avaliacao_relatorio,
    periodo
)
SELECT 
     nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq'),
    id_rah_novo,
    id_opcao_grupo_avaliacao_relatorio,
    periodo
FROM tmp_respostas_migracao;


ROLLBACK;



select rahr.* --ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  
from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1357694) 
and ra.ativo 
and rahr.id_opcao_grupo_avaliacao_relatorio is not NULL;
AND rahr.periodo IN (1,2);

