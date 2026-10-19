WITH datas_calendario AS ( 
    SELECT 1 AS bimestre, ce.inicio_bim_1 AS inicio_bim, ce.fim_bim_1 AS fim_bim
    FROM basico.calendario_escolar ce
    WHERE ce.ano = 2026 AND ativo
    UNION ALL 
    SELECT 2 AS bimestre, ce.inicio_bim_2 AS inicio_bim, ce.fim_bim_2 AS fim_bim
    FROM basico.calendario_escolar ce
    WHERE ce.ano = 2026 AND ativo
    UNION ALL 
    SELECT 3 AS bimestre, ce.inicio_bim_3 AS inicio_bim, ce.fim_bim_3 AS fim_bim
    FROM basico.calendario_escolar ce
    WHERE ce.ano = 2026 AND ativo
    UNION ALL 
    SELECT 4 AS bimestre, ce.inicio_bim_4 AS inicio_bim, ce.fim_bim_4 AS fim_bim
    FROM basico.calendario_escolar ce
    WHERE ce.ano = 2026 AND ativo 
), 
levantamento_mes AS ( 
    SELECT 
        mes.id_matricula_discente_serie, 
        mes.id_estudante, 
        COALESCE(ts.nome, 'NÃO ALOCADO EM TURMA') AS turma, 
        lfts.id_componente, 
        COALESCE(ts.id_escola, eees.id_escola) AS id_escola, 
        s.descricao AS serie, 
        CASE 
            WHEN 1 = 1 AND 2026 = 2023 AND ts.id_escola IN (53279324, 52927029) THEN 100
            ELSE COALESCE(round(((CAST(lfts.aulas_com_frequencia AS NUMERIC)* 100)/ lfts.aulas), 2), 0) 
        END AS frequencia_concluida, 
        CASE 
            WHEN 1 = 1 AND 2026 = 2023 AND ts.id_escola IN (53279324, 52927029) THEN 'completo'
            ELSE COALESCE(lfts.frequencias, 'NA') 
        END AS situacao_frequencia_turma
    FROM basico.matricula_estudante_serie mes
    JOIN basico.turma_serie ts ON ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
    LEFT JOIN levantamento_frequencia_turma_serie_temp_1789063743942 lfts ON lfts.id_turma_serie = mes.id_turma_serie
    JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
    LEFT JOIN basico.serie s ON s.id_serie = COALESCE(ts.id_serie, eees.id_serie)
        AND s.id_serie <> 58413194
        AND s.id_etapa_ensino <> 14
    WHERE mes.id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 12 )
        AND mes.ano_calendario = 2026
        AND mes.id_turma_serie IS NOT NULL
        AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= (
            SELECT max(fim_bim)
            FROM datas_calendario
            WHERE bimestre = 1
        )
        AND COALESCE(ts.id_escola, eees.id_escola) = 52232868 
) 
SELECT DISTINCT mes,
    e.codigo_inep AS codigo_inep, 
    e.nome AS escola, 
    mes.turma, 
    cc.nome AS componente, 
    d.matricula AS matricula, 
    p.nome AS nome, 
    p.codigo_inep AS inep_aluno, 
    mes.serie, 
    '1 bim' AS apontamento, 
    mes.frequencia_concluida, 
    mes.situacao_frequencia_turma
FROM levantamento_mes mes
JOIN public.discente d ON d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
LEFT JOIN escola.escola e ON e.id_escola = mes.id_escola
LEFT JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = mes.id_componente
LEFT JOIN ensino.solicitacao_dispensa_estudante sde ON sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
    AND sde.id_status_solicitacao_dispensa_estudante = 2
    AND sde.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
    AND sdec.id_componente_curricular = cc.id_componente_curricular
    AND sdec.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
    AND sdeu.unidade = 1
    AND sdeu.ativo
WHERE TRUE
    -- 1. RETIRADO: mes.frequencia_concluida < 100 
    -- (Ao comentar/remover essa linha, a consulta trará o aluno mesmo se a frequência for 100%)
    -- 2. ADICIONADO: Filtro para buscar apenas um aluno específico.
    -- Substitui 'DIGITE_AQUI_A_MATRICULA' pela matrícula do aluno desejado:
    AND d.matricula = '202330023062'
    AND (sde.id_solicitacao_dispensa_estudante IS NULL
        OR sdec.id_solicitacao_dispensa_estudante_componente IS NULL
        OR sdeu.id_solicitacao_dispensa_estudante_unidade IS NULL)
ORDER BY e.nome, mes.serie, p.nome;


(1597886,1018882,EIPRMG4A,220,52232868,"GRUPO 4",98.04,pendente)


SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_matricula_discente_serie = 1597886;


84521063

1018882


SELECT * 
FROM ensino.frequencia_aluno fa 
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE fa.id_discente = 1018882
AND t.id_turma_serie = 84521063
AND fa."data" >= '2026-02-04 2026-04-24' ee fa.DATA <= 2026-04-24

