SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE true
AND t.id_turma_serie  IN (52056838)
ORDER BY fa."data" ,fa.id_discente;

SELECT ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie IN (52056838)
ORDER BY ht.dia, ht.hora_inicio;

select p.nome,
        u.login, t.id_turma, t.ano, t.id_turma_serie 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and u.login = 'nubiiabarbosa@gmail.com'
    
    
    SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie IN (52056838, 52057058, 52057124, 52057125);


    
    BEGIN;
    
    ROLLBACK ;

DROP TABLE IF EXISTS temp_frequencias_para_corrigir;

WITH RECURSIVE 
-- 1. Identifica os dias da semana permitidos na grade horária da turma
dias_permitidos AS (
    SELECT DISTINCT
        ht.id_turma,
        ht.dia::integer AS dia_semana
    FROM ensino.horario_turma ht
    JOIN ensino.turma t ON t.id_turma = ht.id_turma
    WHERE t.id_turma_serie = 52056838  -- Turma Alvo
),
-- 2. Gera o calendário de datas válidas para o ano letivo de 2026
calendario AS (
    SELECT '2026-03-01'::date AS data_possivel
    UNION ALL
    SELECT (data_possivel + INTERVAL '1 day')::date
    FROM calendario
    WHERE data_possivel < '2026-08-31'::date
),
-- 3. Lista as novas datas válidas da grade horária que estão totalmente LIVRES
novas_datas_livres AS (
    SELECT 
        dp.id_turma,
        c.data_possivel AS nova_data_correta,
        ROW_NUMBER() OVER (PARTITION BY dp.id_turma ORDER BY c.data_possivel ASC) AS seq_data
    FROM calendario c
    JOIN dias_permitidos dp ON (EXTRACT(DOW FROM c.data_possivel)::integer + 1) = dp.dia_semana
    -- Garante que a nova data ainda não tem frequência cadastrada na turma
    WHERE NOT EXISTS (
        SELECT 1 
        FROM ensino.frequencia_aluno fa_existente
        WHERE fa_existente.id_turma = dp.id_turma
          AND fa_existente."data" = c.data_possivel
    )
),
-- 4. SUA CONSULTA BASE: Isola as datas de frequência que caem em dias ERRADOS da grade
datas_erradas_frequencia AS (
    SELECT DISTINCT
        fa.id_turma,
        fa."data" AS data_frequencia_errada
    FROM ensino.frequencia_aluno fa
    JOIN ensino.turma t ON t.id_turma = fa.id_turma
    WHERE t.id_turma_serie = 52056838
      -- Condição da sua consulta: Dia da semana não existe no horário da turma
      AND NOT EXISTS (
          SELECT 1 
          FROM ensino.horario_turma ht
          WHERE ht.id_turma = fa.id_turma
            AND ht.dia::integer = (EXTRACT(DOW FROM fa."data")::integer + 1)
      )
),
-- 5. Enumera as datas erradas em ordem cronológica
datas_erradas_ordenadas AS (
    SELECT 
        id_turma,
        data_frequencia_errada,
        ROW_NUMBER() OVER (PARTITION BY id_turma ORDER BY data_frequencia_errada ASC) AS seq_errada
    FROM datas_erradas_frequencia
),
-- 6. Mapeia a Data Errada N com a Nova Data Livre N
mapa_de_para AS (
    SELECT 
        e.id_turma,
        e.data_frequencia_errada,
        l.nova_data_correta
    FROM datas_erradas_ordenadas e
    JOIN novas_datas_livres l ON l.id_turma = e.id_turma 
                              AND l.seq_data = e.seq_errada
)
-- 7. Consolida os IDs específicos da tabela frequencia_aluno que serão alterados
SELECT 
    fa.id_frequencia,
    fa.id_turma,
    fa.id_discente,
    fa."data" AS data_original_errada,
    m.nova_data_correta
INTO TEMP temp_frequencias_para_corrigir
FROM ensino.frequencia_aluno fa
JOIN mapa_de_para m ON m.id_turma = fa.id_turma 
                    AND m.data_frequencia_errada = fa."data";

-- ETAPA 2: GERAR SCRIPT DE BACKUP EXCLUSIVO DOS REGISTROS QUE SERÃO ALTERADOS
SELECT 
    'UPDATE ensino.frequencia_aluno SET "data" = ''' || tmp.data_original_errada || 
    ''' WHERE id_frequencia = ' || tmp.id_frequencia || ';' AS script_restauracao_backup
FROM temp_frequencias_para_corrigir tmp;

-- ETAPA 3: EXECUÇÃO DO UPDATE DEFINITIVO
UPDATE ensino.frequencia_aluno fa
SET "data" = tmp.nova_data_correta
FROM temp_frequencias_para_corrigir tmp
WHERE fa.id_frequencia = tmp.id_frequencia;

COMMIT;
