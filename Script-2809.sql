SELECT ts.id_turma_serie AS idTurmaSerie, ts.nome AS nomeTurmaSerie, ts.tipo_diario AS tipoDiario, ts.ano AS ano, ts.periodo AS periodo, ts.id_curriculo_medio AS idCurriculoMedio, curriculob3_.multisseriado AS multisseriado, ts.id_tipo_turma_serie AS idTipoTurmaSerie, tts.descricao AS descricaoTipoTurmaSerie, CASE WHEN COALESCE(ts.capacidade_aluno, 0) > 0 THEN ts.capacidade_aluno
WHEN COALESCE(serie9_.capacidade_maxima, 0) > 0 THEN (serie9_.capacidade_maxima + COALESCE(serie9_.capacidade_excesso, 0))
ELSE (eens.capacidade_maxima + COALESCE(eens.capacidade_excesso, 0)) END AS capacidade, ts.regra_nao AS regraNao, ts.justificativa_regra_nao AS justificativaRegraNao, ts.id_turno AS idTurno, turno5_.descricao AS descricaoTurno, turno5_.hora_inicio AS horaInicio, turno5_.hora_fim AS horaFim, ts.id_escola AS idEscola, escola8_.nome AS nomeEscola, ts.id_serie AS idSerie, serie9_.descricao AS descricaoSerie, serie9_.multisseriada AS multisseriada, serie9_.id_etapa_ensino AS idEtapaEnsino, eens.denominacao AS denominacao, eens.periodicidade_etapa AS periodicidadeEtapa, CASE WHEN eens.id_etapa_ensino = 16 THEN (SELECT COUNT(mc.id_matricula_componente)
FROM ensino.matricula_componente mc
INNER JOIN ensino.turma t ON
mc.id_turma = t.id_turma
AND t.id_turma_serie = ts.id_turma_serie
WHERE mc.id_situacao_matricula IN ( 5, 6, 2, 8 ) )
ELSE (SELECT count(*)
FROM basico.matricula_estudante_serie
WHERE id_turma_serie = ts.id_turma_serie
AND id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 12 ) ) + (SELECT count(DISTINCT(eea.id_estudante))
FROM educacao_especial.atendimento_educacao_especial_horario eeh
INNER JOIN educacao_especial.atendimento_educacao_especial_turma eet ON
eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
INNER JOIN educacao_especial.atendimento_educacao_especial_estudante eea ON
eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
INNER JOIN ensino.turma t ON
t.id_turma = eet.id_turma
WHERE id_turma_serie = ts.id_turma_serie
AND eea.ativo = TRUE ) END AS qtdMatriculados, CASE WHEN eens.id_etapa_ensino <> 14 THEN (SELECT count(DISTINCT id_discente)
FROM basico.matricula_estudante_serie mes
JOIN discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa_necessidade_especial pne ON
d.id_pessoa = pne.id_pessoa
WHERE id_turma_serie = ts.id_turma_serie
AND id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 12 ))
ELSE (SELECT count(DISTINCT(eea.id_estudante))
FROM educacao_especial.atendimento_educacao_especial_horario eeh
INNER JOIN educacao_especial.atendimento_educacao_especial_turma eet ON
eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
INNER JOIN educacao_especial.atendimento_educacao_especial_estudante eea ON
eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
INNER JOIN ensino.turma t ON
t.id_turma = eet.id_turma
WHERE id_turma_serie = ts.id_turma_serie
AND eea.ativo = TRUE ) END AS qtdMatriculadosNEE,(SELECT count(*)
FROM ensino.docente_turma dt
JOIN ensino.turma t
    USING (id_turma)
JOIN basico.turma_serie ts   USING (id_turma_serie)
WHERE t.id_turma_serie = ts.id_turma_serie
AND dt.ativo = TRUE ) AS qtdProfessores, escola8_.id_unidade_escola, aue.id_ambiente_unidade_escolar, aue.nome_numero, escola8_.habilita_ambientes, curriculob3_.habilita_relatorio_final_polivalente, serie9_.sigla AS siglaSerie, curriculob3_.habilita_relatorio_final_paee
FROM ensino.turma tc
INNER JOIN basico.turma_serie ts ON
tc.id_turma_serie = ts.id_turma_serie
LEFT OUTER JOIN ambiente.ambiente_unidade_escolar aue ON
aue.id_ambiente_unidade_escolar = ts.id_ambiente_unidade_escolar
LEFT OUTER JOIN basico.tipo_turma_serie tts ON
ts.id_tipo_turma_serie = tts.id_tipo_turma_serie, basico.curriculo_basico curriculob3_, ensino.turno turno5_, escola.escola escola8_, basico.serie serie9_, basico.etapa_ensino eens
WHERE ts.id_curriculo_medio = curriculob3_.id_curriculo_basico
AND ts.id_turno = turno5_.id_turno
AND ts.id_escola = escola8_.id_escola
AND ts.id_serie = serie9_.id_serie
AND serie9_.id_etapa_ensino = eens.id_etapa_ensino
AND ts.ativo = :ativo
AND (tts.id_tipo_turma_serie IN ( 1, 3, 5, 4, 4 ))
AND (tc.tipo NOT IN ( 10, 5, 8, 15, 11 ))
AND ts.id_escola = 51877805
AND ts.ano = 2026
AND serie9_.id_etapa_ensino = 16
GROUP BY ts.id_turma_serie, ts.nome, ts.tipo_diario, ts.ano, ts.periodo, ts.id_curriculo_medio, curriculob3_.multisseriado, ts.id_tipo_turma_serie, tts.descricao, ts.capacidade_aluno, ts.regra_nao, ts.justificativa_regra_nao, ts.id_turno, turno5_.descricao, turno5_.hora_inicio, turno5_.hora_fim, ts.id_escola, escola8_.nome, ts.id_serie, serie9_.descricao, serie9_.multisseriada, serie9_.id_etapa_ensino, serie9_.capacidade_maxima, serie9_.capacidade_excesso, eens.denominacao, eens.periodicidade_etapa, eens.id_etapa_ensino, eens.capacidade_maxima, eens.capacidade_excesso, escola8_.id_unidade_escola, aue.id_ambiente_unidade_escolar, aue.nome_numero, escola8_.habilita_ambientes, curriculob3_.habilita_relatorio_final_polivalente, serie9_.sigla, curriculob3_.habilita_relatorio_final_paee
ORDER BY serie9_.descricao, ts.nome;

