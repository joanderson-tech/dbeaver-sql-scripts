BEGIN;

-- AVALIAÇÕE POR UINIDADE
WITH avaliacoes AS (
    SELECT DISTINCT mes.id_matricula_discente_serie, rahr.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ts.id_escola, hc.descricao habilidade 
    FROM basico.matricula_estudante_serie mes 
    JOIN basico.turma_serie ts ON ts.id_turma_serie  = coalesce(mes.id_turma_serie_multisseriado,mes.id_turma_serie)
        JOIN ensino_infantil.relatorio_avaliativo ra ON ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
        JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
        JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
        JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade AND rahr.periodo = 3
        JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
           JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
    WHERE ts.id_serie IN (52230484,61118041,52230485,51869714,51876121,52230487,51876122,51869716,51876118,51869713,51876119,51876116,51876120,51869715)
        AND mes.ano_calendario = 2025 AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
        AND ra.ativo
        AND ra.id_situacao_relatorio_avaliativo <> 4
        AND ts.tipo_diario <> 1
        AND rac.id_situacao_relatorio_avaliativo_componente <> 4
        AND rahr.id_opcao_grupo_avaliacao_relatorio IN (25, 26, 27) ),
frequencia AS (
    SELECT e.nome, s.descricao,a.habilidade, mc.id_discente, a.opcao_id, AVG(COALESCE(mc.frequencia, 100)) AS freq
    FROM basico.matricula_estudante_serie mes 
    JOIN basico.turma_serie ts ON ts.id_turma_serie  = coalesce(mes.id_turma_serie_multisseriado,mes.id_turma_serie)
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    JOIN basico.serie s ON s.id_serie = ts.id_serie
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
    JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma AND mc.id_discente = mes.id_estudante AND mc.ano = mes.ano_calendario AND mc.id_situacao_matricula IN (5, 6, 2, 8, 10)
    JOIN avaliacoes a ON a.id_matricula_discente_serie = mes.id_matricula_discente_serie
    WHERE ts.ativo AND ts.tipo_diario <> 1 AND ts.ano = 2025 AND t.id_situacao_turma IN (1, 3)
        AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
        AND s.id_serie IN (52230484,61118041,52230485,51869714,51876121,52230487,51876122,51869716,51876118,51869713,51876119,51876116,51876120,51869715)
        GROUP BY e.nome, s.descricao, a.habilidade, mc.id_discente, a.opcao_id
)
SELECT 
    f.nome AS UNIDADE,
    f.descricao AS SERIE,
    habilidade,
    COUNT(DISTINCT f.id_discente) AS "TOTAL DE ALUNOS",
    COUNT(DISTINCT CASE WHEN f.opcao_id = 25 THEN f.id_discente END) AS "DESENVOLVIDO",
    COUNT(DISTINCT CASE WHEN f.opcao_id = 26 THEN f.id_discente END) AS "EM DESENVOLVIMENTO",
    COUNT(DISTINCT CASE WHEN f.opcao_id = 27 THEN f.id_discente END) AS "NÃO SE APLICA"
FROM frequencia f
GROUP BY f.nome, f.descricao, habilidade
ORDER BY f.nome;

-- FREQUENCIA MES A MES
SELECT
  escola,
 serie,
  mes_nome AS mes,
  REPLACE(
  TO_CHAR(
    ROUND(100.0 * (totalAulas - faltas) / NULLIF(totalAulas, 0), 2),
    'FM999999990D00'
  ),
  ',',
  '.'
) AS frequencia
FROM (
  SELECT
    e.nome AS escola,
    s.descricao serie,
    TO_CHAR(fa.data, 'TMMonth') AS mes_nome,   -- nome do mês
    TO_CHAR(fa.data, 'MM')      AS mes_ordem,  -- para ordenar 
    SUM(CASE WHEN fa.ativo THEN fa.horarios ELSE 0 END)::DECIMAL AS totalAulas,
    SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END)::DECIMAL AS faltas
  FROM ensino.frequencia_aluno fa
  LEFT JOIN ensino.item_abono_frequencia iaf 
    ON iaf.id_frequencia = fa.id_frequencia
  JOIN ensino.turma t 
    ON t.id_turma = fa.id_turma 
   AND t.id_situacao_turma <> 4
  JOIN basico.turma_serie ts 
    ON ts.id_turma_serie = t.id_turma_serie
  JOIN escola.escola e 
    ON e.id_escola = ts.id_escola
    JOIN basico.serie s ON s.id_serie = ts.id_serie 
  JOIN discente d 
    ON d.id_discente = fa.id_discente
  JOIN comum.pessoa p 
    ON p.id_pessoa = d.id_pessoa
  WHERE (fa.ativo OR fa.abonada)
    AND t.ano = 2025
    AND ts.id_serie IN (
      52230484,61118041,52230485,51869714,51876121,
      52230487,51876122,51869716,51876118,51869713,
      51876119,51876116,51876120,51869715
    )
  GROUP BY
    e.nome,
    serie,
    TO_CHAR(fa.data, 'TMMonth'),
    TO_CHAR(fa.data, 'MM')
) T
ORDER BY escola, serie, mes_ordem;