-- ==============================================================================
-- SCRIPT DE MIGRAÇÃO COM MAPEAMENTO SEQUENCIAL DE DATAS VAGAS
-- Turma Antiga (id_turma_serie): 52044268
-- Turma Nova   (id_turma_serie): 52057124

BEGIN;

ROLLBACK;

-- ------------------------------------------------------------------------------
-- ETAPA 1: CRIAR E POPULAR A TABELA TEMPORÁRIA COM DATAS ÚNICAS E VAGAS
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS temp_topicos_para_migrar;

WITH RECURSIVE 
-- 1. Identifica os dias da semana permitidos na grade da turma nova
dias_grade AS (
    SELECT DISTINCT
        ht.id_turma,
        ht.dia::integer AS dia_semana
    FROM ensino.horario_turma ht
    JOIN ensino.turma t ON t.id_turma = ht.id_turma
    WHERE t.id_turma_serie = 52057124
),
-- 2. Gera um calendario continuo de datas para o ano letivo
calendario AS (
    SELECT '2026-02-01'::date AS data_posivel
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
    JOIN ensino.turma t_nova ON t_nova.id_turma_serie = 52057124 
                            AND t_nova.id_disciplina = t_antiga.id_disciplina
    WHERE t_antiga.id_turma_serie = 52044268  -- Turma antiga
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

-- ------------------------------------------------------------------------------
-- ETAPA 2: SCRIPT DE BACKUP / DELEÇÃO MANUAL
-- ------------------------------------------------------------------------------
SELECT 
    'DELETE FROM ava.topico_aula WHERE id_topico_aula IN (' || 
    string_agg(novo_id_topico_aula::text, ', ') || ');' AS script_de_deletar_se_precisar
FROM temp_topicos_para_migrar;

DELETE FROM ava.topico_aula WHERE id_topico_aula IN (52060360, 52060361, 52060362, 52060363, 52060364, 52060365, 52060366, 52060367, 52060368, 52060369, 52060370, 52060371, 52060372, 52060373, 52060374, 52060375, 52060376, 52060377, 52060378, 52060379, 52060380, 52060381, 52060382, 52060383, 52060384, 52060385, 52060386, 52060387, 52060388, 52060389, 52060390, 52060391, 52060392, 52060393, 52060394, 52060395, 52060396, 52060397, 52060398, 52060399, 52060400, 52060401, 52060402, 52060403, 52060404, 52060405, 52060406, 52060407, 52060408, 52060409, 52060410, 52060411, 52060412, 52060413, 52060414, 52060415, 52060416, 52060417, 52060418, 52060419, 52060420, 52060421, 52060422, 52060423, 52060424, 52060425, 52060426, 52060427, 52060428, 52060429, 52060430, 52060431, 52060432, 52060433, 52060434, 52060435, 52060436, 52060437, 52060438, 52060439, 52060440, 52060441, 52060442, 52060443, 52060444, 52060445, 52060446, 52060447, 52060448, 52060449, 52060450, 52060451, 52060452, 52060453, 52060454, 52060455, 52060456, 52060457, 52060458, 52060459, 52060460, 52060461, 52060462, 52060463, 52060464, 52060465, 52060466, 52060467, 52060468, 52060469, 52060470, 52060471, 52060472, 52060473, 52060474, 52060475, 52060476, 52060477, 52060478, 52060479, 52060480, 52060481, 52060482, 52060483, 52060484, 52060485, 52060486, 52060487, 52060488, 52060489, 52060490, 52060491, 52060492, 52060493, 52060494, 52060495, 52060496, 52060497, 52060498, 52060499, 52060500, 52060501, 52060502, 52060503, 52060504, 52060505, 52060506, 52060507, 52060508, 52060509, 52060510, 52060511, 52060512, 52060513, 52060514, 52060515, 52060516, 52060517, 52060518, 52060519, 52060520, 52060521, 52060522, 52060523, 52060524, 52060525, 52060526, 52060527, 52060528, 52060529, 52060530, 52060531, 52060532, 52060533, 52060534, 52060535, 52060536, 52060537, 52060538, 52060539, 52060540, 52060541, 52060542, 52060543, 52060544, 52060545);

-- ------------------------------------------------------------------------------
-- ETAPA 3: INSERÇÃO DEFINITIVA NA TABELA
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