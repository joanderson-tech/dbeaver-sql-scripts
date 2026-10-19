ROLLBACK;

BEGIN;

WITH  turma_serie AS (   SELECT id_turma_serie   FROM basico.turma_serie ts      JOIN  basico.serie s ON s.id_serie = ts.id_serie     WHERE ts.ano =2026       and s.descricao not ilike '%EE%'       and s.descricao not ilike '%ESPECIAL%'  AND ts.id_escola = 52232984 ),   datas_calendario AS (     SELECT        1 AS bimestre,        ce.inicio_bim_1 AS inicio_bim,        ce.fim_bim_1 AS fim_bim     FROM basico.calendario_escolar ce      WHERE ce.ano = 2026        AND ativo     UNION ALL     SELECT         2 AS bimestre,        ce.inicio_bim_2 AS inicio_bim,        ce.fim_bim_2 AS fim_bim     FROM basico.calendario_escolar ce      WHERE ce.ano = 2026        AND ativo     UNION ALL     SELECT         3 AS bimestre,        ce.inicio_bim_3 AS inicio_bim,        ce.fim_bim_3 AS fim_bim     FROM basico.calendario_escolar ce     WHERE ce.ano = 2026        AND ativo     UNION ALL     SELECT         4 AS bimestre,        ce.inicio_bim_4 AS inicio_bim,        ce.fim_bim_4 AS fim_bim     FROM basico.calendario_escolar ce     WHERE ce.ano = 2026        AND ativo ),  matriculas_ativas AS (  SELECT mes.id_matricula_discente_serie, mes.id_estudante,     COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie) AS id_turma_serie,     COALESCE(ts.nome, 'NÃO ALOCADO EM TURMA') AS turma, COALESCE(ts.id_escola, eees.id_escola) AS id_escola,     s.descricao AS serie, cb.tipo_diario, cb.tipo_diario_diversificado  FROM basico.matricula_estudante_serie mes  JOIN basico.turma_serie ts ON ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)  JOIN turma_serie tss ON tss.id_turma_serie = ts.id_turma_serie  LEFT JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = ts.id_curriculo_medio  JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola  LEFT JOIN basico.serie s ON s.id_serie = COALESCE(ts.id_serie, eees.id_serie)  WHERE mes.id_situacao_matricula_serie NOT IN  ( 4,5,6,9,12 )     AND mes.ano_calendario = 2026 AND mes.id_turma_serie is not null     AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= (SELECT max(fim_bim) FROM datas_calendario WHERE bimestre = 2)  AND COALESCE(ts.id_escola, eees.id_escola) = 52232984    AND NOT (2 = 1 AND 2026 = 2023 AND ts.id_escola IN (53279324, 52927029))     AND (s.id_etapa_ensino IS NULL OR s.id_etapa_ensino NOT IN (51876105,51876110,51876139))  ) SELECT * INTO matriculas_ativas_avaliacao_temp_1784051414523 FROM matriculas_ativas;  CREATE INDEX idx_maa_1784051414523_mat ON matriculas_ativas_avaliacao_temp_1784051414523 (id_matricula_discente_serie);  CREATE INDEX idx_maa_1784051414523_esttur ON matriculas_ativas_avaliacao_temp_1784051414523 (id_estudante, id_turma_serie);  CREATE INDEX idx_maa_1784051414523_tipo ON matriculas_ativas_avaliacao_temp_1784051414523 (tipo_diario, tipo_diario_diversificado);  ANALYZE matriculas_ativas_avaliacao_temp_1784051414523; 
 
