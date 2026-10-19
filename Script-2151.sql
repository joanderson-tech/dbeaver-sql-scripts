/* RELATÓRIO DE PENDÊNCIAS - 2026
   Organizado por: Parceiro de Programação
*/

WITH turma_serie AS (
    SELECT ts.id_turma_serie
    FROM basico.turma_serie ts
    JOIN basico.serie s ON s.id_serie = ts.id_serie
    WHERE ts.ano = 2026
      AND s.id_serie <> 58413194
      AND s.id_etapa_ensino <> 14
      AND ts.id_escola = 72424364
),
datas_calendario AS (
    SELECT 1 AS bimestre, ce.inicio_bim_1 AS inicio_bim, ce.fim_bim_1 AS fim_bim FROM basico.calendario_escolar ce WHERE ce.ano = 2026 AND ativo
    UNION ALL 
    SELECT 2 AS bimestre, ce.inicio_bim_2 AS inicio_bim, ce.fim_bim_2 AS fim_bim FROM basico.calendario_escolar ce WHERE ce.ano = 2026 AND ativo
    UNION ALL 
    SELECT 3 AS bimestre, ce.inicio_bim_3 AS inicio_bim, ce.fim_bim_3 AS fim_bim FROM basico.calendario_escolar ce WHERE ce.ano = 2026 AND ativo
    UNION ALL 
    SELECT 4 AS bimestre, ce.inicio_bim_4 AS inicio_bim, ce.fim_bim_4 AS fim_bim FROM basico.calendario_escolar ce WHERE ce.ano = 2026 AND ativo
),
alocacoes_ativas AS (
    SELECT dt.id_turma, dt.id_docente, dt.id_docente_turma, p.nome AS professor
    FROM ensino.docente_turma dt
    JOIN rh.servidor s ON s.id_servidor = dt.id_docente
    JOIN comum.pessoa p ON p.id_pessoa = s.id_pessoa
    WHERE dt.ativo
      AND NOT dt.finalizada
      AND dt.data_inicio <= CURRENT_DATE
      AND CURRENT_DATE <= dt.data_fim
),
professor_turma AS (
    SELECT 
        t.id_turma, 
        COALESCE(dt.professor, dt_polivalente.professor, dt_multi.professor, dt_multi_polivalente.professor) AS professor
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    LEFT JOIN ensino.turma t_multi ON t_multi.id_turma_serie = ts.id_turma_serie_agrupadora AND t_multi.id_disciplina = t.id_disciplina
    LEFT JOIN alocacoes_ativas dt ON dt.id_turma = t.id_turma
    LEFT JOIN alocacoes_ativas dt_polivalente ON dt_polivalente.id_turma = t.id_turma_agrupadora
    LEFT JOIN alocacoes_ativas dt_multi ON dt_multi.id_turma = t_multi.id_turma
    LEFT JOIN alocacoes_ativas dt_multi_polivalente ON dt_multi_polivalente.id_turma = t_multi.id_turma_agrupadora
    WHERE t.id_situacao_turma <> 4 AND t.ano = 2026
),
notas AS (
    SELECT mc.id_turma AS turma, nu.nota AS nota
    FROM ensino.matricula_componente mc
    JOIN ensino.turma t ON t.id_turma = mc.id_turma
    JOIN turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = mc.id_discente 
        AND COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie) = t.id_turma_serie
    LEFT JOIN ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente 
        AND nu.ativo AND nu.id_descricao_nota = 21 AND nu.unidade = :bimestre_filtro
    WHERE mc.ano = 2026
      AND mc.id_situacao_matricula NOT IN (7, 3, 9, 4, 11)
      AND t.id_disciplina <> 220
      AND t.tipo <> 4
      AND mes.id_situacao_matricula_serie NOT IN (4, 5, 6, 9, 12)
      AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= (SELECT fim_bim FROM datas_calendario WHERE bimestre = :bimestre_filtro LIMIT 1)
),
relatorios_avaliativos AS (
    SELECT 
        mc.id_turma AS turma, 
        /*CASE 
            WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE
            WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE
            ELSE FALSE 
        END AS resposta
        */
        /* CASE 
            -- REGRA NOVA: Se for Descritivo (tipo 1) e NÃO for o 4º bimestre, 
            -- marcamos como TRUE (concluído) para NÃO exibir na listagem.
            WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND :bimestre_filtro < 4 THEN TRUE
            -- REGRA PARA O 4º BIMESTRE (ou componentes tipo 2):
            -- Só retorna TRUE se houver algo escrito ou opção selecionada.
            WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE
            WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE
            -- Se chegou aqui e não tem conteúdo no 4º bimestre, é FALSE (Pendência!)
            ELSE FALSE 
        END AS resposta*/
        CASE 
    WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND :bimestre_filtro < 4 THEN TRUE
    WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND :bimestre_filtro = 4 THEN (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL)
    WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 THEN (rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL)
    ELSE FALSE 
END AS resposta
    FROM ensino.matricula_componente mc
    JOIN ensino.turma t ON t.id_turma = mc.id_turma
    JOIN turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = mc.id_discente 
        AND COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie) = t.id_turma_serie
     JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_matricula_componente = mc.id_matricula_componente
    LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
    LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON ra.id_relatorio_avaliativo = rac.id_relatorio_avaliativo
    LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON rahr.id_relatorio_avaliativo_habilidade = mc.id_matricula_componente 
    AND rahr.periodo = :bimestre_filtro
    WHERE mc.ano = 2026 AND ra.ativo
    AND (ra.id_relatorio_avaliativo IS NULL OR ra.ativo)
),
levantamento_turmas AS (
    SELECT 
        e.codigo_inep AS codigo, 
        e.nome AS escola, 
        ee.denominacao AS curso, 
        s.descricao AS serie, 
        ts.nome AS turma, 
        pt.professor,
        CASE 
            WHEN ee.id_etapa_ensino IN (51876105, 51876110, 51876139) THEN 'concluído'
            WHEN ts.tipo_diario = 11 OR turma.id_disciplina = 220 THEN 'turma agrupadora'
            WHEN (CASE WHEN cbc.id_categoria_componente = 2 AND cb.possui_parte_diversificada THEN cb.tipo_diario_diversificado ELSE cb.tipo_diario END) IN (51, 52, 53) 
                THEN (SELECT CASE WHEN COALESCE(EVERY(n.nota IS NOT NULL), TRUE) THEN 'concluído' ELSE 'pendente' END FROM notas n WHERE n.turma = turma.id_turma)
            WHEN (CASE WHEN cbc.id_categoria_componente = 2 AND cb.possui_parte_diversificada THEN cb.tipo_diario_diversificado ELSE cb.tipo_diario END) IN (54) 
                THEN (SELECT CASE WHEN EVERY(r.resposta) THEN 'concluído' ELSE 'pendente' END FROM relatorios_avaliativos r WHERE r.turma = turma.id_turma)
        END AS apontamento_desempenho_concluido,
        ts.id_turno, 
        turma.id_disciplina, 
        ts.id_turma_serie
    FROM escola.escola e
    JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
    JOIN ensino.turma turma ON turma.id_turma_serie = ts.id_turma_serie
    JOIN professor_turma pt ON pt.id_turma = turma.id_turma
    JOIN basico.serie s ON s.id_serie = ts.id_serie
    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
    JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = ts.id_curriculo_medio
    JOIN basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = cb.id_curriculo_basico AND cbc.id_componente_curricular = turma.id_disciplina
    WHERE ts.ativo AND ts.ano = 2026 AND e.id_escola = 72424364
)
/* CONSULTA FINAL */
SELECT DISTINCT 
    lt.codigo, 
    lt.escola, 
    lt.curso, 
    lt.serie, 
    lt.turma, 
    t.descricao AS turno, 
    cc.nome AS componente_curricular, 
    lt.professor, 
    '1 bim' AS apontamento, 
    lt.apontamento_desempenho_concluido,
    lt.id_turma_serie 
FROM levantamento_turmas lt
JOIN ensino.turno t ON t.id_turno = lt.id_turno
JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = lt.id_disciplina
WHERE lt.apontamento_desempenho_concluido <> 'concluído'
  AND EXISTS ( 
      SELECT 1 FROM basico.matricula_estudante_serie mes 
      WHERE (mes.id_turma_serie = lt.id_turma_serie OR mes.id_turma_serie_multisseriado = lt.id_turma_serie)
        AND mes.ano_calendario = 2026 
        AND mes.id_situacao_matricula_serie NOT IN (4, 5, 6, 9, 12)
  )
ORDER BY lt.escola, lt.turma, cc.nome;