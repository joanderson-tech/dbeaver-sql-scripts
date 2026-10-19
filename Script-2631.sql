SELECT *
FROM basico.matricula_estudante_serie mes
JOIN matricula.solicitacao_transferencia st ON
st.id_matricula_discente_serie = mes.id_matricula_discente_serie
WHERE mes.id_situacao_matricula_serie = 6
AND mes.ano_calendario = 2026
AND st.id_status = 4
AND mes.id_matricula_discente_serie = 1594158;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_matricula_discente_serie IN (1599004, 1607286, 1594158, 1600657, 1624271, 1605630);

SELECT p.nome, u.login
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.id_turma_serie = 84520898;

tacyanalima2015@gmail.com;

SELECT *
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
WHERE d.id_discente = 1403833;

WITH ultima_data_movimentacao AS ( SELECT mee.id_matricula_estudante_serie, max(COALESCE(mee.data_solicitacao, mee.data)) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
WHERE mee.ativo
AND mee.id_tipo_sol_transferencia IN (3, 5)
GROUP BY mes.id_estudante, mee.id_matricula_estudante_serie ), matriculas_dispensa_unidade AS ( SELECT sde.id_matricula_estudante_serie, array_agg(sdeu.unidade) AS unidades
FROM ensino.turma t
JOIN basico.matricula_estudante_serie mes ON
t.id_turma IN (804004)
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
        AND sde.id_status_solicitacao_dispensa_estudante = 2
    GROUP BY sde.id_matricula_estudante_serie, sdec.id_componente_curricular), periodo_unidade AS ( SELECT t.unidade, CASE t.unidade WHEN 1 THEN ce.inicio_bim_1
WHEN 2 THEN ce.inicio_bim_2
WHEN 3 THEN ce.inicio_bim_3
WHEN 4 THEN ce.inicio_bim_4 END AS data_inicio, CASE t.unidade WHEN 1 THEN ce.fim_bim_1
WHEN 2 THEN ce.fim_bim_2
WHEN 3 THEN ce.fim_bim_3
WHEN 4 THEN ce.fim_bim_4 END AS data_fim, ce.limite_resultado_final
FROM basico.calendario_escolar ce
CROSS JOIN LATERAL UNNEST(ARRAY[1, 2, 3, 4]) AS t (unidade)
WHERE ce.ativo
AND ce.ano = ?
AND ce.vigente ) SELECT fa.id_frequencia, fa.data, fa.frequencia, fa.atual, fa.horarios, fa.data_Cadastro, fa.ativo, fa.id_turma, t.codigo, fa.id_discente, d.matricula, COALESCE(p.nome_social, p.nome), p.id_pessoa,(SELECT count(*) > 0
FROM comum.pessoa_necessidade_especial pne
WHERE pne.id_pessoa = p.id_pessoa) AS nee, e.participa_bolsa_familia, fa.id_motivo_baixa_frequencia, mbf.codigo AS cod_motivo, mbf.nao_abona, fa.id_event_log, fa.abonada, fa.abonada_escola, fa.via_reconhecimento_facial, mes.num_chamada
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
AND mes.id_estudante = fa.id_discente
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10, 4, 6 )
LEFT JOIN basico.motivo_baixa_frequencia mbf
    USING(id_motivo_baixa_frequencia)
JOIN basico.estudante e ON
e.id_estudante = fa.id_discente
JOIN discente d ON
d.id_discente = fa.id_discente
JOIN comum.pessoa p
    USING (id_pessoa)
JOIN periodo_unidade pu ON
fa.data BETWEEN pu.data_inicio AND pu.data_fim
OR fa.data < pu.limite_resultado_final
LEFT JOIN matricula.solicitacao_transferencia st ON
st.id_matricula_discente_serie = mes.id_matricula_discente_serie
AND st.id_status = 4
LEFT JOIN (SELECT mee.id_matricula_estudante_serie, min(COALESCE(mee.data_solicitacao, mee.data)) AS ultima_data
FROM matricula.movimentacao_estudante_escola mee
WHERE mee.ativo
AND mee.id_tipo_sol_transferencia IN (1)
GROUP BY mee.id_matricula_estudante_serie) AS mee_interna ON
mee_interna.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
LEFT JOIN (SELECT max(udm.id_matricula_estudante_serie) AS id_matricula_estudante_serie, udm.ultima_data
FROM ultima_data_movimentacao udm
GROUP BY udm.id_estudante, udm.ultima_data ) AS mee_externa ON
mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
LEFT JOIN matriculas_dispensa_unidade mdu ON
mdu.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND pu.unidade = ANY(mdu.unidades)
LEFT JOIN ( SELECT 1 AS aula_extra_exists
FROM ava.aula_extra ae
WHERE ae.id_turma IN (804004)
    AND (EXTRACT(YEAR FROM ae.data_aula) = ?
    OR EXTRACT(YEAR FROM ae.data_aula) = ? + 1)
    AND ae.data_aula = ? ) AS aula_extra ON
1 = 1
WHERE fa.id_turma IN (804004)
AND fa.data = ?
AND fa.ativo = TRUE
AND (fa.data = ?
    OR aula_extra.aula_extra_exists IS NOT NULL)
AND (mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
    OR (mes.id_situacao_matricula_serie = 6
        AND COALESCE(st.data_solicitacao, mee_externa.ultima_data, mee_interna.ultima_data) IS NOT NULL)
        OR (mes.id_situacao_matricula_serie = 4
            AND ( SELECT max(me.data_ocorrencia)
        FROM basico.movimentacao_estudante me
        WHERE me.id_discente = mes.id_estudante
            AND me.ativo
            AND me.id_tipo_movimentacao_estudante = 3
            AND ano_escolar = ?
        GROUP BY me.id_discente ) >= ?))
AND mdu.unidades IS NULL
AND mes.id_matricula_discente_serie NOT IN ( SELECT mes_t.id_matricula_discente_serie
FROM basico.matricula_estudante_serie mes_t
LEFT JOIN matricula.solicitacao_transferencia st_t ON
st_t.id_matricula_discente_serie = mes_t.id_matricula_discente_serie
LEFT JOIN matricula.movimentacao_estudante_escola mee_t ON
mee_t.id_matricula_estudante_serie = mes_t.id_matricula_discente_serie
WHERE mes_t.id_situacao_matricula_serie = 6
AND mes_t.ano_calendario = ?
AND mes_t.id_turma_serie IS NOT NULL
AND (st_t.data_solicitacao <= ?
    OR mee_t.data_solicitacao <= ?)
AND mes_t.id_estudante = mes.id_estudante
AND mes_t.id_turma_serie = mes.id_turma_serie
AND mes_t.id_serie_escola = mes.id_serie_escola )
GROUP BY fa.id_turma, fa.id_discente, fa.data, COALESCE(p.nome_social, p.nome), fa.horarios, fa.id_frequencia, fa.frequencia, fa.atual, fa.data_Cadastro, fa.ativo, t.codigo, d.matricula, p.id_pessoa, e.participa_bolsa_familia, fa.id_motivo_baixa_frequencia, mbf.codigo, fa.id_event_log, fa.abonada, fa.abonada_escola, fa.via_reconhecimento_facial, mbf.nao_abona, mes.num_chamada
ORDER BY mes.num_chamada, COALESCE(p.nome_social, p.nome) ASC