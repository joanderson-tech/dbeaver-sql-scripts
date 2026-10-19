WITH calendario AS ( SELECT ce.id_calendario_escolar, ce.regime_letivo, ce.inicio_bim_1, ce.fim_bim_1, ce.inicio_bim_2, ce.fim_bim_2, ce.inicio_bim_3, ce.fim_bim_3, ce.inicio_bim_4, ce.fim_bim_4, ce.inicio_tri_1, ce.fim_tri_1, ce.inicio_tri_2, ce.fim_tri_2, ce.inicio_tri_3, ce.fim_tri_3
FROM basico.calendario_escolar ce
WHERE ce.ano = 2026
LIMIT 1 ), extensao_calendario AS ( SELECT ext.id_escola, ext.regime_letivo, ext.inicio_bim_1, ext.fim_bim_1, ext.inicio_bim_2, ext.fim_bim_2, ext.inicio_bim_3, ext.fim_bim_3, ext.inicio_bim_4, ext.fim_bim_4, ext.inicio_tri_1, ext.fim_tri_1, ext.inicio_tri_2, ext.fim_tri_2, ext.inicio_tri_3, ext.fim_tri_3
FROM diario.extensao_calendario_escolar ext
JOIN calendario c ON
c.id_calendario_escolar = ext.id_calendario_escolar
WHERE ext.validado = TRUE
AND ext.ativo = TRUE ), turmas_com_matricula AS ( SELECT DISTINCT mes.id_turma_serie AS id_turma_serie_match
FROM basico.matricula_estudante_serie mes
WHERE mes.id_situacao_matricula_serie = 1 ), docentes_turma AS ( SELECT t.id_turma, t.codigo AS turma_codigo, t.id_turma_serie, cc.nome AS componente, ts.id_escola, ts.id_turno, p.nome AS professor_nome, dt.id_docente_turma, dt.data_cadastro AS professor_data_cadastro, dt.data_inicio AS professor_data_inicio, dt.data_fim AS professor_data_fim, COUNT(*) OVER (PARTITION BY t.id_turma) AS qtd_professores_turma
FROM ensino.docente_turma dt
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
JOIN rh.servidor s ON
s.id_servidor = dt.id_docente
JOIN comum.pessoa p ON
p.id_pessoa = s.id_pessoa
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
JOIN turmas_com_matricula tcm ON
tcm.id_turma_serie_match = t.id_turma_serie
WHERE t.ano = 2026
AND t.id_situacao_turma = 1
AND dt.ativo
AND (dt.data_fim IS NULL
    OR dt.data_fim::date >= CURRENT_DATE)
AND ts.id_serie <> 58413194
AND t.id_disciplina <> 437
AND s.id_servidor = 712
AND ts.id_serie = 1005222 ), escolas_turma AS ( SELECT DISTINCT id_escola
FROM docentes_turma ), periodo_por_escola AS ( SELECT et.id_escola, CASE WHEN ec.id_escola IS NOT NULL THEN CASE WHEN ec.regime_letivo = 'T' THEN CASE 2 WHEN 1 THEN ec.inicio_tri_1
WHEN 2 THEN ec.inicio_tri_2
WHEN 3 THEN ec.inicio_tri_3 END
ELSE CASE 2 WHEN 1 THEN ec.inicio_bim_1
WHEN 2 THEN ec.inicio_bim_2
WHEN 3 THEN ec.inicio_bim_3
WHEN 4 THEN ec.inicio_bim_4 END END
ELSE CASE WHEN c.regime_letivo = 'B' THEN CASE 2 WHEN 1 THEN c.inicio_bim_1
WHEN 2 THEN c.inicio_bim_2
WHEN 3 THEN c.inicio_bim_3
WHEN 4 THEN c.inicio_bim_4 END
ELSE CASE 2 WHEN 1 THEN c.inicio_tri_1
WHEN 2 THEN c.inicio_tri_2
WHEN 3 THEN c.inicio_tri_3 END END END AS inicio, CASE WHEN ec.id_escola IS NOT NULL THEN CASE WHEN ec.regime_letivo = 'T' THEN CASE 2 WHEN 1 THEN ec.fim_tri_1
WHEN 2 THEN ec.fim_tri_2
WHEN 3 THEN ec.fim_tri_3 END
ELSE CASE 2 WHEN 1 THEN ec.fim_bim_1
WHEN 2 THEN ec.fim_bim_2
WHEN 3 THEN ec.fim_bim_3
WHEN 4 THEN ec.fim_bim_4 END END
ELSE CASE WHEN c.regime_letivo = 'B' THEN CASE 2 WHEN 1 THEN c.fim_bim_1
WHEN 2 THEN c.fim_bim_2
WHEN 3 THEN c.fim_bim_3
WHEN 4 THEN c.fim_bim_4 END
ELSE CASE 2 WHEN 1 THEN c.fim_tri_1
WHEN 2 THEN c.fim_tri_2
WHEN 3 THEN c.fim_tri_3 END END END AS fim
FROM escolas_turma et
LEFT JOIN extensao_calendario ec ON
ec.id_escola = et.id_escola
CROSS JOIN calendario c ) , periodo_base AS ( SELECT dtb.id_turma, dtb.turma_codigo, dtb.id_turma_serie, dtb.componente, dtb.id_escola, dtb.id_turno, dtb.professor_nome, dtb.professor_data_cadastro, 2 AS unidade, CASE WHEN dtb.qtd_professores_turma > 1
    OR FALSE THEN GREATEST(pe.inicio, COALESCE(dtb.professor_data_inicio::date, pe.inicio))
    ELSE pe.inicio END AS periodo_inicio_raw, CASE WHEN dtb.qtd_professores_turma > 1
        OR FALSE THEN LEAST(pe.fim, COALESCE(dtb.professor_data_fim::date, pe.fim), CURRENT_DATE)
        ELSE LEAST(pe.fim, CURRENT_DATE) END AS periodo_fim
    FROM docentes_turma dtb
    JOIN periodo_por_escola pe ON
        pe.id_escola = dtb.id_escola ), periodo_alocado AS ( SELECT *, ROW_NUMBER() OVER (PARTITION BY id_turma
ORDER BY professor_data_cadastro DESC) AS rn_mais_recente_no_periodo
FROM periodo_base
WHERE periodo_inicio_raw <= periodo_fim ), periodo_responsabilidade AS ( SELECT id_turma, turma_codigo, id_turma_serie, componente, id_escola, id_turno, professor_nome, unidade, periodo_inicio, periodo_fim
FROM( SELECT id_turma, turma_codigo, id_turma_serie, componente, id_escola, id_turno, professor_nome, unidade, CASE WHEN rn_mais_recente_no_periodo = 1 THEN LEAST( periodo_inicio_raw, COALESCE( (LAG(periodo_fim) OVER (PARTITION BY id_turma ORDER BY periodo_inicio_raw) + INTERVAL '1 day')::date, periodo_inicio_raw ) )
ELSE periodo_inicio_raw END AS periodo_inicio, periodo_fim
FROM periodo_alocado ) sub
WHERE periodo_inicio <= periodo_fim ), dias_horario AS ( SELECT pr.id_turma, pr.turma_codigo, pr.id_turma_serie, pr.componente, pr.id_escola, pr.professor_nome, pr.unidade, gs::date AS DATA
FROM periodo_responsabilidade pr
JOIN ensino.horario_turma ht ON
ht.id_turma = pr.id_turma
AND (ht.ativo
    OR ht.data_alteracao IS NOT NULL)
CROSS JOIN LATERAL generate_series(pr.periodo_inicio, pr.periodo_fim, INTERVAL '1 day') AS gs
WHERE ht.dia::int = (EXTRACT(DOW FROM gs)::int + 1)
AND gs::date BETWEEN CASE WHEN ht.ativo 
AND ht.data_alteracao IS NULL THEN pr.periodo_inicio
ELSE COALESCE(ht.data_inicio, pr.periodo_inicio) END
    AND CASE WHEN ht.data_alteracao IS NOT NULL THEN ht.data_alteracao::date
    ELSE COALESCE(pr.periodo_fim) END ), dias_extra AS ( SELECT pr.id_turma, pr.turma_codigo, pr.id_turma_serie, pr.componente, pr.id_escola, pr.professor_nome, pr.unidade, ae.data_aula AS DATA
FROM ava.aula_extra ae
JOIN periodo_responsabilidade pr ON
pr.id_turma = ae.id_turma
AND ae.data_aula BETWEEN pr.periodo_inicio AND pr.periodo_fim ), dias_letivos_candidatos AS ( SELECT *
FROM dias_horario
UNION SELECT *
FROM dias_extra ), dias_letivos AS ( SELECT dlc.*
FROM dias_letivos_candidatos dlc
WHERE NOT EXISTS (SELECT 1
FROM comum.feriado f
WHERE f.data_feriado = dlc.data)
AND NOT EXISTS ( SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = dlc.id_escola
AND ie.ativo
AND dlc.data BETWEEN ie.inicio::date AND ie.fim::date ) ), pendencia_final AS ( SELECT DISTINCT e2.nome AS escola, dl.turma_codigo AS turma, dl.componente AS componente, dl.professor_nome AS professor, dl.unidade AS unidade, dl.data AS DATA, 'SIM' AS pendente
FROM dias_letivos dl
JOIN escola.escola e2 ON
e2.id_escola = dl.id_escola
WHERE NOT EXISTS ( SELECT 1
FROM ava.topico_aula ta
WHERE ta.id_turma = dl.id_turma
AND ta.data = dl.data
AND ta.ativo = TRUE
AND ta.programado = FALSE
AND ta.conteudo_ministrado IS NOT NULL
AND ta.conteudo_ministrado ~ '\S' ) ) SELECT escola, turma, componente, professor, unidade, DATA, to_char(DATA, 'DD/MM/YYYY') AS data_formatada, pendente, COUNT(*) OVER() AS total_registros
FROM pendencia_final
ORDER BY escola, professor, turma, componente, DATA
LIMIT 100 OFFSET 0;