SELECT ma.id_matricula_discente_serie, ma.id_estudante, ma.turma AS turma_serie, ma.id_escola, ma.serie,     ma.tipo_diario, ma.tipo_diario_diversificado, mc.id_turma AS turma, mc.id_matricula_componente,     mc.id_componente_curricular AS id_componente, cc.nome AS componente, t.id_categoria_componente AS categoria,     cc.id_tipo_componente AS tipo_componente, sde.id_solicitacao_dispensa_estudante,     sdec.id_solicitacao_dispensa_estudante_componente,     sdeu.id_solicitacao_dispensa_estudante_unidade AS id_dispensa_unidade_ativa,     sdeu_relatorio.id_solicitacao_dispensa_estudante_unidade AS id_dispensa_unidade_relatorio  INTO matriculas_componentes_avaliacao_temp_1784051414523 FROM matriculas_ativas_avaliacao_temp_1784051414523 ma  JOIN ensino.matricula_componente mc ON mc.id_discente = ma.id_estudante  JOIN ensino.turma t ON t.id_turma = mc.id_turma AND t.id_turma_serie = ma.id_turma_serie  JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = mc.id_componente_curricular  LEFT JOIN ensino.solicitacao_dispensa_estudante sde     ON sde.id_matricula_estudante_serie = ma.id_matricula_discente_serie     AND sde.id_status_solicitacao_dispensa_estudante = 2     AND sde.ativo  LEFT JOIN ensino.solicitacao_dispensa_estudante_componente sdec     ON sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante     AND sdec.id_componente_curricular = mc.id_componente_curricular AND sdec.ativo  LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu     ON sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente     AND sdeu.unidade = 2 AND sdeu.ativo  LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu_relatorio     ON sdeu_relatorio.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente     AND sdeu_relatorio.unidade = 2  WHERE mc.ano = 2026     AND mc.id_situacao_matricula NOT IN  ( 7,3,9,4,11 )     AND t.id_disciplina <> 220     AND t.tipo <> 4     AND t.ano = 2026     AND t.id_situacao_turma <> 4;  CREATE INDEX idx_mca_1784051414523_mat ON matriculas_componentes_avaliacao_temp_1784051414523 (id_matricula_discente_serie);  CREATE INDEX idx_mca_1784051414523_mc ON matriculas_componentes_avaliacao_temp_1784051414523 (id_matricula_componente);  CREATE INDEX idx_mca_1784051414523_tipo ON matriculas_componentes_avaliacao_temp_1784051414523 (tipo_diario, tipo_diario_diversificado, categoria);  ANALYZE matriculas_componentes_avaliacao_temp_1784051414523; 
  
SELECT base.id_matricula_discente_serie, base.componente, base.categoria,     CASE WHEN EVERY(nu.nota IS NOT NULL) THEN 'concluído' ELSE 'pendente' END AS apontamento  INTO lev_notas_avaliacao_temp_1784051414523 FROM matriculas_componentes_avaliacao_temp_1784051414523 base  LEFT JOIN ensino.nota_unidade nu     ON nu.id_matricula_componente = base.id_matricula_componente     AND nu.ativo     AND nu.id_descricao_nota = 21     AND nu.unidade = 2  WHERE base.tipo_componente not in ( 6 )     AND base.tipo_diario IN (51, 52, 53)     AND (base.tipo_diario_diversificado IS NULL OR base.categoria = 1)     AND (base.id_solicitacao_dispensa_estudante IS NULL        OR base.id_solicitacao_dispensa_estudante_componente IS NULL        OR base.id_dispensa_unidade_ativa IS NULL)  GROUP BY base.id_matricula_discente_serie, base.componente, base.categoria;  CREATE INDEX idx_lna_1784051414523_mat ON lev_notas_avaliacao_temp_1784051414523 (id_matricula_discente_serie);  CREATE INDEX idx_lna_1784051414523_cat ON lev_notas_avaliacao_temp_1784051414523 (id_matricula_discente_serie, categoria);  ANALYZE lev_notas_avaliacao_temp_1784051414523; 
   
SELECT base.id_matricula_discente_serie, base.componente, base.categoria,     CASE WHEN EVERY(CASE        WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE        WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE        ELSE FALSE END) THEN 'concluído' ELSE 'pendente' END AS apontamento  INTO lev_relatorios_avaliacao_temp_1784051414523 FROM matriculas_componentes_avaliacao_temp_1784051414523 base  LEFT JOIN ensino_infantil.relatorio_avaliativo ra     ON ra.id_matricula_discente_serie = base.id_matricula_discente_serie AND ra.ativo  LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac     ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo     AND rac.id_matricula_componente = base.id_matricula_componente  LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente  LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr     ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade     AND rahr.periodo = 2  LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente  WHERE (base.tipo_diario IN (54)     OR (base.tipo_diario IN (51, 52, 53) AND base.tipo_diario_diversificado IS NOT NULL        AND base.categoria = 2))     AND (base.id_solicitacao_dispensa_estudante IS NULL        OR base.id_solicitacao_dispensa_estudante_componente IS NULL        OR base.id_dispensa_unidade_relatorio IS NULL)  GROUP BY base.id_matricula_discente_serie, base.componente, base.categoria;  CREATE INDEX idx_lra_1784051414523_mat ON lev_relatorios_avaliacao_temp_1784051414523 (id_matricula_discente_serie);  CREATE INDEX idx_lra_1784051414523_cat ON lev_relatorios_avaliacao_temp_1784051414523 (id_matricula_discente_serie, categoria);  ANALYZE lev_relatorios_avaliacao_temp_1784051414523; 

SELECT DISTINCT base.id_matricula_discente_serie  INTO componentes_dispensados_avaliacao_temp_1784051414523 FROM matriculas_componentes_avaliacao_temp_1784051414523 base  WHERE base.tipo_componente not in ( 6 )     AND base.id_solicitacao_dispensa_estudante IS NOT NULL     AND base.id_solicitacao_dispensa_estudante_componente IS NOT NULL     AND base.id_dispensa_unidade_ativa IS NOT NULL;  CREATE INDEX idx_cda_1784051414523_mat ON componentes_dispensados_avaliacao_temp_1784051414523 (id_matricula_discente_serie);  ANALYZE componentes_dispensados_avaliacao_temp_1784051414523; 
 
