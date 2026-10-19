SELECT turma.id, turma.codigo, turma.periodo, turma.capacidadeAluno, turma.tipo, turma.ordem, turma.agrupadora, turma.nomeProfessor, turma.ano, turma.turmaAgrupadora.id, turma.turmaAgrupadora.ano, turma.turmaAgrupadora.disciplina.nome, turma.turmaAgrupadora.codigo, turma.situacaoTurma.id, turma.situacaoTurma.descricao, turma.turmaSerie.id, turma.turmaSerie.nome, turma.turmaSerie.tipoDiario, turma.turmaSerie.periodo, turma.turmaSerie.tipoTurmaSerie.id, turma.turmaSerie.turno.id, turma.turmaSerie.turno, turma.turmaSerie.dataCadastro, turma.turmaSerie.turmaSerieAgrupadora.id, turma.turmaSerie.turmaSerieAgrupadora.nome, turma.turmaSerie.turmaSerieAgrupadora.tipoDiario, turma.turmaSerie.turmaSerieAgrupadora.curriculo.id, turma.turmaSerie.capacidadeAluno, turma.turmaSerie.ano, turma.turmaSerie.curriculo.id, turma.turmaSerie.curriculo.multisseriado, turma.turmaSerie.curriculo.possuiParteDiversificada, turma.turmaSerie.curriculo.tipoDiario, turma.turmaSerie.curriculo.tipoDiarioDiversificado, turma.turmaSerie.curriculo.habilitaRelatorioFinalPolivalente, turma.turmaSerie.serie.id, turma.turmaSerie.serie.descricao, turma.turmaSerie.serie.tipoDiario, turma.turmaSerie.serie.multisseriada, turma.turmaSerie.serie.etapaEnsino.id, turma.turmaSerie.serie.etapaEnsino.denominacao, turma.turmaSerie.serie.etapaEnsino.periodicidadeEtapa, turma.turmaSerie.serie.etapaEnsino.formaOrganizacao, turma.turmaSerie.serie.etapaEnsino.modalidade.id, turma.turmaSerie.escola.id, turma.turmaSerie.escola.nome, turma.turmaSerie.escola.municipio.id, turma.turmaSerie.escola.municipio.nome, turma.turmaSerie.escola.regionalEnsino.id, turma.turmaSerie.escola.regionalEnsino.nome, turma.disciplina.id, turma.disciplina.nome, turma.disciplina.codigo, turma.disciplina.nivel, turma.disciplina.tipoComponente, turma.disciplina.sigla, turma.categoriaComponente.id, turma.categoriaComponente.descricao ,(SELECT DISTINCT(cbc.chAno)
FROM CurriculoBasicoComponente cbc
WHERE cbc.componente.id = turma.disciplina.id
AND cbc.curriculoMedio = turma.turmaSerie.curriculo.id )
FROM TurmaComponente turma
LEFT JOIN turma.turmaAgrupadora ta
LEFT JOIN turma.turmaAgrupadora.disciplina tad
LEFT JOIN turma.categoriaComponente AS cc
JOIN turma.situacaoTurma st
JOIN turma.disciplina td
JOIN turma.turmaSerie AS ts
LEFT JOIN turma.turmaSerie.curriculo cb
JOIN turma.turmaSerie.serie s
JOIN turma.turmaSerie.serie.etapaEnsino ee
JOIN turma.turmaSerie.serie.etapaEnsino.modalidade m
JOIN turma.turmaSerie.turno tu
LEFT JOIN turma.turmaSerie.turmaSerieAgrupadora AS tsa
LEFT JOIN turma.turmaSerie.turmaSerieAgrupadora.curriculo AS cbAgrupadora
WHERE turma.turmaSerie.id IN (55659431)
AND turma.situacaoTurma.id <> 4
ORDER BY turma.turmaSerie.serie.etapaEnsino.denominacao, turma.turmaSerie.serie.descricao, turma.codigo, turma.disciplina.nome;

