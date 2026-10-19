SELECT *
FROM( SELECT mes.id_matricula_discente_serie, ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, mes.id_situacao_matricula_serie AS id_situacao, sms.descricao AS situacao_matricula, tr.id_turno, serie_mult.id_serie AS serie_mult, serie_mult.descricao AS descricao_serie_mult, p.bairro, COALESCE(p.telefone_celular, '') AS celular, COALESCE(p.telefone_fixo, '') AS fixo
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
LEFT JOIN basico.serie serie_mult ON
serie_mult.id_serie = mes.id_serie_multisseriado
WHERE ts.ano = 2026
AND ts.ativo = TRUE
AND ts.id_tipo_turma_serie IN ( 1, 3, 5, 4 )
AND ees.id_escola = 51877805
AND mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie NOT IN ( 5, 12 )
AND s.id_serie = 52338612
UNION ALL SELECT r_esp.id_matricula_discente_serie, r_esp.nome_etapa, r_esp.id_serie, r_esp.serie, r_esp.id_etapa_ensino, r_esp.denominacao, r_esp.nome, r_esp.nome_social, r_esp.data_nascimento, r_esp.matricula, r_esp.turno, r_esp.id_situacao, r_esp.descricao_situacao, r_esp.id_turno, r_esp.serie_mult, r_esp.descricao_serie_mult, r_esp.bairro, r_esp.celular, r_esp.fixo
FROM( SELECT mes.id_matricula_discente_serie, ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, 0 AS id_situacao, 'EDUCAÇÃO ESPECIAL' AS descricao_situacao, tr.id_turno, serie_mult.id_serie AS serie_mult, serie_mult.descricao AS descricao_serie_mult, p.bairro, COALESCE(p.telefone_celular, '') AS celular, COALESCE(p.telefone_fixo, '') AS fixo , ROW_NUMBER() OVER(PARTITION BY d.id_discente ORDER BY mes.id_matricula_discente_serie DESC) AS rn
FROM educacao_especial.atendimento_educacao_especial_turma aeet
JOIN educacao_especial.atendimento_educacao_especial_horario aeeh ON
aeet.id_atendimento_educacao_especial_turma = aeeh.id_atendimento_educacao_especial_turma
AND aeeh.ativo
JOIN educacao_especial.atendimento_educacao_especial_estudante aeee ON
aeee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
AND aeee.ativo
JOIN ensino.turma t ON
aeet.id_turma = t.id_turma
JOIN basico.turma_serie ts ON
t.id_turma_serie = ts.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN discente d ON
aeee.id_estudante = d.id_discente
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
AND mes.ano_calendario = ts.ano
JOIN comum.pessoa p ON
d.id_pessoa = p.id_pessoa
JOIN ensino.turno tr ON
tr.id_turno = ts.id_turno
LEFT JOIN basico.serie serie_mult ON
serie_mult.id_serie = mes.id_serie_multisseriado
WHERE aeet.ativo
AND ts.ano = 2026
AND ts.ativo
AND ts.id_escola = 51877805
AND ts.id_tipo_turma_serie IN ( 1, 3, 5, 4 )
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 11 )
	AND s.id_serie = 52338612 ) r_esp
WHERE r_esp.rn = 1
UNION ALL 
SELECT DISTINCT mes.id_matricula_discente_serie, ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, COALESCE(mes.id_situacao_matricula_serie, mc.id_situacao_matricula) AS id_situacao, COALESCE(sms.descricao, 'CURSANDO COMPLEMENTAR') AS situacao_matricula, tr.id_turno, serie_mult.id_serie AS serie_mult, serie_mult.descricao AS descricao_serie_mult, p.bairro, COALESCE(p.telefone_celular, '') AS celular, COALESCE(p.telefone_fixo, '') AS fixo
FROM ensino.turma t
INNER JOIN basico.turma_serie ts ON
t.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie s ON
s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN ensino.turno tr ON
tr.id_turno = ts.id_turno
INNER JOIN ensino.matricula_componente mc ON
mc.id_turma = t.id_turma
INNER JOIN discente d ON
d.id_discente = mc.id_discente
INNER JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
LEFT JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
AND mes.ano_calendario = ts.ano
LEFT JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN basico.serie serie_mult ON
serie_mult.id_serie = mes.id_serie_multisseriado
WHERE ts.ano = 2026
AND ts.ativo = TRUE
AND ts.id_escola = 51877805
AND mc.id_situacao_matricula <> 7
AND s.id_serie = 52338612 ) AS est
ORDER BY est.id_turno, est.denominacao, est.serie, est.nome_etapa, est.id_situacao, COALESCE(est.nome_social, est.nome);



select * from ensino.matricula_componente mc ;