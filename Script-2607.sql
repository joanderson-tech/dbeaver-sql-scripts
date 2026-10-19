SELECT pae.id_plano_anual_ensino, pae.id_turma, pae.referencia, pae.id_situacao_acompanhamento_pedagogico, pae.corrigir_referencia, pae.parecer_supervisor, paec.id_plano_anual_ensino_categoria, paec.unidade_tematica, paec.objeto_conhecimento, paec.habilidade, paec.abordagem_metodologica, paec.avaliacao, paec.unidade_tematica_corrigir, paec.objeto_conhecimento_corrigir, paec.habilidade_corrigir, paec.abordagem_metodologica_corrigir, paec.avaliacao_corrigir, paec.bimestre, pae.mensagem_devolutiva
FROM ava.plano_anual_ensino pae
JOIN ava.plano_anual_ensino_categoria paec ON paec.id_plano_anual_ensino = pae.id_plano_anual_ensino
WHERE pae.id_turma = 684332
AND (paec.bimestre, paec.id_plano_anual_ensino_categoria) IN (SELECT paec_sub.bimestre, MIN(paec_sub.id_plano_anual_ensino_categoria) AS id_plano_anual_ensino_categoria
FROM ava.plano_anual_ensino_categoria paec_sub
WHERE paec_sub.id_plano_anual_ensino = pae.id_plano_anual_ensino
GROUP BY paec_sub.bimestre)
ORDER BY paec.bimestre;

SELECT *
FROM ava.plano_anual_ensino pae
WHERE pae.id_turma = 684332;

SELECT pae.id_plano_anual_ensino, pae.id_turma, pae.referencia, pae.id_situacao_acompanhamento_pedagogico, pae.corrigir_referencia, pae.parecer_supervisor, paec.id_plano_anual_ensino_categoria, paec.unidade_tematica, paec.objeto_conhecimento, paec.habilidade, paec.abordagem_metodologica, paec.avaliacao, paec.unidade_tematica_corrigir, paec.objeto_conhecimento_corrigir, paec.habilidade_corrigir, paec.abordagem_metodologica_corrigir, paec.avaliacao_corrigir, paec.bimestre, pae.mensagem_devolutiva
FROM ava.plano_anual_ensino pae
JOIN ava.plano_anual_ensino_categoria paec ON
paec.id_plano_anual_ensino = pae.id_plano_anual_ensino
WHERE pae.id_turma = 684341
AND (paec.bimestre, paec.id_plano_anual_ensino_categoria) IN (SELECT paec_sub.bimestre, MIN(paec_sub.id_plano_anual_ensino_categoria) AS id_plano_anual_ensino_categoria
FROM ava.plano_anual_ensino_categoria paec_sub
WHERE paec_sub.id_plano_anual_ensino = pae.id_plano_anual_ensino
GROUP BY paec_sub.bimestre)
ORDER BY paec.bimestre;


SELECT * 
FROM ensino.matricula_componente mc
JOIN ensino.turma t ON t.id_turma = mc.id_turma 
WHERE t.id_turma  = 684339;

SELECT * FROM ensino.turma t WHERE t.id_turma = 684339;


51919718

SELECT * FROM basico.turma_serie ts WHERE ts.tipo_diario = 11 AND ano = 2026;
AND 


51919719, 51919720, 51919721, 51919722, 51919718

SELECT paec
FROM ava.plano_anual_ensino pae
JOIN ava.plano_anual_ensino_categoria paec ON paec.id_plano_anual_ensino = pae.id_plano_anual_ensino
WHERE pae.id_turma = 684332

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora = 51919718
OR ts.id_turma_serie = 51919718;

-- Auto-generated SQL script #202608040833
UPDATE basico.curriculo_basico
    SET ativo=true
    WHERE id_curriculo_basico=51919686;


SELECT *
FROM basico.serie
WHERE id_serie = 15289982;

SELECT turmacompo0_.id_turma, turmacompo0_.codigo , turmacompo0_.periodo , turmacompo0_.capacidade_aluno , turmacompo0_.tipo , turmacompo0_.ordem , turmacompo0_.agrupadora , turmacompo0_.nome_professor,
turmacompo0_.ano, turmacompo0_.id_turma_agrupadora , turmacompo1_.ano , componente3_.nome , turmacompo1_.codigo , 
turmacompo0_.id_situacao_turma, situacaotu5_.descricao , turmacompo0_.id_turma_serie , turmaserie7_.nome , 
turmaserie7_.tipo_diario, turmaserie7_.periodo , turmaserie7_.id_tipo_turma_serie , turmaserie7_.id_turno , 
turmaserie7_.id_turno , turmaserie7_.data_cadastro , turmaserie7_.id_turma_serie_agrupadora , turmaserie22_.nome , 
turmaserie22_.tipo_diario , turmaserie22_.id_curriculo_medio , turmaserie7_.capacidade_aluno , turmaserie7_.ano , 
turmaserie7_.id_curriculo_medio , curriculob9_.multisseriado , curriculob9_.possui_parte_diversificada 
, curriculob9_.tipo_diario , curriculob9_.tipo_diario_diversificado , curriculob9_.habilita_relatorio_final_polivalente 
, turmaserie7_.id_serie , serie11_.descricao , serie11_.tipo_diario , serie11_.multisseriada , serie11_.id_etapa_ensino , etapaensin14_.denominacao, 
etapaensin14_.periodicidade_etapa , etapaensin14_.id_forma_organizacao_Etapa , etapaensin14_.id_modalidade , turmaserie7_.id_escola 
, escola83_.nome , escola83_.id_municipio , municipio88_.nome , escola83_.id_regional_ensino , unidade93_.nome , turmacompo0_.id_disciplina , componente6_.nome , 
componente6_.codigo , componente6_.nivel , componente6_.id_tipo_componente , componente6_.sigla A, 
turmacompo0_.id_categoria_componente , categoriac4_.descricao ,(SELECT DISTINCT curriculob101_.ch_ano
FROM basico.curriculo_basico_componente curriculob101_, basico.curriculo_basico curriculob102_
WHERE curriculob101_.id_curriculo_basico = curriculob102_.id_curriculo_basico
AND curriculob101_.id_componente_curricular = turmacompo0_.id_disciplina
AND curriculob101_.id_curriculo_basico = turmaserie7_.id_curriculo_medio) AS col_58_0_, turno20_.id_turno AS id1_618_0_, formaorgan77_.id_forma_organizacao_etapa AS id1_904_1_, tipocompon98_.id_tipo_disciplina AS id1_611_2_, turno20_.ativo AS ativo618_0_, turno20_.codigo_rh AS codigo3_618_0_, turno20_.descricao AS descricao618_0_, turno20_.hora_fim AS hora5_618_0_, turno20_.hora_inicio AS hora6_618_0_, turno20_.ordem AS ordem618_0_, turno20_.sigla AS sigla618_0_, formaorgan77_.data_atualizacao AS data2_904_1_, formaorgan77_.denominacao AS denomina3_904_1_, formaorgan77_.gerencia_turmas_individuais AS gerencia4_904_1_, formaorgan77_.id_registro_atualizacao AS id6_904_1_, formaorgan77_.id_unidade AS id5_904_1_, tipocompon98_.ativo AS ativo611_2_, tipocompon98_.cr_ead_max AS cr3_611_2_, tipocompon98_.descricao AS descricao611_2_
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
AND (turmacompo0_.id_turma IN (684341))
AND turmacompo0_.id_situacao_turma <> 4
ORDER BY etapaensin14_.denominacao, serie11_.descricao, turmacompo0_.codigo, componente6_.nome;
