BEGIN;

-- ==============================================================================
-- PASSO 1: Criar a tabela temporária mapeando o registro NOVO (com NULL)
-- ==============================================================================
CREATE TEMP TABLE tmp_migracao_update AS
SELECT rahr_novo.id_relatorio_avaliativo_habilidade_resposta AS id_rahr_novo, rahr_antigo.id_relatorio_avaliativo_habilidade_resposta AS id_rahr_antigo, rahr_antigo.id_opcao_grupo_avaliacao_relatorio AS nova_opcao_resposta, rahr_antigo.periodo
FROM ensino_infantil.relatorio_avaliativo ra_antigo
-- 1.1 Mapeia componentes e habilidades da matrícula ANTIGA (1357694)
JOIN ensino_infantil.relatorio_avaliativo_componente rac_antigo ON rac_antigo.id_relatorio_avaliativo = ra_antigo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_antigo  ON mc_antigo.id_matricula_componente = rac_antigo.id_matricula_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_antigo ON rah_antigo.id_relatorio_avaliativo_componente = rac_antigo.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_antigo ON rahr_antigo.id_relatorio_avaliativo_habilidade = rah_antigo.id_relatorio_avaliativo_habilidade
-- 1.2 Mapeia componentes, habilidades e respostas da matrícula NOVA (1360912)
JOIN ensino_infantil.relatorio_avaliativo ra_novo ON ra_novo.id_matricula_discente_serie = 1360912
AND ra_novo.ativo IS TRUE
JOIN ensino_infantil.relatorio_avaliativo_componente rac_novo ON rac_novo.id_relatorio_avaliativo = ra_novo.id_relatorio_avaliativo
JOIN ensino.matricula_componente mc_novo ON mc_novo.id_matricula_componente = rac_novo.id_matricula_componente
AND mc_novo.id_componente_curricular = mc_antigo.id_componente_curricular
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah_novo ON rah_novo.id_relatorio_avaliativo_componente = rac_novo.id_relatorio_avaliativo_componente
AND rah_novo.id_configuracao_relatorio_componente_habilidade = rah_antigo.id_configuracao_relatorio_componente_habilidade
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr_novo ON rahr_novo.id_relatorio_avaliativo_habilidade = rah_novo.id_relatorio_avaliativo_habilidade
AND rahr_novo.periodo = rahr_antigo.periodo
WHERE ra_antigo.id_matricula_discente_serie = 1357694
AND ra_antigo.ativo IS TRUE
AND rahr_antigo.id_opcao_grupo_avaliacao_relatorio IS NOT NULL
AND rahr_antigo.periodo IN (1, 2);

-- ==============================================================================
-- PASSO 2: Gerar String de Backup (Voltar o valor para NULL na matrícula nova)
-- ==============================================================================
SELECT COUNT(t.id_rahr_novo) AS quantidade_registros, 'UPDATE ensino_infantil.relatorio_avaliativo_habilidade_resposta SET id_opcao_grupo_avaliacao_relatorio = NULL WHERE id_relatorio_avaliativo_habilidade_resposta IN ('|| string_agg(t.id_rahr_novo::TEXT, ', ') || ');' AS backup_sql_reverter_update
FROM tmp_migracao_update t;

-- ==============================================================================
-- PASSO 3: Executar o UPDATE na matrícula NOVA
-- ==============================================================================
UPDATE ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr
SET id_opcao_grupo_avaliacao_relatorio = t.nova_opcao_resposta
FROM tmp_migracao_update t
WHERE rahr.id_relatorio_avaliativo_habilidade_resposta = t.id_rahr_novo;

-- ==============================================================================
-- PASSO 4: Criar tabela temporária com o mapeamento das turmas por disciplina
-- ==============================================================================
CREATE TEMP TABLE tmp_map_frequencia_turma AS
SELECT fa.id_frequencia, fa.id_discente, t_antiga.id_turma AS id_turma_antiga, t_nova.id_turma AS id_turma_nova, t_antiga.id_disciplina
FROM ensino.frequencia_aluno fa 
JOIN ensino.turma t_antiga ON t_antiga.id_turma = fa.id_turma
JOIN ensino.turma t_nova ON t_nova.id_disciplina = t_antiga.id_disciplina
AND t_nova.id_turma_serie = 51958442
WHERE fa.id_discente = 997599
AND t_antiga.id_turma_serie = 52014417;

-- ==============================================================================
-- PASSO 5: Gerar String de Backup (para reverter para a turma antiga se necessário)
-- ==============================================================================
SELECT 
    COUNT(tmp.id_frequencia) AS quantidade_registros,
    'UPDATE ensino.frequencia_aluno SET id_turma = ' || tmp.id_turma_antiga || ' WHERE id_frequencia IN (' || string_agg(tmp.id_frequencia::TEXT, ', ') || ');' AS backup_sql_reverter
FROM tmp_map_frequencia_turma tmp
GROUP BY tmp.id_turma_antiga;

-- ==============================================================================
-- PASSO 6: Atualizar a frequência para a nova turma (UPDATE)
-- ==============================================================================
UPDATE ensino.frequencia_aluno fa
SET id_turma = tmp.id_turma_nova
FROM tmp_map_frequencia_turma tmp
WHERE fa.id_frequencia = tmp.id_frequencia;

 COMMIT;

 --ROLLBACK;