SELECT mc.*
FROM basico.turma_serie ts
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
JOIN ensino.matricula_componente mc ON
mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE ts.id_turma_serie IN (52370519, 52346560, 52369316, 52369300, 52369302, 52347976);

SELECT *
FROM( SELECT mes.id_matricula_discente_serie, ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, mes.id_situacao_matricula_serie, sms.descricao, tr.id_turno, serie_mult.id_serie AS serie_mult, serie_mult.descricao AS descricao_serie_mult, p.bairro , COALESCE (p.telefone_celular, '') AS celular , COALESCE (p.telefone_fixo, '') AS fixo
FROM basico.matricula_estudante_serie mes
INNER JOIN discente d ON d.id_discente = mes.id_estudante
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie ees ON ees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN basico.turma_serie ts ON ts.id_escola = ees.id_escola
INNER JOIN basico.serie s ON s.id_serie = ts.id_serie
INNER JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN basico.nivel_etapa_ensino nee ON nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
INNER JOIN ensino.turno tr ON tr.id_turno = ts.id_turno
INNER JOIN basico.situacao_matricula_serie sms ON (sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie)
LEFT JOIN basico.serie serie_mult ON (serie_mult.id_serie = mes.id_serie_multisseriado)
WHERE ts.ano = 2026
AND ts.ativo = TRUE
AND ts.id_tipo_turma_serie IN ( 1, 3, 5, 4 )
    AND ees.id_escola = 51877805
    AND mes.id_turma_serie = ts.id_turma_serie
    AND mes.id_situacao_matricula_serie NOT IN ( 5, 12 )
        AND s.id_serie = 52338612
UNION ALL SELECT r_esp.id_matricula_discente_serie, r_esp.nome_etapa, r_esp.id_serie, r_esp.serie, r_esp.id_etapa_ensino, r_esp.denominacao, r_esp.nome, r_esp.nome_social, r_esp.data_nascimento, r_esp.matricula, r_esp.turno, r_esp.id_situacao, r_esp.descricao_situacao, r_esp.id_turno, r_esp.serie_mult, r_esp.descricao_serie_mult, r_esp.bairro, r_esp.celular, r_esp.fixo
FROM( SELECT mes.id_matricula_discente_serie, ts.nome AS nome_etapa, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao, p.nome, p.nome_social, p.data_nascimento, d.matricula, tr.descricao AS turno, 0 AS id_situacao, 'EDUCAÇÃO ESPECIAL' AS descricao_situacao, tr.id_turno, serie_mult.id_serie AS serie_mult, serie_mult.descricao AS descricao_serie_mult, p.bairro , COALESCE (p.telefone_celular, '') AS celular , COALESCE (p.telefone_fixo, '') AS fixo , ROW_NUMBER() OVER(PARTITION BY d.id_discente ORDER BY mes.id_matricula_discente_serie DESC) AS rn
FROM educacao_especial.atendimento_educacao_especial_turma aeet
JOIN educacao_especial.atendimento_educacao_especial_horario aeeh ON aeet.id_atendimento_educacao_especial_turma = aeeh.id_atendimento_educacao_especial_turma AND aeeh.ativo
JOIN educacao_especial.atendimento_educacao_especial_estudante aeee ON aeee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario AND aeee.ativo
JOIN ensino.turma t ON aeet.id_turma = t.id_turma
JOIN basico.turma_serie ts ON t.id_turma_serie = ts.id_turma_serie
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
JOIN discente d ON  aeee.id_estudante = d.id_discente
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente AND mes.ano_calendario = ts.ano
JOIN comum.pessoa p ON d.id_pessoa = p.id_pessoa
JOIN ensino.turno tr ON tr.id_turno = ts.id_turno
LEFT JOIN basico.serie serie_mult ON (serie_mult.id_serie = mes.id_serie_multisseriado)
WHERE aeet.ativo
    AND ts.ano = 2026
    AND ts.ativo
    AND ts.id_escola = 51877805
    AND ts.id_tipo_turma_serie IN ( 1, 3, 5, 4 )
        AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 11 )
            AND s.id_serie = 52338612 ) r_esp
WHERE r_esp.rn = 1 ) AS est
ORDER BY est.id_turno, est.denominacao, est.serie, est.nome_etapa, est.id_situacao_matricula_serie, COALESCE(est.nome_social, est.nome);
