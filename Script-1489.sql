EXPLAIN (ANALYZE)
SELECT DISTINCT dis.id_discente
AS idDiscente, dis.matricula
AS matricula, p.nome
AS nomeEstudante, p.cpf_cnpj
AS cpf, e.nome
AS nomeUnidade, ee.denominacao
AS nomeEtapaEnsino, s.descricao
AS nomeSerie, ts.nome
AS nomeTurma, d.nome
AS nomeDisciplina, fa.data
AS data, fa.frequencia
AS falta, (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false))
AS abonada, CASE WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false))
AND fa.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf.codigo || ') ' || mbf.denominacao WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false))
AND af.id_motivo_baixa_frequencia IS NOT NULL THEN '(' || mbf2.codigo || ') ' || mbf2.denominacao WHEN (COALESCE(fa.abonada_escola, false) OR COALESCE(fa.abonada, false))
AND (af.justificativa IS NOT NULL OR trim(af.justificativa) <> '') THEN af.justificativa ELSE '' END
AS motivoAbono
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
WHERE fa.data BETWEEN '2025-03-10'
AND '2025-12-29'
AND fa.ativo = TRUE
AND t.id_situacao_turma <> 4
AND ts.ativo = TRUE
AND s.ativo = TRUE
AND ee.ativo = TRUE
AND d.ativo = TRUE
ORDER BY p.nome, fa.data, ee.denominacao, s.descricao, ts.nome, d.nome 
offset '224000' rows fetch next '1000' rows only;






