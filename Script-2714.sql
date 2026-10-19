-- Turma EFAFV7B
-- Turma Antiga (id_turma_serie): 52044269
-- Turma Nova   (id_turma_serie): 52057125

BEGIN;

--ROLLBACK;

-- ETAPA 1: CRIAR E POPULAR A TABELA TEMPORÁRIA COM DATAS ÚNICAS E VAGAS
DROP TABLE IF EXISTS temp_topicos_para_migrar;

WITH RECURSIVE 
-- 1. Identifica os dias da semana permitidos na grade da turma nova
dias_grade AS (
    SELECT DISTINCT
        ht.id_turma,
        ht.dia::integer AS dia_semana
    FROM ensino.horario_turma ht
    JOIN ensino.turma t ON t.id_turma = ht.id_turma
    WHERE t.id_turma_serie = 52057125
),
-- 2. Gera um calendario continuo de datas para o ano letivo
calendario AS (
    SELECT '2026-03-01'::date AS data_posivel
    UNION ALL
    SELECT (data_posivel + INTERVAL '1 day')::date
    FROM calendario
    WHERE data_posivel < '2026-12-31'::date
),
-- 3. Mapeia apenas as datas PERMITIDAS e VAGAS (sem lançamento ativo) para a turma nova
datas_vagas_ordenadas AS (
    SELECT 
        g.id_turma,
        c.data_posivel AS nova_data_livre,
        ROW_NUMBER() OVER (PARTITION BY g.id_turma ORDER BY c.data_posivel ASC) AS seq_data
    FROM calendario c
    JOIN dias_grade g ON (EXTRACT(DOW FROM c.data_posivel)::integer + 1) = g.dia_semana
    WHERE NOT EXISTS (
        SELECT 1 
        FROM ava.topico_aula ta_check
        WHERE ta_check.id_turma = g.id_turma
          AND ta_check.data = c.data_posivel
          AND ta_check.ativo = TRUE
    )
),
-- 4. Enumera as aulas da turma antiga em ordem cronologica
aulas_antigas_ordenadas AS (
    SELECT 
        cc.id_componente_curricular,
        cc.nome AS nome_disciplina,
        t_nova.id_turma AS id_turma_destino,
        ta_antiga.*,
        ROW_NUMBER() OVER (
            PARTITION BY t_nova.id_turma 
            ORDER BY ta_antiga.data ASC, ta_antiga.id_topico_aula ASC
        ) AS seq_aula
    FROM ava.topico_aula ta_antiga
    JOIN ensino.turma t_antiga ON t_antiga.id_turma = ta_antiga.id_turma
    JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t_antiga.id_disciplina
    JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52057125 
                            AND t_nova.id_disciplina = t_antiga.id_disciplina
    WHERE t_antiga.id_turma_serie = 52044269  -- Turma antiga
      AND ta_antiga.ativo = TRUE              -- Apenas aulas ativas
)
-- 5. Une a Aula N com a Data Vaga N
SELECT 
    a.id_componente_curricular,
    nextval('hibernate_sequence') AS novo_id_topico_aula,
    a.nome_disciplina,
    a.id_turma_destino,
    d.nova_data_livre AS data_reajustada, -- Data garantidamente livre e unica
    a.descricao,
    a.fim,
    a.id_topico_pai,
    a.conteudo,
    a.id_usuario,
    a.visivel,
    a.ativo,
    a.id_docente_turma,
    a.aula_cancelada,
    a.id_aula_extra,
    a.bimestre,
    a.programado,
    a.bimestral,
    a.necessita_correcao,
    a.replica_conteudo,
    a.conteudo_ministrado,
    a.quantidade_aulas,
    a.metodologia,
    a.observacoes,
    a.outros,
    a.id_configuracao_conteudo_ministrado
INTO TEMP temp_topicos_para_migrar
FROM aulas_antigas_ordenadas a
JOIN datas_vagas_ordenadas d ON d.id_turma = a.id_turma_destino 
                             AND d.seq_data = a.seq_aula;

-- ETAPA 2: SCRIPT DE BACKUP 
SELECT 
    'DELETE FROM ava.topico_aula WHERE id_topico_aula IN (' || 
    string_agg(novo_id_topico_aula::text, ', ') || ');' AS script_de_deletar_se_precisar
FROM temp_topicos_para_migrar;

-- ETAPA 3: INSERÇÃO DEFINITIVA NA TABELA
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
    tmp.novo_id_topico_aula,
    tmp.id_turma_destino,
    tmp.descricao, 
    tmp.data_reajustada,                  -- Data livre garantida sem duplicação
    tmp.fim, 
    tmp.id_topico_pai, 
    tmp.conteudo, 
    tmp.id_usuario, 
    NOW(),
    tmp.visivel, 
    TRUE,
    tmp.id_docente_turma, 
    tmp.aula_cancelada, 
    tmp.id_aula_extra, 
    tmp.bimestre, 
    tmp.programado, 
    tmp.bimestral, 
    tmp.necessita_correcao, 
    tmp.replica_conteudo, 
    tmp.conteudo_ministrado, 
    tmp.quantidade_aulas, 
    tmp.metodologia, 
    tmp.observacoes, 
    NOW(),
    tmp.outros, 
    tmp.id_configuracao_conteudo_ministrado
FROM temp_topicos_para_migrar tmp;

COMMIT;
-- ROLLBACK;