SELECT turmacompo0_.*,(SELECT DISTINCT curriculob101_.ch_ano
FROM basico.curriculo_basico_componente curriculob101_, basico.curriculo_basico curriculob102_
WHERE curriculob101_.id_curriculo_basico = curriculob102_.id_curriculo_basico
AND curriculob101_.id_componente_curricular = turmacompo0_.id_disciplina
AND curriculob101_.id_curriculo_basico = turmaserie7_.id_curriculo_medio) AS col_58_0_, turno20_.id_turno AS id1_2415_0_, formaorgan77_.id_forma_organizacao_etapa AS id1_2695_1_, tipocompon98_.id_tipo_disciplina AS id1_2408_2_, turno20_.ativo AS ativo2415_0_, turno20_.codigo_rh AS codigo3_2415_0_, turno20_.descricao AS descricao2415_0_, turno20_.hora_fim AS hora5_2415_0_, turno20_.hora_inicio AS hora6_2415_0_, turno20_.ordem AS ordem2415_0_, turno20_.sigla AS sigla2415_0_, formaorgan77_.data_atualizacao AS data2_2695_1_, formaorgan77_.denominacao AS denomina3_2695_1_, formaorgan77_.gerencia_turmas_individuais AS gerencia4_2695_1_, formaorgan77_.id_registro_atualizacao AS id5_2695_1_, formaorgan77_.id_unidade AS id6_2695_1_, tipocompon98_.ativo AS ativo2408_2_, tipocompon98_.cr_ead_max AS cr3_2408_2_, tipocompon98_.descricao AS descricao2408_2_
FROM ensino.turma turmacompo0_
LEFT OUTER JOIN ensino.turma turmacompo1_ ON
turmacompo0_.id_turma_agrupadora = turmacompo1_.id_turma
LEFT OUTER JOIN ensino.componente_curricular componente3_ ON
turmacompo1_.id_disciplina = componente3_.id_componente_curricular
LEFT OUTER JOIN basico.categoria_componente categoriac4_ ON
turmacompo0_.id_categoria_componente = categoriac4_.id_categoria_componente
INNER JOIN ensino.situacao_turma situacaotu5_ ON
turmacompo0_.id_situacao_turma = situacaotu5_.id_situacao_turma
INNER JOIN ensino.componente_curricular componente6_ ON
turmacompo0_.id_disciplina = componente6_.id_componente_curricular
INNER JOIN ensino.tipo_componente_curricular tipocompon98_ ON
componente6_.id_tipo_componente = tipocompon98_.id_tipo_disciplina
INNER JOIN basico.turma_serie turmaserie7_ ON
turmacompo0_.id_turma_serie = turmaserie7_.id_turma_serie
LEFT OUTER JOIN basico.curriculo_basico curriculob9_ ON
turmaserie7_.id_curriculo_medio = curriculob9_.id_curriculo_basico
INNER JOIN basico.serie serie11_ ON
turmaserie7_.id_serie = serie11_.id_serie
INNER JOIN basico.etapa_ensino etapaensin14_ ON
serie11_.id_etapa_ensino = etapaensin14_.id_etapa_ensino
INNER JOIN basico.modalidade_ensino_basico modalidade18_ ON
etapaensin14_.id_modalidade = modalidade18_.id_modalidade_ensino_basico
INNER JOIN basico.forma_organizacao_etapa formaorgan77_ ON
etapaensin14_.id_forma_organizacao_Etapa = formaorgan77_.id_forma_organizacao_etapa
INNER JOIN ensino.turno turno20_ ON
turmaserie7_.id_turno = turno20_.id_turno
LEFT OUTER JOIN basico.turma_serie turmaserie22_ ON
turmaserie7_.id_turma_serie_agrupadora = turmaserie22_.id_turma_serie
LEFT OUTER JOIN basico.curriculo_basico curriculob25_ ON
turmaserie22_.id_curriculo_medio = curriculob25_.id_curriculo_basico, escola.escola escola83_, comum.municipio municipio88_, comum.unidade unidade93_
WHERE turmaserie7_.id_escola = escola83_.id_escola
AND escola83_.id_municipio = municipio88_.id_municipio
AND escola83_.id_regional_ensino = unidade93_.id_unidade
AND (turmacompo0_.id_turma_serie IN (55659431))
AND turmacompo0_.id_situacao_turma <> 4
ORDER BY etapaensin14_.denominacao, serie11_.descricao, turmacompo0_.codigo, componente6_.nome;

SELECT *
FROM basico.curriculo_basico_componente_optativo;

SELECT string_agg(id_matricula_componente :: varchar , ',')
FROM ensino.matricula_componente mc
 WHERE mc.id_turma = 696439; --mc.id_matricula_estudante_serie = 1336048; mc.id_turma = 696439;


-- Auto-generated SQL script #202602201620
UPDATE ensino.matricula_componente
	SET media_final=NULL
	WHERE id_matricula_componente IN (17158797,17158806,17158878,17158824,17158842,17158779,17158815,17158860,17158869,17158833,17158851,17158770,17160050,17160059,17158788);
