SELECT mes.id_matricula_discente_serie, ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, mes.id_situacao_matricula_serie, sms.descricao AS situacao_matricula, p.bairro, mes.num_chamada, sm.id_serie AS id_serie_mult, sm.descricao AS serie_mult, eem.id_etapa_ensino AS id_etapa_ensino_mult, ee.denominacao AS etapa_serie_mult
FROM basico.matricula_estudante_serie mes
INNER JOIN discente d ON
d.id_discente = mes.id_estudante
INNER JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie ees ON
ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN basico.turma_serie ts ON
ts.id_escola = ees.id_escola
INNER JOIN basico.serie s ON
s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN basico.nivel_etapa_ensino nee ON
nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
INNER JOIN ensino.turno tr ON
tr.id_turno = ts.id_turno
INNER JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN basico.serie sm ON
sm.id_serie = mes.id_serie_multisseriado
LEFT JOIN basico.etapa_ensino eem ON
eem.id_etapa_ensino = sm.id_etapa_ensino
WHERE ts.ativo = TRUE
AND ts.id_turma_serie = 51899597
AND mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 );
ORDER BY tr.id_turno, ee.denominacao, s.descricao, ts.nome, mes.id_situacao_matricula_serie, COALESCE(p.nome_social, p.nome)