-- ==============================================================================
-- RECUPERAÇÃO DE AULAS USANDO TABELA TEMPORÁRIA (SIGEDUC / EDUC21)
-- ==============================================================================
-- Turma Antiga (id_turma_serie): 52054613
-- Turma Nova (id_turma_serie)  : 52057058
-- Sequence do Hibernate        : hibernate_sequence
-- ==============================================================================

BEGIN;

DROP TABLE IF EXISTS temp_topicos_para_migrar;

ROLLBACK;
-- ------------------------------------------------------------------------------
-- PASSO 1: CRIAR E POPULAR A TABELA TEMPORÁRIA
-- Seleciona o que falta na turma nova e já gera os novos IDs
-- ------------------------------------------------------------------------------
SELECT 
    nextval('hibernate_sequence') AS novo_id_topico_aula,
    cc.nome AS disciplina,
    ta_antiga.*
INTO TEMP temp_topicos_para_migrar    
FROM ava.topico_aula ta_antiga
JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
JOIN ensino.componente_curricular cc ON t_antiga.id_disciplina = cc.id_componente_curricular
WHERE t_antiga.id_turma_serie = 52054613  -- ID da turma antiga desativada
  AND ta_antiga.ativo = TRUE              -- Apenas aulas ativas na antiga
  -- Garantir que a aula NÃO existe na turma nova (comparando por data e descrição)
  AND NOT EXISTS (
      SELECT 1 
      FROM ava.topico_aula ta_nova
      JOIN ensino.turma t_nova ON t_nova.id_turma = ta_nova.id_turma
      WHERE t_nova.id_turma_serie = 52057058  -- ID da turma nova
        AND ta_nova.data = ta_antiga.data     -- Mesma data de aula
        AND (
            ta_nova.descricao = ta_antiga.descricao 
            OR ta_nova.conteudo = ta_antiga.conteudo
        )
  )
ORDER BY cc.nome, ta_antiga."data";


-- ------------------------------------------------------------------------------
-- PASSO 2: AUDITORIA DOS REGISTROS MAPEADOS
-- Visualiza os registros que serão inseridos e seus novos IDs gerados
-- ------------------------------------------------------------------------------
SELECT 
    *
FROM temp_topicos_para_migrar
ORDER BY "data";

-- ------------------------------------------------------------------------------
-- PASSO 3 (Opcional): GERAR COMANDO DE DELETE DE SEGURANÇA / EXTARNO
-- Se precisar desfazer o insert no futuro, execute este SELECT para copiar o DELETE
-- ------------------------------------------------------------------------------
SELECT 
    'DELETE FROM ava.topico_aula WHERE id_topico_aula IN (' || 
    string_agg(novo_id_topico_aula::text, ', ') || ');' AS script_de_deletar_se_precisar
FROM temp_topicos_para_migrar;


DELETE FROM ava.topico_aula WHERE id_topico_aula IN (52058473, 52058474, 52058475, 52058476, 52058477, 52058478, 52058479, 52058480, 52058481, 52058482, 52058483, 52058484, 52058485, 52058486, 52058487, 52058488, 52058489, 52058490);

-- ------------------------------------------------------------------------------
-- PASSO 4: EXECUTAR A INSERÇÃO NA TABELA DEFINITIVA
-- ------------------------------------------------------------------------------
INSERT INTO ava.topico_aula (
    id_topico_aula,
    id_turma,
    descricao, 
    "data", 
    fim, 
    id_topico_pai, 
    conteudo, 
    id_usuario, 
    data_cadastro, 
    visivel, 
    ativo, 
    id_docente_turma, 
    aula_cancelada, 
    id_aula_extra, 
    bimestre, 
    programado, 
    bimestral, 
    necessita_correcao, 
    replica_conteudo, 
    conteudo_ministrado, 
    quantidade_aulas, 
    metodologia, 
    observacoes, 
    data_atualizacao, 
    outros, 
    id_configuracao_conteudo_ministrado
)
SELECT 
    novo_id_topico_aula, -- ID gerado na tabela temporária
    id_turma_nova,       -- Pertence à nova turma
    descricao, 
    "data", 
    fim, 
    id_topico_pai, 
    conteudo, 
    id_usuario, 
    NOW(),               -- Data do cadastro
    visivel, 
    TRUE,                -- Mantém ativo
    id_docente_turma, 
    aula_cancelada, 
    id_aula_extra, 
    bimestre, 
    programado, 
    bimestral, 
    necessita_correcao, 
    replica_conteudo, 
    conteudo_ministrado, 
    quantidade_aulas, 
    metodologia, 
    observacoes, 
    NOW(), 
    outros, 
    id_configuracao_conteudo_ministrado
FROM temp_topicos_para_migrar;

-- ------------------------------------------------------------------------------
-- PASSO 5: CONFIRMAÇÃO
-- Se tudo correu bem, confirme com COMMIT. Se quiser desfazer, use ROLLBACK.
-- ------------------------------------------------------------------------------
COMMIT;
 ROLLBACK;