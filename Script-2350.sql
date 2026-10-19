SELECT mc.id_matricula_componente, mc.id_matricula_estudante_serie, mc.media_anual, mc.media_final, mc.numero_faltas, mc.recuperacao, mc.ano, mc.periodo AS periodo_matricula_componente, mc.media_anual_modulo, mc.prova_especial, mc.frequencia, mc.ausente_recuperacao, mc.conselho_classe, mc.nao_optou, sm.id_situacao_matricula, sm.descricao AS descricao_situacao_matricula, t.id_turma, t.execucao, t.periodo AS periodo_turma, t.agrupadora, t.codigo nome_turma_componente, st.id_situacao_turma, st.descricao AS descricao_situacao_turma, t_agrup.id_turma AS id_turma_agrupadora, cc.id_componente_curricular AS id_componente, cc.nome AS nome_componente, ts.id_turma_serie, ts.nome AS nome_turma_serie, ts.tipo_diario AS tipo_diario_turma_serie, ts.id_turma_serie_agrupadora, tts.id_tipo_turma_serie, tts.descricao AS descricao_tipo_turma_serie, cb.id_curriculo_basico, cb.codigo, cb.multisseriado AS curriculo_multisseriado, cb.tipo_diario AS tipo_diario_curriculo, e.id_escola, e.nome AS nome_escola, dir.id_unidade AS id_direc, dir.nome AS nome_direc, s.id_serie, s.descricao AS descricao_serie, s.tipo_diario AS tipo_diario_serie, s.multisseriada AS serie_multisseriada, ee.id_etapa_ensino, ee.denominacao AS etapa_ensino, mes.id_matricula_discente_serie, mes.num_chamada, sms.id_situacao_matricula_serie, sms.descricao AS descricao_situacao_matricula_serie, s_multi.id_serie AS id_serie_multi, s_multi.tipo_diario AS tipo_diario_s_multi, s_multi.descricao AS descricao_s_multi, s_multi.sigla AS sigla_s_multi, ts_multi.id_turma_serie AS id_ts_multi, ts_multi.tipo_diario AS tipo_diario_ts_multi, ts_multi.nome AS nome_turma_ts_multi, a.id_aproveitamento, a.justificativa, a.escola AS nome_escola_aprov, s_aprov.id_serie AS id_serie_aprov, s_aprov.descricao AS descricao_serie_aprov, s_aprov.tipo_diario AS tipo_diario_serie_aprov, d.id_discente, d.matricula, p.id_pessoa, p.nome AS nome_pessoa, p.cpf_cnpj AS cpf, cb.possui_parte_diversificada, t.id_categoria_componente, cb.tipo_diario_diversificado
FROM basico.matricula_estudante_serie mes
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
AND ts.id_serie NOT IN ( 1005310, 1005325, 1005259, 1005268, 19001542 )
AND ts.periodo = mes.periodo
JOIN basico.tipo_turma_serie tts ON
tts.id_tipo_turma_serie = ts.id_tipo_turma_serie
JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = ts.id_curriculo_medio
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN escola.escola e ON
e.id_escola = ts.id_escola
JOIN comum.unidade dir ON
dir.id_unidade = e.id_regional_ensino
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
AND t.id_situacao_turma IN ( 1, 2, 3 )
JOIN ensino.situacao_turma st ON
st.id_situacao_turma = t.id_situacao_turma
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = t.id_disciplina
JOIN ensino.matricula_componente mc ON
mc.ano = mes.ano_calendario
AND mc.id_discente = mes.id_estudante
AND mc.id_turma = t.id_turma
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8 )
AND mc.id_historico_implantado IS NULL
AND (CASE WHEN mc.id_matricula_estudante_serie IS NOT NULL THEN mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
ELSE mc.id_matricula_estudante_serie IS NULL END)
JOIN ensino.situacao_matricula sm ON
sm.id_situacao_matricula = mc.id_situacao_matricula
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN ensino.turma t_agrup ON
t_agrup.id_turma = t.id_turma_agrupadora
LEFT JOIN basico.turma_serie ts_multi ON
ts_multi.id_turma_serie = mes.id_turma_serie_multisseriado
LEFT JOIN basico.serie s_multi ON
s_multi.id_serie = mes.id_serie_multisseriado
LEFT JOIN diario.aproveitamento a ON
a.id_aproveitamento = mc.id_aproveitamento
LEFT JOIN basico.serie s_aprov ON
s_aprov.id_serie = a.id_serie
WHERE mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND mes.id_turma_serie = 52335469
AND ts.id_escola = 1451
AND mes.id_matricula_discente_serie IN (1329186)
ORDER BY mes.ano_calendario, mes.periodo, ts.nome, cc.nome, mes.num_chamada, p.nome, d.id_discente