SELECT *
FROM discente d
WHERE d.matricula = '202352757755';

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 1338947;

SELECT *
FROM matricula.movimentacao_estudante_escola mee
WHERE mee.id_matricula_estudante_serie IN (1513075, 1515401);

1515401


SELECT *
FROM matricula.solicitacao_transferencia st
WHERE st.id_matricula_discente_serie = 1515401;


WITH ultima_data_movimentacao AS ( SELECT mee.id_matricula_estudante_serie, max(COALESCE(mee.data_solicitacao, mee.data)) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
WHERE mee.ativo
AND mee.id_tipo_sol_transferencia IN (3, 5)
	AND mee."data" <= '2025-10-10'
GROUP BY mes.id_estudante, mee.id_matricula_estudante_serie ) 
SELECT DISTINCT discente.id_discente, discente.matricula, mes.id_matricula_discente_serie,(CAST(to_char(mes.data_cadastro, 'yyyy-mm-dd') AS DATE) + INTERVAL '0 hours') AS data_cadastro,(CAST(to_char(mes.data_matricula_turma, 'yyyy-mm-dd') AS DATE) + INTERVAL '0 hours') AS data_matricula_turma, pessoa.id_pessoa, pessoa.nome,(SELECT count(*) > 0
FROM comum.pessoa_necessidade_especial pne
WHERE pne.id_pessoa = pessoa.id_pessoa) AS nee, mes.num_chamada, estudante.participa_bolsa_familia, mes.id_situacao_matricula_serie, CASE WHEN mes.id_situacao_matricula_serie NOT IN ( 2, 3, 1, 7, 8, 10,-1 ) THEN (CAST(to_char(st.data_solicitacao, 'yyyy-mm-dd') AS DATE) + INTERVAL '0 hours')
ELSE NULL END AS data_solicitacao, CASE WHEN mes.id_situacao_matricula_serie NOT IN ( 2, 3, 1, 7, 8, 10,-1 ) THEN COALESCE(mee_interna.ultima_data, mee_externa.ultima_data) + INTERVAL '0 hours'
ELSE NULL END AS data_transferencia
FROM ensino.matricula_componente mc
JOIN ensino.turma t
	USING (id_turma)
JOIN basico.turma_serie ts
	USING (id_turma_serie)
JOIN basico.serie s
	USING(id_serie)
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = mc.id_discente
AND ( (mes.id_turma_serie = ts.id_turma_serie
	AND s.tipo_diario <> 16 )
OR s.tipo_diario = 16 )
LEFT JOIN ( SELECT st_sub.id_matricula_discente_serie, min(data_solicitacao) AS data_solicitacao
FROM matricula.solicitacao_transferencia st_sub
WHERE st_sub.id_status = 4
GROUP BY st_sub.id_matricula_discente_serie ) st ON
st.id_matricula_discente_serie = mes.id_matricula_discente_serie
LEFT JOIN (SELECT mee.id_matricula_estudante_serie, min(COALESCE(mee.data_solicitacao, mee.data)) AS ultima_data
FROM matricula.movimentacao_estudante_escola mee
WHERE mee.ativo
AND mee.id_tipo_sol_transferencia IN (1)
	AND mee."data" <= '2025-10-10'
GROUP BY mee.id_matricula_estudante_serie) AS mee_interna ON
mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
LEFT JOIN (SELECT max(udm.id_matricula_estudante_serie) AS id_matricula_estudante_serie, udm.ultima_data
FROM ultima_data_movimentacao udm
GROUP BY udm.id_estudante, udm.ultima_data ) AS mee_externa ON
mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
JOIN public.discente discente ON
discente.id_discente = mc.id_discente
JOIN basico.estudante estudante ON
estudante.id_estudante = discente.id_discente
JOIN comum.pessoa pessoa ON
pessoa.id_pessoa = discente.id_pessoa
WHERE mc.id_turma = :idTurma
AND mc.ano = :ano
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 9 )
AND mes.ano_calendario = :ano
AND ((mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
	AND mes.id_matricula_discente_serie NOT IN (SELECT mes_t.id_matricula_discente_serie
FROM basico.matricula_estudante_serie mes_t
LEFT JOIN matricula.solicitacao_transferencia st_t ON
	st_t.id_matricula_discente_serie = mes_t.id_matricula_discente_serie
LEFT JOIN matricula.movimentacao_estudante_escola mee_t ON
	mee_t.id_matricula_estudante_serie = mes_t.id_matricula_discente_serie
WHERE mes_t.id_situacao_matricula_serie = 6
	AND mes_t.ano_calendario = 2025
	AND mes_t.id_turma_serie IS NOT NULL
	AND (st_t.data_solicitacao <= '2025-10-10'
		OR mee_t.data_solicitacao <= '2025-10-10') ))
OR (mes.id_situacao_matricula_serie = 4
	AND ( SELECT CAST(MAX(me.data_ocorrencia) AS DATE)
FROM basico.movimentacao_estudante me
WHERE me.id_discente = mc.id_discente
	AND me.ativo
	AND me.id_tipo_movimentacao_estudante = 3
	AND ano_escolar = :ano
GROUP BY me.id_discente ) > '2025-10-10')
OR (mes.id_situacao_matricula_serie = 6
	AND (COALESCE(st.data_solicitacao, mee_externa.ultima_data) IS NOT NULL
		OR (SELECT COALESCE(max(mee_ext."data") > '2025-10-10', TRUE)
	FROM matricula.movimentacao_estudante_escola mee_ext
	WHERE mee_ext.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		AND mee_ext.id_tipo_sol_transferencia = 3
		AND mee_ext.ativo))
	AND NOT EXISTS ( SELECT 1
FROM basico.matricula_estudante_serie mes2
WHERE mes2.id_estudante = mes.id_estudante
	AND mes2.id_turma_serie = mes.id_turma_serie
	AND mes2.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 ) )) )
ORDER BY mes.num_chamada, pessoa.nome ASC;