SELECT id_matricula_discente_serie, componente,     CASE WHEN EVERY(apontamento = 'concluído') THEN 'concluído' ELSE 'pendente' END AS apontamento  INTO lev_avaliacao_diversificada_temp_1784051414523 FROM (     SELECT id_matricula_discente_serie, componente, apontamento FROM lev_notas_avaliacao_temp_1784051414523 WHERE categoria = 1    UNION ALL     SELECT id_matricula_discente_serie, componente, apontamento FROM lev_relatorios_avaliacao_temp_1784051414523 WHERE categoria = 2 ) AS foo GROUP BY id_matricula_discente_serie, componente;  CREATE INDEX idx_lad_1784051414523_mat ON lev_avaliacao_diversificada_temp_1784051414523 (id_matricula_discente_serie);  ANALYZE lev_avaliacao_diversificada_temp_1784051414523; 
  
 SELECT * INTO levantamento_mes_avaliacao_temp_1784051414523 FROM (  SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie,     COALESCE(le.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(le.componente, 'NA') AS componente  FROM matriculas_ativas_avaliacao_temp_1784051414523 ma  LEFT JOIN lev_notas_avaliacao_temp_1784051414523 le ON le.id_matricula_discente_serie = ma.id_matricula_discente_serie  LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON cd.id_matricula_discente_serie = ma.id_matricula_discente_serie  WHERE ma.tipo_diario IN (51, 52, 53) AND ma.tipo_diario_diversificado IS NULL     AND COALESCE(le.apontamento, 'NA') <> 'concluído'     AND (le.id_matricula_discente_serie IS NOT NULL OR cd.id_matricula_discente_serie IS NULL)  UNION ALL  SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie,     COALESCE(lr.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(lr.componente, 'NA') AS componente  FROM matriculas_ativas_avaliacao_temp_1784051414523 ma  LEFT JOIN lev_relatorios_avaliacao_temp_1784051414523 lr ON lr.id_matricula_discente_serie = ma.id_matricula_discente_serie  LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON cd.id_matricula_discente_serie = ma.id_matricula_discente_serie  WHERE ma.tipo_diario IN (54) AND COALESCE(lr.apontamento, 'NA') <> 'concluído'     AND (lr.id_matricula_discente_serie IS NOT NULL OR cd.id_matricula_discente_serie IS NULL)  UNION ALL  SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie,     COALESCE(lad.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(lad.componente, 'NA') AS componente  FROM matriculas_ativas_avaliacao_temp_1784051414523 ma  LEFT JOIN lev_avaliacao_diversificada_temp_1784051414523 lad ON lad.id_matricula_discente_serie = ma.id_matricula_discente_serie  LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON cd.id_matricula_discente_serie = ma.id_matricula_discente_serie  WHERE ma.tipo_diario IN (51, 52, 53) AND ma.tipo_diario_diversificado IS NOT NULL     AND COALESCE(lad.apontamento, 'NA') <> 'concluído'     AND (lad.id_matricula_discente_serie IS NOT NULL OR cd.id_matricula_discente_serie IS NULL)  UNION ALL  SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie, 'NA' AS apontamento_desempenho_concluido, 'NA' AS componente  FROM matriculas_ativas_avaliacao_temp_1784051414523 ma  LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON cd.id_matricula_discente_serie = ma.id_matricula_discente_serie  WHERE (ma.tipo_diario IS NULL OR ma.tipo_diario NOT IN (51, 52, 53, 54)) AND cd.id_matricula_discente_serie IS NULL  ) AS levantamento;  CREATE INDEX idx_lma_1784051414523_est ON levantamento_mes_avaliacao_temp_1784051414523 (id_estudante);  CREATE INDEX idx_lma_1784051414523_esc ON levantamento_mes_avaliacao_temp_1784051414523 (id_escola);  ANALYZE levantamento_mes_avaliacao_temp_1784051414523;   
  
  
  
  
  SELECT * FROM levantamento_mes_avaliacao_temp_1784051414523;
  WHERE id_matricula_discente_serie IN (1655363, 1628303);
  
  
  
  
  
  
SELECT id_matricula_discente_serie, componente, CASE WHEN EVERY(apontamento = 'concluído') THEN 'concluído'
ELSE 'pendente' END AS apontamento 
FROM( SELECT id_matricula_discente_serie, componente, apontamento
FROM lev_notas_avaliacao_temp_1784051414523
WHERE categoria = 1
UNION ALL SELECT id_matricula_discente_serie, componente, apontamento
FROM lev_relatorios_avaliacao_temp_1784051414523
WHERE categoria = 2 ) AS foo
GROUP BY id_matricula_discente_serie, componente;

CREATE INDEX idx_lad_1784051414523_mat ON
lev_avaliacao_diversificada_temp_1784051414523 (id_matricula_discente_serie);

ANALYZE lev_avaliacao_diversificada_temp_1784051414523;

SELECT * 
FROM( SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie, COALESCE(le.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(le.componente, 'NA') AS componente
FROM matriculas_ativas_avaliacao_temp_1784051414523 ma
LEFT JOIN lev_notas_avaliacao_temp_1784051414523 le ON
le.id_matricula_discente_serie = ma.id_matricula_discente_serie
LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON
cd.id_matricula_discente_serie = ma.id_matricula_discente_serie
WHERE ma.tipo_diario IN (51, 52, 53)
    AND ma.tipo_diario_diversificado IS NULL
    AND COALESCE(le.apontamento, 'NA') <> 'concluído'
        AND (le.id_matricula_discente_serie IS NOT NULL
            OR cd.id_matricula_discente_serie IS NULL)
UNION ALL SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie, COALESCE(lr.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(lr.componente, 'NA') AS componente
FROM matriculas_ativas_avaliacao_temp_1784051414523 ma
LEFT JOIN lev_relatorios_avaliacao_temp_1784051414523 lr ON
    lr.id_matricula_discente_serie = ma.id_matricula_discente_serie
LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON
    cd.id_matricula_discente_serie = ma.id_matricula_discente_serie
WHERE ma.tipo_diario IN (54)
        AND COALESCE(lr.apontamento, 'NA') <> 'concluído'
            AND (lr.id_matricula_discente_serie IS NOT NULL
                OR cd.id_matricula_discente_serie IS NULL)
    UNION ALL SELECT  ma.id_estudante, ma.turma, ma.id_escola, ma.serie, COALESCE(lad.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(lad.componente, 'NA') AS componente
    FROM matriculas_ativas_avaliacao_temp_1784051414523 ma
    LEFT JOIN lev_avaliacao_diversificada_temp_1784051414523 lad ON
        lad.id_matricula_discente_serie = ma.id_matricula_discente_serie
    JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON
        cd.id_matricula_discente_serie = ma.id_matricula_discente_serie
    WHERE ma.tipo_diario IN (51, 52, 53)
            AND ma.tipo_diario_diversificado IS NOT NULL
            AND COALESCE(lad.apontamento, 'NA') <> 'concluído'
                AND (lad.id_matricula_discente_serie IS NOT NULL
                    OR cd.id_matricula_discente_serie IS NULL)
        UNION ALL SELECT ma.id_estudante, ma.turma, ma.id_escola, ma.serie, 'NA' AS apontamento_desempenho_concluido, 'NA' AS componente
        FROM matriculas_ativas_avaliacao_temp_1784051414523 ma
        LEFT JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON
            cd.id_matricula_discente_serie = ma.id_matricula_discente_serie
        WHERE(ma.tipo_diario IS NULL
                OR ma.tipo_diario NOT IN (51, 52, 53, 54))
                AND cd.id_matricula_discente_serie IS NULL ) AS levantamento;

CREATE INDEX idx_lma_1784051414523_est ON
levantamento_mes_avaliacao_temp_1784051414523 (id_estudante);

CREATE INDEX idx_lma_1784051414523_esc ON
levantamento_mes_avaliacao_temp_1784051414523 (id_escola);

ANALYZE levantamento_mes_avaliacao_temp_1784051414523;



SELECT * FROM lev_avaliacao_diversificada_temp_1784051414523;

SELECT ma.* --ma.id_estudante, ma.turma, ma.id_escola, ma.serie, COALESCE(lad.apontamento, 'NA') AS apontamento_desempenho_concluido, COALESCE(lad.componente, 'NA') AS componente
    FROM matriculas_ativas_avaliacao_temp_1784051414523 ma 
    LEFT JOIN lev_avaliacao_diversificada_temp_1784051414523 lad ON lad.id_matricula_discente_serie = ma.id_matricula_discente_serie
      JOIN componentes_dispensados_avaliacao_temp_1784051414523 cd ON
        cd.id_matricula_discente_serie = ma.id_matricula_discente_serie
    WHERE ma.tipo_diario IN (51, 52, 53)
            AND ma.tipo_diario_diversificado IS NOT NULL
            AND COALESCE(lad.apontamento, 'NA') <> 'concluído'
                AND (lad.id_matricula_discente_serie IS NOT NULL
                    OR cd.id_matricula_discente_serie IS NULL);
                    
                    
 
 