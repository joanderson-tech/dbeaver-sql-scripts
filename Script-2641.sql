WITH frequencias AS (
    -- ETAPA 1: Busca e consolida os lançamentos de frequência e abonos do aluno no mês desejado
    SELECT 
        fa.id_frequencia, 
        fa.id_turma, 
        fa."data", 
        fa.atual, 
        fa.frequencia, 
        fa.horarios,
        (fa.abonada AND COUNT(af.*) > 0) AS abonada
    FROM ensino.frequencia_aluno fa
    JOIN ensino.turma t ON t.id_turma = fa.id_turma
    LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
    LEFT JOIN ensino.abono_frequencia af ON af.ativo AND af.id_abono_frequencia = iaf.id_abono_frequencia
    WHERE fa.ativo
      AND fa.id_discente = 976301           -- ID do Discente
      AND t.id_turma_serie = 51885408       -- ID da Turma/Série
      -- FILTRO DE MÊS E ANO:
      AND EXTRACT(MONTH FROM fa."data") IN (2)
      AND EXTRACT(YEAR FROM fa."data") = 2026  -- Ano desejado (ex: 2026)
    GROUP BY 
        fa.id_frequencia, 
        fa.id_turma, 
        fa."data", 
        fa.atual, 
        fa.frequencia, 
        fa.horarios, 
        fa.abonada 
),
detalhe_aulas AS (
    -- ETAPA 2: Consolida o total de faltas e horários por aula do mês
    SELECT 
        fa.id_turma,
        fa."data" AS data_aula,
        LEAST(
            COALESCE(SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0), 
            COALESCE(ae.numero_aulas, fa.horarios)
        ) AS faltas_aula,
        COALESCE(ae.numero_aulas, fa.horarios) AS horaios_aula
    FROM frequencias fa
    LEFT JOIN ava.aula_extra ae ON ae.id_turma = fa.id_turma AND ae.data_aula = fa."data"
    GROUP BY 
        fa.id_turma, 
        fa."data", 
        fa.frequencia, 
        fa.horarios, 
        ae.numero_aulas
)
-- ETAPA 3: Agrupa os totais do mês e calcula o percentual (%) de frequência
SELECT 
    id_turma,
    SUM(faltas_aula) AS total_faltas_mes,
    SUM(horaios_aula) AS total_horarios_mes,
    (SUM(horaios_aula) - SUM(faltas_aula)) AS total_presencas_mes,
    ROUND(
        ((SUM(horaios_aula) - SUM(faltas_aula))::DECIMAL / NULLIF(SUM(horaios_aula), 0)) * 100, 
        2
    ) AS percentual_frequencia
    --INTO TEMP testes
FROM detalhe_aulas
GROUP BY id_turma;


DROP TABLE IF EXISTS testes;


SELECT * FROM testes;


-- ETAPA ÚNICA: Consolida os dados da tabela temporária 'testes' em uma única linha
SELECT 
    -- 1. Soma total de faltas no mês
    SUM(total_faltas_mes) AS total_faltas_mes,
    -- 2. Soma total de horários/aulas no mês
    SUM(total_horarios_mes) AS total_horarios_mes,
    -- 3. Soma total de presenças no mês
    SUM(total_presencas_mes) AS total_presencas_mes,
    -- 4. Cálculo do percentual de frequência global no mês (%)
    ROUND(
        ((SUM(total_horarios_mes) - SUM(total_faltas_mes))::DECIMAL / NULLIF(SUM(total_horarios_mes), 0)) * 100, 
        2
    ) AS percentual_frequencia
FROM testes;



-- ETAPA 1: Demonstração da diferença entre a média ponderada (correta) e a média simples
SELECT 
    -- 1. Cálculo Correto (Ponderado/Anual): Considera o peso real das aulas ministradas
    ROUND(
        (SUM(total_presencas_mes)::DECIMAL / NULLIF(SUM(total_horarios_mes), 0)) * 100, 
        2
    ) AS frequencia_acumulada_anual_real,
    -- 2. Cálculo Incorreto (Média Simples): Apenas tira a média das porcentagens mensais
    ROUND(
        AVG(percentual_frequencia), 
        2
    ) AS media_simples_das_porcentagens_mensais
FROM testes;


