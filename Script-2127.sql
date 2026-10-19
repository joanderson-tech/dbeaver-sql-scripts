WITH cte_faltas AS ( SELECT fa.id_discente, t.id_turma_serie, COALESCE(SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS total_faltas
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE t.ano = 2026
AND t.id_situacao_turma <> 4
AND fa.ativo = TRUE
AND fa.frequencia > 0
GROUP BY fa.id_discente, t.id_turma_serie ), cte_ne AS ( SELECT id_pessoa, COUNT(*) > 0 AS tem_ne
FROM comum.pessoa_necessidade_especial
GROUP BY id_pessoa ), cte_qtd_salas AS ( SELECT id_escola, COUNT(*) AS total_salas
FROM ambiente.ambiente_unidade_escolar
GROUP BY id_escola ), cte_periodo AS ( SELECT MAX(periodo) AS max_periodo
FROM basico.turma_serie
WHERE ano = 2026
AND ativo = TRUE ) SELECT e.codigo_inep, ts.nome AS nome_turma, CASE WHEN ee.periodicidade_etapa = 'ANUAL' THEN 0
WHEN ee.periodicidade_etapa = 'SEMESTRAL'
AND ts.periodo = 1 THEN 1
WHEN ee.periodicidade;