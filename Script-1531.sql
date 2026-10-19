WITH periodo_unidade AS (SELECT t.unidade, CASE t.unidade WHEN 1 THEN ce.inicio_bim_1
WHEN 2 THEN ce.inicio_bim_2
WHEN 3 THEN ce.inicio_bim_3
WHEN 4 THEN ce.inicio_bim_4 END AS data_inicio, CASE t.unidade WHEN 1 THEN ce.fim_bim_1
WHEN 2 THEN ce.fim_bim_2
WHEN 3 THEN ce.fim_bim_3
WHEN 4 THEN ce.fim_bim_4 END AS data_fim
FROM basico.calendario_escolar ce
CROSS JOIN LATERAL UNNEST(ARRAY[1, 2, 3, 4]) AS t (unidade)
WHERE ce.ativo
AND ce.ano = 2023
AND ce.vigente ) SELECT DISTINCT mes.id_estudante
FROM ensino.turma t
JOIN basico.matricula_estudante_serie mes ON
t.id_turma = 682166
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
WHERE mes.id_situacao_matricula_serie <> 7
AND sde.id_status_solicitacao_dispensa_estudante = 2
AND sdec.id_componente_curricular = t.id_disciplina
AND sdeu.unidade = (SELECT pu.unidade
FROM periodo_unidade pu
WHERE '2025-12-09' BETWEEN pu.data_inicio AND pu.data_fim
LIMIT 1)



SELECT mc.id_discente, p.nome
FROM ensino.matricula_componente mc
JOIN discente d ON d.id_discente = mc.id_discente 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE mc.id_turma = :idTurma
AND mc.nao_optou