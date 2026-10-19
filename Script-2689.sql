-- ============================================================================
-- CONSULTA OTIMIZADA PARA GERAÇÃO DE ARQUIVO
-- ============================================================================

WITH cte_periodo AS (
    -- Obtém o período máximo ativo para o ano corrente de forma rápida
    SELECT MAX(periodo) AS max_periodo
    FROM basico.turma_serie
    WHERE ano = 2026 AND ativo = TRUE
),
cte_faltas AS (
    -- Agrupa faltas apenas das turmas do ano de 2026
    SELECT 
        fa.id_discente, 
        t.id_turma_serie, 
        COALESCE(SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS total_faltas
    FROM ensino.frequencia_aluno fa
    INNER JOIN ensino.turma t ON t.id_turma = fa.id_turma
    WHERE t.ano = 2026 
      AND t.id_situacao_turma <> 4 
      AND fa.ativo = TRUE 
      AND fa.frequencia > 0
    GROUP BY fa.id_discente, t.id_turma_serie
),
cte_qtd_salas AS (
    -- Contagem rápida de salas agrupadas por escola
    SELECT id_escola, COUNT(*) AS total_salas
    FROM ambiente.ambiente_unidade_escolar
    GROUP BY id_escola
)
SELECT 
    e.codigo_inep, 
    ts.nome AS nome_turma, 
    -- Mapeamento de Período
    CASE 
        WHEN ee.periodicidade_etapa = 'ANUAL' THEN 0
        WHEN ee.periodicidade_etapa = 'SEMESTRAL' AND ts.periodo = 1 THEN 1
        WHEN ee.periodicidade_etapa = 'SEMESTRAL' AND ts.periodo = 2 THEN 2 
    END AS periodo, 
    -- Mapeamento de Turno
    CASE 
        WHEN trn.descricao ILIKE '%MATUTINO%' OR trn.descricao ILIKE '%INTERMEDIARIO%' THEN 1
        WHEN trn.descricao ILIKE '%VESPERTINO%' THEN 2
        WHEN trn.descricao ILIKE '%NOTURNO%' THEN 3
        WHEN trn.descricao ILIKE '%INTEGRAL%' THEN 4 
    END AS turno, 
    sts.codigo AS idSerie, 
    -- Mapeamento de Modalidade
    CASE 
        WHEN ee.id_modalidade <> 2 AND ee.id_nivel_etapa = 51918782 THEN 1
        WHEN ee.id_modalidade <> 2 AND ee.id_nivel_etapa IN (1, 2) THEN 2
        WHEN ee.id_modalidade <> 2 AND ee.id_nivel_etapa = 3 THEN 3
        WHEN ee.id_modalidade = 2 THEN 4 
    END AS modalidade, 
    d.matricula, 
    TO_CHAR(COALESCE(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') AS data_matricula, 
    COALESCE(f.total_faltas, 0) AS faltas,
    (mes.id_situacao_matricula_serie = 2) AS aprovado, 
    p.cpf_cnpj, 
    p.data_nascimento, 
    p.nome, 
    -- Subconsulta direta e leve para checar Necessidades Especiais (substitui a CTE gigante)
    EXISTS (
        SELECT 1 
        FROM comum.pessoa_necessidade_especial pne 
        WHERE pne.id_pessoa = p.id_pessoa
    ) AS pessoa_com_ne, 
    -- Mapeamento de Sexo
    CASE 
        WHEN p.sexo = 'M' THEN 1
        WHEN p.sexo = 'F' THEN 2
        ELSE 3 
    END AS sexo,
    (CAST(ht.dia AS INT) - 1) AS dia_semana, 
    h.inicio AS hora_inicio, 
    cc.nome AS disciplina, 
    p_prof.cpf_cnpj AS cpf_cnpj_professor,
    (t.id_situacao_turma = 3) AS turma_finalizada, 
    FALSE AS multisseriada, 
    COALESCE(qs.total_salas, 0) AS qtdSalas, 
    aue.nome_numero
FROM escola.escola e
INNER JOIN comum.unidade u ON u.id_unidade = e.id_unidade_escola
INNER JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
INNER JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie s ON s.id_serie = ts.id_serie
INNER JOIN basico.mapeamento_series_tce_se mssts ON mssts.id_serie = ts.id_serie
INNER JOIN basico.series_tce_se sts ON sts.id = mssts.id_serie_tce AND sts.ativo = TRUE
INNER JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
CROSS JOIN cte_periodo cp
INNER JOIN ensino.turno trn ON trn.id_turno = ts.id_turno
INNER JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.estudante est ON est.id_estudante = mes.id_estudante
INNER JOIN discente d ON d.id_discente = est.id_estudante
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
INNER JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
INNER JOIN ensino.horario h ON h.id_horario = ht.id_horario
INNER JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
INNER JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma
INNER JOIN rh.servidor serv ON serv.id_servidor = dt.id_docente
INNER JOIN comum.pessoa p_prof ON p_prof.id_pessoa = serv.id_pessoa
-- Junções Otimizadas
LEFT JOIN cte_faltas f ON f.id_discente = d.id_discente AND f.id_turma_serie = ts.id_turma_serie
LEFT JOIN cte_qtd_salas qs ON qs.id_escola = e.id_escola
LEFT JOIN ambiente.ambiente_unidade_escolar aue ON aue.id_escola = e.id_escola
-- Filtros de Alta Performance
WHERE u.ativo = TRUE
  AND ts.ativo = TRUE
  AND ht.ativo = TRUE
  AND dt.ativo = TRUE
  AND p.data_nascimento <= '2024-08-30'
  AND t.id_situacao_turma <> 4
  AND mes.ano_calendario = 2026
  AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
  AND (ts.periodo = cp.max_periodo OR ee.periodicidade_etapa = 'ANUAL')
-- Ordenação Mantida
ORDER BY e.codigo_inep, periodo, ts.nome, turno, d.matricula, dia_semana, hora_inicio;