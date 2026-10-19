BEGIN;

SELECT
    nextval('hibernate_sequence') AS id,
    id_turma,
    data_aula::date AS data_aula,
    current_date AS criado_em,
    1 AS numero_aulas,
    3 AS tipo,
    'Sábado Letivo' AS descricao
INTO TEMP aulas_extra_para_adicionar
FROM (
    WITH datas (id_escola, dia) AS (
        values
        	-- EM João Penha
            (1861, '2026-04-11'::date),
            (1861, '2026-05-09'::date),
            (1861, '2026-06-06'::date),
            (1861, '2026-08-08'::date),
            (1861, '2026-10-17'::date),
			-- EM Luzia Bonifácio
            (1871, '2026-04-11'::date),
            (1871, '2026-05-09'::date),
            (1871, '2026-06-06'::date),
            (1871, '2026-08-08'::date),
            (1871, '2026-10-17'::date),
            -- Und 8 Sebastião
            (1868, '2026-04-11'::date),
            (1868, '2026-05-09'::date),
            (1868, '2026-06-06'::date),
            (1868, '2026-08-08'::date),
            (1868, '2026-10-17'::date),
            -- CMEI Joana
            (1883, '2026-04-11'::date),
            (1883, '2026-05-09'::date),
            (1883, '2026-06-06'::date),
            (1883, '2026-08-08'::date),
            (1883, '2026-10-17'::date),
            -- EM José Ribeiro 
            (1864, '2026-05-09'::date),
			-- EM Alferes
            (1856, '2026-06-13'::date)
    ),
    aulas_comuns AS (
        SELECT
            CASE
                WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora
                ELSE t.id_turma
            END AS id_turma,
            d.dia AS data_aula
        FROM ensino.turma t
        JOIN basico.turma_serie ts
            ON ts.id_turma_serie = t.id_turma_serie
        JOIN escola.escola e
            ON e.id_escola = ts.id_escola
        JOIN datas d
            ON d.id_escola = e.id_escola
        WHERE
            t.id_situacao_turma NOT IN (4, 9)
            AND t.ano = 2026
            AND NOT EXISTS (
                SELECT 1
                FROM ava.aula_extra ae
                WHERE
                    ae.id_turma = CASE
                        WHEN t.id_turma_agrupadora IS NOT NULL
                            THEN t.id_turma_agrupadora
                        ELSE t.id_turma
                    END
                    AND ae.data_aula = d.dia
            )
    ),
    aulas_adjuntas AS (
        SELECT
            t.id_turma AS id_turma,
            d.dia AS data_aula
        FROM ensino.turma t
        JOIN basico.turma_serie ts
            ON t.id_turma_serie = ts.id_turma_serie
        JOIN escola.escola e
            ON e.id_escola = ts.id_escola
        JOIN datas d
            ON d.id_escola = e.id_escola
        JOIN basico.curriculo_basico cb
            ON cb.id_curriculo_basico = ts.id_curriculo_medio
        JOIN ensino.docente_turma dt
            ON dt.id_turma = t.id_turma
        JOIN basico.curriculo_basico_componente cbc
            ON cbc.id_curriculo_basico = ts.id_curriculo_medio
            AND cbc.permite_alocacao_adjunto
            AND cbc.id_componente_curricular = t.id_disciplina
        WHERE
            dt.ativo
            AND NOT dt.finalizada
            AND (now() BETWEEN dt.data_inicio AND dt.data_fim)
            AND t.id_turma_agrupadora IS NOT NULL
            AND NOT EXISTS (
                SELECT 1
                FROM ava.aula_extra ae
                WHERE
                    ae.id_turma = t.id_turma
                    AND ae.data_aula = d.dia
            )
    )
    SELECT id_turma, data_aula
    FROM aulas_comuns
    UNION
    SELECT id_turma, data_aula
    FROM aulas_adjuntas
) AS aulas_para_processar;

INSERT INTO ava.aula_extra (
    id,
    id_turma,
    data_aula,
    criado_em,
    numero_aulas,
    tipo,
    descricao
)
SELECT
    id,
    id_turma,
    data_aula,
    criado_em,
    numero_aulas,
    tipo,
    descricao
FROM aulas_extra_para_adicionar;

-- Backup
SELECT
    'DELETE FROM ava.aula_extra WHERE id IN ('
    || string_agg(id::TEXT, ',')
    || ');'
FROM aulas_extra_para_adicionar;


COMMIT;