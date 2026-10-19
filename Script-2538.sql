WITH ultima_data_movimentacao AS ( SELECT mee.id_matricula_estudante_serie, COALESCE(mee.data_solicitacao, mee.data) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie OR ts.id_turma_serie = mes.id_turma_serie_multisseriado
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
AND t.id_turma = 682471
WHERE mee.id_situacao_matricula_serie = 1
AND mee.ativo
AND mee.id_tipo_sol_transferencia IN (3, 5)
AND NOT EXISTS ( SELECT 1
FROM matricula.movimentacao_estudante_escola estorno
WHERE estorno.id_matricula_estudante_serie = mee.id_matricula_estudante_serie
AND estorno.data_cadastro > mee.data_cadastro
AND estorno.id_situacao_matricula_serie = 6
AND estorno.ativo ) ), matriculas_dispensa_unidade AS ( SELECT DISTINCT sde.id_matricula_estudante_serie, sdeu.unidade
FROM ensino.turma t
JOIN basico.matricula_estudante_serie mes ON
t.id_turma = 682471
AND t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
JOIN ensino.solicitacao_dispensa_estudante sde ON
sde.ativo
    AND sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON
    sdec.ativo
    AND sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON
    sdeu.ativo
    AND sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
WHERE sdec.id_componente_curricular = t.id_disciplina
    AND mes.id_situacao_matricula_serie <> 7
    AND sde.id_status_solicitacao_dispensa_estudante = 2) SELECT DISTINCT d.matricula, p.nome, d.id_discente, CASE WHEN m.id_situacao_matricula = 3 THEN TRUE
ELSE FALSE END AS situacao, mes.id_matricula_discente_serie, CASE WHEN aet.data_entrada_escola IS NOT NULL THEN (CAST(to_char(aet.data_entrada_escola, 'yyyy-mm-dd') AS DATE) + INTERVAL '0 hours')
WHEN mes.data_matricula_turma IS NOT NULL THEN (CAST(to_char(mes.data_matricula_turma, 'yyyy-mm-dd') AS DATE) + INTERVAL '0 hours')
ELSE (CAST(to_char(mes.data_cadastro, 'yyyy-mm-dd') AS DATE) + INTERVAL '0 hours') END AS data_matricula_turma, CASE WHEN st.id_status = 4 THEN TRUE
WHEN mee_externa.ultima_data IS NOT NULL THEN TRUE
ELSE FALSE END AS transferido, CASE WHEN mes.id_situacao_matricula_serie NOT IN ( 2, 3, 1, 7, 8, 10,-1 ) THEN COALESCE(mee_interna.data_solicitacao, st.data_solicitacao, mee_externa.ultima_data) + INTERVAL '0 hours'
ELSE NULL END AS data_transferencia, mes.id_situacao_matricula_serie,(SELECT count(*) > 0
FROM comum.pessoa_necessidade_especial pne
WHERE pne.id_pessoa = p.id_pessoa) AS nee
FROM discente d
JOIN ensino.matricula_componente m ON
m.id_discente = d.id_discente
AND m.id_situacao_matricula IN ( 5, 6, 2, 8, 9 )
JOIN ensino.turma t ON
t.id_turma = m.id_turma
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
AND mes.id_turma_serie = t.id_turma_serie
LEFT JOIN ensino.avaliacao_estudante_transferido aet ON
aet.id_matricula_estudante_serie = mes.id_matricula_discente_serie
LEFT JOIN matricula.solicitacao_transferencia st ON
(st.id_matricula_discente_serie = mes.id_matricula_discente_serie
    AND st.id_status = 4)
LEFT JOIN matricula.movimentacao_estudante_escola mee_interna ON
mee_interna.id_matricula_estudante_serie = st.id_matricula_discente_serie
AND mee_interna.ativo
AND mee_interna.id_tipo_sol_transferencia = 1
LEFT JOIN ultima_data_movimentacao mee_externa ON
mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
LEFT JOIN matriculas_dispensa_unidade mdu ON
mdu.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mdu.unidade = 1
JOIN comum.pessoa p
    USING (id_pessoa)
WHERE m.id_turma = 682471
AND mes.ano_calendario = 2026
AND mdu.id_matricula_estudante_serie IS NULL
AND (m.nao_optou IS FALSE
    OR m.nao_optou IS NULL)
AND (mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
    OR (mes.id_situacao_matricula_serie = 6
        AND COALESCE(st.data_solicitacao, mee_externa.ultima_data) IS NOT NULL))
AND d.matricula NOT IN ( '202530065086', '202630019694', '202530065095', '202630018169', '202530065101', '202530065110', '202530065120', '202530065068', '202630004628', '202530054850', '202630015443', '202630015499', '202630000709', '202630008968', '202630008888', '202630009698', '202630015541', '202630008190', '202630019068', '202630001519', '202530065139', '202630014132', '202630015695', '202630010287', '202530065077' )
ORDER BY p.nome;