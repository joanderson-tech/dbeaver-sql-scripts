SELECT ts.id_serie,tc.id_turma, ts.id_turma_serie AS idTurmaSerie, ts.nome AS nomeTurmaSerie, ts.tipo_diario AS tipoDiario, ts.ano AS ano, ts.periodo AS periodo, ts.id_curriculo_medio AS idCurriculoMedio, curriculob3_.multisseriado AS multisseriado, ts.id_tipo_turma_serie AS idTipoTurmaSerie, tts.descricao AS descricaoTipoTurmaSerie, CASE WHEN COALESCE(ts.capacidade_aluno, 0) > 0 THEN ts.capacidade_aluno
WHEN COALESCE(serie9_.capacidade_maxima, 0) > 0 THEN (serie9_.capacidade_maxima + COALESCE(serie9_.capacidade_excesso, 0))
ELSE (eens.capacidade_maxima + COALESCE(eens.capacidade_excesso, 0)) END AS capacidade, ts.regra_nao AS regraNao, ts.justificativa_regra_nao AS justificativaRegraNao, ts.id_turno AS idTurno, turno5_.descricao AS descricaoTurno, turno5_.hora_inicio AS horaInicio, turno5_.hora_fim AS horaFim, ts.id_escola AS idEscola, escola8_.nome AS nomeEscola, ts.id_serie AS idSerie, serie9_.descricao AS descricaoSerie, serie9_.multisseriada AS multisseriada, serie9_.id_etapa_ensino AS idEtapaEnsino, eens.denominacao AS denominacao, eens.periodicidade_etapa AS periodicidadeEtapa, CASE WHEN eens.id_etapa_ensino <> 14 THEN (SELECT count(*)
FROM basico.matricula_estudante_serie
WHERE id_turma_serie = ts.id_turma_serie
AND id_situacao_matricula_serie NOT IN ( 4, 5, 6, 9, 12 ) )
ELSE (SELECT count(DISTINCT(eea.id_estudante))
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
JOIN basico.turma_serie ts
	USING (id_turma_serie)
WHERE t.id_turma_serie = ts.id_turma_serie
AND dt.ativo = TRUE ) AS qtdProfessores, escola8_.id_unidade_escola, aue.id_ambiente_unidade_escolar, aue.nome_numero, escola8_.habilita_ambientes, curriculob3_.habilita_relatorio_final_polivalente
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
AND ts.id_escola = :idEscola
AND ts.ano = :ano
AND lower(ts.nome) LIKE lower( :nome )
AND ts.id_serie <> 1005285
AND ts.id_serie <> 5118243
AND (SELECT COUNT(*)
FROM ensino.docente_turma dt
WHERE dt.id_turma = tc.id_turma
AND :dataAtual BETWEEN dt.data_inicio AND dt.data_fim
AND dt.ativo = TRUE ) = 0
GROUP BY ts.id_serie,tc.id_turma, ts.id_turma_serie, ts.nome, ts.tipo_diario, ts.ano, ts.periodo, ts.id_curriculo_medio, curriculob3_.multisseriado, ts.id_tipo_turma_serie, tts.descricao, ts.capacidade_aluno, ts.regra_nao, ts.justificativa_regra_nao, ts.id_turno, turno5_.descricao, turno5_.hora_inicio, turno5_.hora_fim, ts.id_escola, escola8_.nome, ts.id_serie, serie9_.descricao, serie9_.multisseriada, serie9_.id_etapa_ensino, serie9_.capacidade_maxima, serie9_.capacidade_excesso, eens.denominacao, eens.periodicidade_etapa, eens.id_etapa_ensino, eens.capacidade_maxima, eens.capacidade_excesso, escola8_.id_unidade_escola, aue.id_ambiente_unidade_escolar, aue.nome_numero, escola8_.habilita_ambientes, curriculob3_.habilita_relatorio_final_polivalente
ORDER BY serie9_.descricao;

SELECT COUNT(*)
FROM ensino.docente_turma dt
WHERE dt.id_turma IN (760711, 760712, 760713, 760714, 760715, 760716, 760717, 760718)
AND :dataAtual BETWEEN dt.data_inicio AND dt.data_fim
AND dt.ativo = TRUE


UPDATE ensino.horario_turma
SET
id_turma = 768436
WHERE id_horario_turma IN (1648514, 1648519, 1648524, 1648529);

UPDATE basico.curriculo_basico_componente
SET
permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente = 52230547;

SELECT *
FROM ensino.turma t
WHERE t.id_turma_serie = 73417706;

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 51870312;
-- Auto-generated SQL script #202511141605
UPDATE ensino.turma
SET
id_turma_agrupadora = 768435
WHERE id_turma = 768436;

SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_turma
AND ht.ativo ;

SELECT serie0_
FROM basico.serie serie0_
LEFT OUTER JOIN basico.etapa_ensino etapaensin1_ ON
serie0_.id_etapa_ensino = etapaensin1_.id_etapa_ensino
LEFT OUTER JOIN basico.forma_organizacao_etapa formaorgan2_ ON
etapaensin1_.id_forma_organizacao_Etapa = formaorgan2_.id_forma_organizacao_etapa
LEFT OUTER JOIN comum.unidade unidade3_ ON
formaorgan2_.id_unidade = unidade3_.id_unidade
LEFT OUTER JOIN basico.local_oferta localofert4_ ON
etapaensin1_.id_local_oferta = localofert4_.id_local_oferta
LEFT OUTER JOIN basico.modalidade_ensino_basico modalidade5_ ON
etapaensin1_.id_modalidade = modalidade5_.id_modalidade_ensino_basico
LEFT OUTER JOIN comum.unidade unidade6_ ON
modalidade5_.id_unidade = unidade6_.id_unidade
LEFT OUTER JOIN basico.nivel_etapa_ensino niveletapa7_ ON
etapaensin1_.id_nivel_etapa = niveletapa7_.id_nivel_etapa_ensino
LEFT OUTER JOIN comum.unidade unidade8_ ON
niveletapa7_.id_unidade = unidade8_.id_unidade
LEFT OUTER JOIN basico.situacao_etapa_ensino situacaoet9_ ON
etapaensin1_.id_situacao = situacaoet9_.id_situacao
LEFT OUTER JOIN comum.unidade unidade10_ ON
etapaensin1_.id_unidade = unidade10_.id_unidade
LEFT OUTER JOIN comum.unidade unidade11_ ON
serie0_.id_unidade = unidade11_.id_unidade
WHERE serie0_.id_serie =52230479;


1648514
1648519, 1648524, 1648529