-- Consulta de frequências do estudante no 1º Bimestre
SELECT 
   fa.*
FROM ensino.frequencia_aluno fa 
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE fa.id_discente = 1402532
  AND t.id_turma_serie = 84521063
  -- Filtra as frequências entre o início e o fim do 1º Bimestre
  AND fa.data BETWEEN '2026-02-04' AND '2026-04-24'
ORDER BY fa.data ASC;



-- CONSULTA DE AUDITORIA DE FREQUÊNCIA DO 1º BIMESTRE PARA UM ESTUDANTE ESPECÍFICO
WITH datas_calendario AS ( 
    -- Obtém o período exato do 1º Bimestre para o ano letivo de 2026
    SELECT 
        ce.inicio_bim_1 AS inicio_bim, 
        ce.fim_bim_1 AS fim_bim
    FROM basico.calendario_escolar ce
    WHERE ce.ano = 2026 AND ce.ativo
    LIMIT 1
),
levantamento_aluno AS ( 
    SELECT 
        mes.id_matricula_discente_serie, 
        mes.id_estudante, 
        COALESCE(ts.nome, 'NÃO ALOCADO EM TURMA') AS turma, 
        --lfts.id_componente, 
        COALESCE(ts.id_escola, eees.id_escola) AS id_escola, 
        s.descricao AS serie,
        -- Aulas ministradas/registradas e aulas com frequência
       -- lfts.aulas AS total_aulas,
        --lfts.aulas_com_frequencia AS aulas_com_frequencia,
        -- Cálculo da frequência concluída (%)
        CASE 
            WHEN 1 = 1 AND 2026 = 2023 AND ts.id_escola IN (53279324, 52927029) THEN 100
           --ELSE COALESCE(ROUND(((CAST(lfts.aulas_com_frequencia AS NUMERIC) * 100.0) / NULLIF(lfts.aulas, 0)), 2), 0) 
        END AS frequencia_concluida
        --COALESCE(lfts.frequencias, 'NA') AS situacao_frequencia_turma
    FROM basico.matricula_estudante_serie mes
    JOIN basico.turma_serie ts ON ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
    AND ts.id_turma_serie = 84521063
    --LEFT JOIN levantamento_frequencia_turma_serie_temp_1789063743942 lfts ON lfts.id_turma_serie = mes.id_turma_serie
    JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
    LEFT JOIN basico.serie s ON s.id_serie = COALESCE(ts.id_serie, eees.id_serie)
        AND s.id_serie <> 58413194
        AND s.id_etapa_ensino <> 14
    WHERE mes.id_situacao_matricula_serie NOT IN (4, 5, 6, 9, 12)
      AND mes.ano_calendario = 2026
      AND mes.id_turma_serie IS NOT NULL
      AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= (SELECT fim_bim FROM datas_calendario)
      AND COALESCE(ts.id_escola, eees.id_escola) = 52232868
)
SELECT DISTINCT 
    e.codigo_inep AS codigo_inep, 
    e.nome AS escola, 
    la.turma, 
    --cc.nome AS componente_curricular, 
    d.matricula AS matricula, 
    p.nome AS nome_aluno, 
   -- la.serie, 
    '1º Bimestre' AS apontamento,
    --la.total_aulas,
    --la.aulas_com_frequencia,
    --la.frequencia_concluida AS percentual_frequencia_concluida,
    -- Status do Relatório: Identifica claramente se há pendência
    CASE 
        WHEN (sde.id_solicitacao_dispensa_estudante IS NOT NULL 
              AND sdec.id_solicitacao_dispensa_estudante_componente IS NOT NULL 
              AND sdeu.id_solicitacao_dispensa_estudante_unidade IS NOT NULL) THEN 'DISPENSADO'
        WHEN la.frequencia_concluida >= 100 THEN 'COMPLETO (SEM PENDÊNCIA)'
        ELSE 'PENDENTE'
    END AS status_relatorio
FROM levantamento_aluno la
JOIN public.discente d ON d.id_discente = la.id_estudante
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
LEFT JOIN escola.escola e ON e.id_escola = la.id_escola
--LEFT JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = la.id_componente
-- Verificação de Dispensa de Disciplina
LEFT JOIN ensino.solicitacao_dispensa_estudante sde ON sde.id_matricula_estudante_serie = la.id_matricula_discente_serie
    AND sde.id_status_solicitacao_dispensa_estudante = 2
    AND sde.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
    --AND sdec.id_componente_curricular = cc.id_componente_curricular
    AND sdec.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
    AND sdeu.unidade = 1
    AND sdeu.ativo
WHERE d.id_discente = 1018882; -- Insira aqui o id_discente do aluno a analisar
ORDER BY cc.nome;


select p.nome,
        u.login, t.codigo 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma_serie = 84521063;
