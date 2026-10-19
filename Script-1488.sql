EXPLAIN (ANALYZE)
SELECT e.nome AS nomeUnidade, ee.denominacao AS nomeEtapaEnsino, s.descricao AS nomeSerie,
ts.nome AS nomeTurma, d.nome AS nomeDisciplina, fa.data AS data, fa.frequencia AS falta,
(COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AS abonada,
CASE WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND fa.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf.codigo || ') ' || mbf.denominacao
WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND af.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf2.codigo || ') ' || mbf2.denominacao
WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND (af.justificativa IS NOT NULL OR trim(af.justificativa) <> '') THEN af.justificativa
ELSE '' END AS motivoAbono
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
JOIN escola.escola e ON e.id_escola = ts.id_escola
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
JOIN ensino.componente_curricular d ON d.id_componente_curricular = t.id_disciplina
LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
LEFT JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia AND af.ativo = TRUE
LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = fa.id_motivo_baixa_frequencia
LEFT JOIN basico.motivo_baixa_frequencia mbf2 ON mbf2.id_motivo_baixa_frequencia = af.id_motivo_baixa_frequencia
WHERE fa.data BETWEEN ? AND ? AND fa.ativo = TRUE AND t.id_situacao_turma <> 4
AND ts.ativo = TRUE AND s.ativo = TRUE AND ee.ativo = TRUE AND d.ativo = TRUE 
AND fa.id_discente = ?
ORDER BY fa.data, ee.denominacao, s.descricao, ts.nome, d.nome



SELECT e.nome AS nomeUnidade, ee.denominacao AS nomeEtapaEnsino, s.descricao AS nomeSerie,
            ts.nome AS nomeTurma, d.nome AS nomeDisciplina, fa.data AS data, fa.frequencia AS falta,
            (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AS abonada,
            CASE WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND fa.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf.codigo || ') ' || mbf.denominacao
            WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND af.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf2.codigo || ') ' || mbf2.denominacao
            WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND (af.justificativa IS NOT NULL OR trim(af.justificativa) <> '') THEN af.justificativa
            ELSE '' END AS motivoAbono
            FROM ensino.frequencia_aluno fa
            JOIN ensino.turma t ON t.id_turma = fa.id_turma
            JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
            JOIN escola.escola e ON e.id_escola = ts.id_escola
            JOIN basico.serie s ON s.id_serie = ts.id_serie
            JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
            JOIN ensino.componente_curricular d ON d.id_componente_curricular = t.id_disciplina
            LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
            LEFT JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia AND af.ativo = TRUE
            LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = fa.id_motivo_baixa_frequencia
            LEFT JOIN basico.motivo_baixa_frequencia mbf2 ON mbf2.id_motivo_baixa_frequencia = af.id_motivo_baixa_frequencia
            WHERE fa.data BETWEEN '2025-01-10' AND '2025-12-29' 
            AND fa.ativo = TRUE 
            AND t.id_situacao_turma <> 4
            AND ts.ativo = TRUE 
            AND s.ativo = TRUE 
            AND ee.ativo = TRUE 
            AND d.ativo = TRUE 
            AND fa.id_discente = 998333
            ORDER BY fa.data, ee.denominacao, s.descricao, ts.nome, d.nome;


-- Crie o índice que cobre todos os filtros e chaves de join essenciais
CREATE INDEX CONCURRENTLY idx_frequencia_aluno_para_consulta_abonada
    ON ensino.frequencia_aluno (data, ativo, abonada, abonada_escola, id_turma, id_discente);


CREATE INDEX CONCURRENTLY idx_frequencia_aluno_data_filtros
    ON ensino.frequencia_aluno (data, ativo, abonada, abonada_escola, id_turma, id_discente);



EXPLAIN (ANALYZE)
SELECT DISTINCT dis.id_discente AS idDiscente, dis.matricula AS matricula, p.nome AS nomeEstudante, p.cpf_cnpj AS cpf,
            e.nome AS nomeUnidade, ee.denominacao AS nomeEtapaEnsino, s.descricao AS nomeSerie, ts.nome AS nomeTurma, d.nome AS nomeDisciplina,
            fa.data AS data, fa.frequencia AS falta, (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AS abonada,
            CASE WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND fa.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf.codigo || ') ' || mbf.denominacao
            WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND af.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf2.codigo || ') ' || mbf2.denominacao
            WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false)) AND (af.justificativa IS NOT NULL OR trim(af.justificativa) <> '') THEN af.justificativa
            ELSE '' END AS motivoAbono
            FROM ensino.frequencia_aluno fa
            JOIN discente dis ON dis.id_discente = fa.id_discente
            JOIN comum.pessoa p ON p.id_pessoa = dis.id_pessoa
            JOIN ensino.turma t ON t.id_turma = fa.id_turma
            JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
            JOIN escola.escola e ON e.id_escola = ts.id_escola
            JOIN basico.serie s ON s.id_serie = ts.id_serie
            JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
            JOIN ensino.componente_curricular d ON d.id_componente_curricular = t.id_disciplina
            LEFT JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
            LEFT JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia AND af.ativo = TRUE
            LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = fa.id_motivo_baixa_frequencia
            LEFT JOIN basico.motivo_baixa_frequencia mbf2 ON mbf2.id_motivo_baixa_frequencia = af.id_motivo_baixa_frequencia
            WHERE fa.data BETWEEN '2025-01-10' AND '2025-12-01' 
            AND fa.ativo = TRUE 
            AND (fa.abonada = TRUE OR fa.abonada_escola = TRUE)
            AND t.id_situacao_turma <> 4 
            AND ts.ativo = TRUE 
            AND s.ativo = TRUE 
            AND ee.ativo = TRUE 
            AND d.ativo = TRUE
            ORDER BY p.nome, fa.data, ee.denominacao, s.descricao, ts.nome, d.nome
            LIMIT 100;


EXPLAIN (ANALYZE)
WITH FrequenciaFiltrada AS (
    -- 1. Primeiro CTE: Filtra a tabela grande (FA) com as condições mais seletivas.
    -- O índice otimizado (data, ativo, abonada, abonada_escola, id_turma, id_discente) será usado aqui.
    SELECT
        fa.id_discente, fa.id_turma, fa.data, fa.frequencia,
        COALESCE(fa.abonada_escola, false) AS abonada_escola_bool,
        COALESCE(fa.abonada, false) AS abonada_bool,
        fa.id_motivo_baixa_frequencia AS id_motivo_fa,
        fa.id_frequencia
    FROM ensino.frequencia_aluno fa
    WHERE fa.data BETWEEN '2025-01-10' AND '2025-12-30' 
      AND fa.ativo = TRUE 
      AND (fa.abonada = TRUE OR fa.abonada_escola = TRUE)
),
MotivosAbono AS (
    -- 2. Segundo CTE: Simplifica a obtenção dos motivos de abono (LEFT JOINs).
    SELECT
        ff.id_frequencia,
        -- Abono via abono_frequencia (af)
        af.id_abono_frequencia,
        af.justificativa,
        af.id_motivo_baixa_frequencia AS id_motivo_af
    FROM FrequenciaFiltrada ff
    JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = ff.id_frequencia
    JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia
    WHERE af.ativo = TRUE -- Filtro para garantir que pegamos apenas o abono ativo
)
-- 3. Consulta Principal: Junta os CTEs com as tabelas de descrição e aplica a lógica final.
SELECT DISTINCT 
    dis.id_discente AS idDiscente, 
    dis.matricula AS matricula, 
    p.nome AS nomeEstudante, 
    p.cpf_cnpj AS cpf,
    e.nome AS nomeUnidade, 
    ee.denominacao AS nomeEtapaEnsino, 
    s.descricao AS nomeSerie, 
    ts.nome AS nomeTurma, 
    d.nome AS nomeDisciplina,
    ff.data AS data, 
    ff.frequencia AS falta, 
    (ff.abonada_escola_bool OR ff.abonada_bool) AS abonada,
    -- Lógica do Motivo do Abono (Mais Limpa)
    CASE 
        -- 1. Motivo ligado diretamente à falta (fa.id_motivo...)
        WHEN (ff.abonada_escola_bool OR ff.abonada_bool) AND ff.id_motivo_fa IS NOT NULL THEN 
            '(' || mbf.codigo || ') ' || mbf.denominacao
        -- 2. Motivo ligado ao Abono (af.id_motivo...)
        WHEN (ff.abonada_escola_bool OR ff.abonada_bool) AND ma.id_motivo_af IS NOT NULL THEN 
            '(' || mbf2.codigo || ') ' || mbf2.denominacao
        -- 3. Justificativa do Abono (af.justificativa)
        WHEN (ff.abonada_escola_bool OR ff.abonada_bool) AND (ma.justificativa IS NOT NULL AND TRIM(ma.justificativa) <> '') THEN 
            ma.justificativa
        ELSE '' 
    END AS motivoAbono
FROM FrequenciaFiltrada ff
JOIN discente dis ON dis.id_discente = ff.id_discente
JOIN comum.pessoa p ON p.id_pessoa = dis.id_pessoa
-- Joins para obter informações de Turma/Disciplina (usando o id_turma pré-filtrado)
JOIN ensino.turma t ON t.id_turma = ff.id_turma AND t.id_situacao_turma <> 4 
JOIN ensino.componente_curricular d ON d.id_componente_curricular = t.id_disciplina AND d.ativo = TRUE
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie AND ts.ativo = TRUE
JOIN escola.escola e ON e.id_escola = ts.id_escola
JOIN basico.serie s ON s.id_serie = ts.id_serie AND s.ativo = TRUE
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino AND ee.ativo = TRUE
-- LEFT JOINs para motivos
LEFT JOIN MotivosAbono ma ON ma.id_frequencia = ff.id_frequencia
LEFT JOIN basico.motivo_baixa_frequencia mbf ON mbf.id_motivo_baixa_frequencia = ff.id_motivo_fa
LEFT JOIN basico.motivo_baixa_frequencia mbf2 ON mbf2.id_motivo_baixa_frequencia = ma.id_motivo_af
ORDER BY p.nome, ff.data, ee.denominacao, s.descricao, ts.nome, d.nome
LIMIT 100;


