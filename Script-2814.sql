SELECT DISTINCT ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, mes.num_chamada, p.nome, p.data_nascimento, d.matricula, tr.descricao AS turno, cc.sigla, COALESCE(mes.id_situacao_matricula_serie, mc.id_situacao_matricula) AS id_situacao, COALESCE(sms.descricao, 'CURSANDO COMPLEMENTAR') AS situacao_matricula, t.grupo, p.bairro, sm.id_serie AS id_serie_mult, sm.descricao AS serie_mult, eem.id_etapa_ensino AS id_etapa_ensino_mult, eem.denominacao AS etapa_serie_mult
FROM ensino.turma t
INNER JOIN basico.turma_serie ts ON
t.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie s ON
s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
INNER JOIN ensino.turno tr ON
tr.id_turno = ts.id_turno
INNER JOIN ensino.matricula_componente mc ON
mc.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc ON
mc.id_componente_curricular = cc.id_componente_curricular
INNER JOIN discente d ON
d.id_discente = mc.id_discente
INNER JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
LEFT JOIN escola.escola_etapa_ensino_serie ees ON
ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
LEFT JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN basico.serie sm ON
sm.id_serie = mes.id_serie_multisseriado
LEFT JOIN basico.etapa_ensino eem ON
eem.id_etapa_ensino = sm.id_etapa_ensino
WHERE ts.ativo = TRUE
AND ts.id_turma_serie = 52346560
AND mc.id_situacao_matricula <> 7
ORDER BY tr.id_turno, ee.denominacao, s.descricao, ts.nome, p.nome, cc.sigla
