WITH datas_calendario AS ( SELECT 1 AS bimestre, ce.inicio_bim_1 AS inicio_bim, ce.fim_bim_1 AS fim_bim
FROM basico.calendario_escolar ce
WHERE ce.ano = 2026
AND ativo
UNION ALL SELECT 2 AS bimestre, ce.inicio_bim_2 AS inicio_bim, ce.fim_bim_2 AS fim_bim
FROM basico.calendario_escolar ce
WHERE ce.ano = 2026
AND ativo
UNION ALL SELECT 3 AS bimestre, ce.inicio_bim_3 AS inicio_bim, ce.fim_bim_3 AS fim_bim
FROM basico.calendario_escolar ce
WHERE ce.ano = 2026
AND ativo
UNION ALL SELECT 4 AS bimestre, ce.inicio_bim_4 AS inicio_bim, ce.fim_bim_4 AS fim_bim
FROM basico.calendario_escolar ce
WHERE ce.ano = 2026
AND ativo ), levantamento_mes AS ( SELECT mes.id_matricula_discente_serie, mes.id_estudante, COALESCE(ts.nome, 'NÃO ALOCADO EM TURMA') AS turma, lfts.id_componente, COALESCE(ts.id_escola, eees.id_escola) AS id_escola, s.descricao AS serie, CASE WHEN 1 = 1
    AND 2026 = 2023
    AND ts.id_escola IN (53279324, 52927029) THEN 100
    ELSE COALESCE(round(((CAST(lfts.aulas_com_frequencia AS NUMERIC)* 100)/ lfts.aulas), 2), 0) END AS frequencia_concluida, CASE WHEN 1 = 1
        AND 2026 = 2023
        AND ts.id_escola IN (53279324, 52927029) THEN 'completo'
        ELSE COALESCE(lfts.frequencias, 'NA') END AS situacao_frequencia_turma
    FROM basico.matricula_estudante_serie mes
    JOIN basico.turma_serie ts ON
        ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
    LEFT JOIN levantamento_frequencia_turma_serie_temp_1789063743942 lfts ON
        lfts.id_turma_serie = mes.id_turma_serie
    JOIN escola.escola_etapa_ensino_serie eees ON
        eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
    LEFT JOIN basico.serie s ON
        s.id_serie = COALESCE(ts.id_serie, eees.id_serie)
            AND s.id_serie <> 58413194
            AND s.id_etapa_ensino <> 14
        WHERE mes.id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 12 )
                AND mes.ano_calendario = 2026
                AND mes.id_turma_serie IS NOT NULL
                AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= (SELECT max(fim_bim)
            FROM datas_calendario
            WHERE bimestre = 1)
                AND COALESCE(ts.id_escola, eees.id_escola) = 52232868 ) 
    SELECT DISTINCT e.codigo_inep AS codigo_inep, e.nome AS escola, mes.turma, cc.nome AS componente, d.matricula AS matricula, p.nome AS nome, p.codigo_inep AS inep_aluno, mes.serie, 1 || ' bim' AS apontamento, mes.frequencia_concluida, mes.situacao_frequencia_turma
FROM levantamento_mes mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN escola.escola e ON
e.id_escola = mes.id_escola
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mes.id_componente
LEFT JOIN ensino.solicitacao_dispensa_estudante sde ON
sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND sde.id_status_solicitacao_dispensa_estudante = 2
AND sde.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON
sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
AND sdec.id_componente_curricular = cc.id_componente_curricular
AND sdec.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON
sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
AND sdeu.unidade = 1
AND sdeu.ativo
WHERE TRUE
AND mes.frequencia_concluida < 100
AND (sde.id_solicitacao_dispensa_estudante IS NULL
    OR sdec.id_solicitacao_dispensa_estudante_componente IS NULL
    OR sdeu.id_solicitacao_dispensa_estudante_unidade IS NULL)
ORDER BY e.nome, mes.serie, p.nome;

SELECT * FROM discente d WHERE d.matricula = '202430080562';

SELECT * FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 1402680;

