-- ==============================================================================
-- SCRIPT DE UPDATE E BACKUP DE FREQUÊNCIA (ESCOPO RESTRITO À TABELA TEMPORÁRIA)
-- Tabela Alvo: ensino.frequencia_aluno
-- Parâmetro: id_turma_serie da turma ativa (Exemplo: 52057058)
-- ==============================================================================

BEGIN;
ROLLBACK;

-- ------------------------------------------------------------------------------
-- ETAPA 1: MAPEAMENTO E CRIAÇÃO DA TABELA TEMPORÁRIA DE IDs E DATAS
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS temp_datas_frequencia_update;

WITH RECURSIVE 
-- 1. Dias da semana permitidos no horário da turma ativa
dias_grade AS (
    SELECT DISTINCT
        ht.id_turma,
        ht.dia::integer AS dia_semana
    FROM ensino.horario_turma ht
    JOIN ensino.turma t ON t.id_turma = ht.id_turma
    WHERE t.id_turma_serie = 52057058  -- ID da Turma/Série Ativa
),
-- 2. Calendário do ano letivo de 2026
calendario AS (
    SELECT '2026-02-01'::date AS data_possivel
    UNION ALL
    SELECT (data_possivel + INTERVAL '1 day')::date
    FROM calendario
    WHERE data_possivel < '2026-12-31'::date
),
-- 3. Mapeia as novas datas válidas da grade em ordem cronológica
novas_datas_grade AS (
    SELECT 
        g.id_turma,
        c.data_possivel AS nova_data_correta,
        ROW_NUMBER() OVER (PARTITION BY g.id_turma ORDER BY c.data_possivel ASC) AS seq_data
    FROM calendario c
    JOIN dias_grade g ON (EXTRACT(DOW FROM c.data_possivel)::integer + 1) = g.dia_semana
),
-- 4. Isola as datas únicas de frequência cadastradas atualmente na turma
datas_unicas_existentes AS (
    SELECT DISTINCT
        fa.id_turma,
        fa."data" AS data_antiga_errada
    FROM ensino.frequencia_aluno fa
    JOIN ensino.turma t ON t.id_turma = fa.id_turma
    WHERE t.id_turma_serie = 52057058  -- ID da Turma/Série Ativa
),
-- 5. Enumera as datas únicas existentes
datas_unicas_ordenadas AS (
    SELECT 
        id_turma,
        data_antiga_errada,
        ROW_NUMBER() OVER (PARTITION BY id_turma ORDER BY data_antiga_errada ASC) AS seq_frequencia
    FROM datas_unicas_existentes
),
-- 6. Associa a Data Antiga com a Nova Data da Grade
mapa_datas AS (
    SELECT 
        f.id_turma,
        f.data_antiga_errada,
        d.nova_data_correta
    FROM datas_unicas_ordenadas f
    JOIN novas_datas_grade d ON d.id_turma = f.id_turma 
                             AND d.seq_data = f.seq_frequencia
)
-- 7. Grava na Tabela Temporária os IDs ESPECÍFICOS da tabela frequencia_aluno
SELECT 
    fa.id_frequencia,
    fa.id_turma,
    fa.id_discente,
    fa."data" AS data_antiga,
    m.nova_data_correta
INTO TEMP temp_datas_frequencia_update
FROM ensino.frequencia_aluno fa
JOIN mapa_datas m ON m.id_turma = fa.id_turma 
                  AND m.data_antiga_errada = fa."data";

-- Visualização dos registros capturados exclusivamente para a alteração
SELECT * FROM temp_datas_frequencia_update ORDER BY id_turma, nova_data_correta;


-- ------------------------------------------------------------------------------
-- ETAPA 2: GERAR SCRIPT DE BACKUP EXCLUSIVO DA TABELA TEMPORÁRIA
-- ------------------------------------------------------------------------------
-- Lógica: Lê APENAS os registros mapeados na tabela temporária
SELECT 
    'UPDATE ensino.frequencia_aluno SET "data" = ''' || tmp.data_antiga || 
    ''' WHERE id_frequencia = ' || tmp.id_frequencia || ';' AS script_restauracao_backup
FROM temp_datas_frequencia_update tmp;

SELECT 
    'UPDATE ensino.frequencia_aluno SET "data" = ''' || tmp.data_antiga || 
    ''' WHERE id_frequencia = ' || tmp.id_frequencia || ';' AS script_restauracao_backup
FROM temp_datas_frequencia_update tmp
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.frequencia_aluno fa_check
    WHERE fa_check.id_discente = tmp.id_discente
      AND fa_check.id_turma = tmp.id_turma
      AND fa_check."data" = tmp.nova_data_correta
      AND fa_check.id_frequencia <> tmp.id_frequencia
);


-- ------------------------------------------------------------------------------
-- ETAPA 3: EXECUÇÃO DO UPDATE RESTRITO À TABELA TEMPORÁRIA E ANTI-DUPLICIDADE
-- ------------------------------------------------------------------------------
UPDATE ensino.frequencia_aluno fa
SET "data" = tmp.nova_data_correta
FROM temp_datas_frequencia_update tmp
WHERE fa.id_frequencia = tmp.id_frequencia -- Junção por Chave Primária Exata
  -- Trava Anti-Duplicidade: Garante que o discente não possui essa data já ocupada na turma
  AND NOT EXISTS (
      SELECT 1 
      FROM ensino.frequencia_aluno fa_check
      WHERE fa_check.id_discente = fa.id_discente
        AND fa_check.id_turma = fa.id_turma
        AND fa_check."data" = tmp.nova_data_correta
        AND fa_check.id_frequencia <> fa.id_frequencia
  );

COMMIT;
-- ------------------------------------------------------------------------------
-- ETAPA 4: REGISTRO NO LOG DE AUDITORIA
-- ------------------------------------------------------------------------------
INSERT INTO ava.log_migracao_topico_aula (
    id_turma_serie_origem,
    id_turma_serie_destino,
    qtd_registros_migrados,
    descricao_operacao
)
SELECT 
    52057058,
    52057058,
    COUNT(*),
    'UPDATE de frequência realizado estritamente com base na tabela temporária.'
FROM temp_datas_frequencia_update;

COMMIT;
-- ROLLBACK;