SELECT t1.id_turma AS col_0_0_, t1.agrupadora AS col_1_0_, t1.ano AS col_2_0_, t1.descricao_horario AS col_3_0_, t1.periodo AS col_4_0_, situacaotu1_.id_situacao_turma AS col_5_0_, situacaotu1_.descricao AS col_6_0_, componente2_.id_componente_curricular AS col_7_0_, componente2_.nome AS col_8_0_, escola5_.id_escola AS col_9_0_, escola5_.nome AS col_10_0_, serie4_.id_serie AS col_11_0_, ts.nome AS col_12_0_, CASE WHEN situacaotu1_.id_situacao_turma = 3 THEN TRUE
ELSE FALSE END AS col_13_0_, serie4_.id_serie AS id1_911_, serie4_.ativo AS ativo911_, serie4_.bloquear_edicao AS bloquear3_911_, serie4_.bloquear_oferta_vagas AS bloquear4_911_, serie4_.capacidade_excesso AS capacidade5_911_, serie4_.capacidade_maxima AS capacidade6_911_, serie4_.capacidade_minima AS capacidade7_911_, serie4_.cod_censo AS cod8_911_, serie4_.codigo_rh AS codigo9_911_, serie4_.correcao_fluxo AS correcao10_911_, serie4_.data_atualizacao AS data11_911_, serie4_.data_cadastro AS data12_911_, serie4_.descricao AS descricao911_, serie4_.emite_certificado AS emite14_911_, serie4_.id_etapa_ensino AS id29_911_, serie4_.exige_carga_horaria_por_componente AS exige15_911_, serie4_.final_etapa AS final16_911_, serie4_.multisseriada AS multiss17_911_, serie4_. nao_contabiliza_turma AS column18_911_, serie4_.numero AS numero911_, serie4_.permite_avanco_estudo AS permite20_911_, serie4_.permite_gerenciar_turma_sem_horario AS permite21_911_, serie4_.permite_participar_atv_esportiva AS permite22_911_, serie4_.permite_participar_sol_cadastro_reserva AS permite23_911_, serie4_.id_proxima_serie AS id31_911_, serie4_.qtd_assistente_educacional AS qtd24_911_, serie4_.id_registro_atualizacao AS id30_911_, serie4_.id_registro_entrada AS id32_911_, serie4_.sigla AS sigla911_, serie4_.tipo_diario AS tipo26_911_, serie4_.id_unidade AS id28_911_, serie4_. verifica_frequencia_anos_anteriores AS column27_911_
FROM ensino.turma t1
INNER JOIN ensino.situacao_turma situacaotu1_ ON
t1.id_situacao_turma = situacaotu1_.id_situacao_turma
INNER JOIN ensino.componente_curricular componente2_ ON
t1.id_disciplina = componente2_.id_componente_curricular
INNER JOIN basico.turma_serie ts ON
t1.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie serie4_ ON
ts.id_serie = serie4_.id_serie
INNER JOIN escola.escola escola5_ ON
ts.id_escola = escola5_.id_escola
LEFT OUTER JOIN basico.categoria_componente categoriac6_ ON
t1.id_categoria_componente = categoriac6_.id_categoria_componente, basico.etapa_ensino etapaensin7_
WHERE serie4_.id_etapa_ensino = etapaensin7_.id_etapa_ensino
AND t1.id_turma_serie = 51919719
AND t1.ano = 2025
AND (t1.id_turma_agrupadora IS NULL)
--AND t1.tipo <>?
AND (situacaotu1_.id_situacao_turma IN (1 , 3 , 7))
ORDER BY escola5_.nome, etapaensin7_.denominacao, serie4_.descricao, t1.periodo, componente2_.nome;

SELECT cbc.id_componente_curricular
FROM basico.curriculo_basico cb
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = cb.id_curriculo_basico
JOIN basico.turma_serie ts ON
ts.id_turma_serie = 51919718
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
RIGHT JOIN ensino.docente_turma dt ON
dt.id_turma = t.id_turma
WHERE cbc.permite_alocacao_adjunto
AND cb.ativo
AND NOT dt.finalizada
AND dt.ativo
AND cbc.id_componente_curricular = t.id_disciplina
AND ts.id_curriculo_medio = cb.id_curriculo_basico;

SELECT /*t1.id_turma , t1.agrupadora , t1.ano , t1.descricao_horario , t1.periodo, 
situacaotu1_.id_situacao_turma , situacaotu1_.descricao , componente2_.id_componente_curricular , componente2_.nome, escola5_.id_escola , 
escola5_.nome , serie4_.id_serie , ts.nome , CASE WHEN situacaotu1_.id_situacao_turma = 3 THEN TRUE
ELSE FALSE END , serie4_.id_serie , serie4_.ativo , serie4_.bloquear_edicao , serie4_.bloquear_oferta_vagas, serie4_.capacidade_excesso , 
serie4_.capacidade_maxima , serie4_.capacidade_minima , serie4_.cod_censo , serie4_.codigo_rh , serie4_.correcao_fluxo, 
serie4_.data_atualizacao , serie4_.data_cadastro , serie4_.descricao , serie4_.emite_certificado , serie4_.id_etapa_ensino ,
serie4_.exige_carga_horaria_por_componente, serie4_.final_etapa, serie4_.multisseriada , serie4_. nao_contabiliza_turma , serie4_.numero , 
serie4_.permite_avanco_estudo , serie4_.permite_gerenciar_turma_sem_horario , serie4_.permite_participar_atv_esportiva , 
serie4_.permite_participar_sol_cadastro_reserva , serie4_.id_proxima_serie , serie4_.qtd_assistente_educacional _, serie4_.id_registro_atualizacao 
, serie4_.id_registro_entrada , serie4_.sigla , serie4_.tipo_diario , serie4_.id_unidade 
, serie4_. verifica_frequencia_anos_anteriores */
ts.*
FROM ensino.turma t1
INNER JOIN ensino.situacao_turma situacaotu1_ ON
t1.id_situacao_turma = situacaotu1_.id_situacao_turma
INNER JOIN ensino.componente_curricular componente2_ ON
t1.id_disciplina = componente2_.id_componente_curricular
INNER JOIN basico.turma_serie ts ON
t1.id_turma_serie = ts.id_turma_serie
INNER JOIN basico.serie serie4_ ON
ts.id_serie = serie4_.id_serie
INNER JOIN escola.escola escola5_ ON
ts.id_escola = escola5_.id_escola
LEFT OUTER JOIN basico.categoria_componente categoriac6_ ON
t1.id_categoria_componente = categoriac6_.id_categoria_componente, basico.etapa_ensino etapaensin7_
WHERE serie4_.id_etapa_ensino = etapaensin7_.id_etapa_ensino
AND t1.id_turma_serie = 51919719
AND t1.ano = 2026
AND (t1.id_turma_agrupadora IS NULL)
AND t1.tipo <> 2
AND (situacaotu1_.id_situacao_turma IN (1 , 3 , 7))
ORDER BY escola5_.nome, etapaensin7_.denominacao, serie4_.descricao, t1.periodo, componente2_.nome;

SELECT t1.id_turma , t2.id_turma , t1.codigo , t1.periodo , t1.capacidade_aluno , t1.tipo , t1.ordem , 
t1.agrupadora , t1.nome_professor , t1.ano , t1.id_turma_agrupadora , t.ano , componente3_.nome ,
t.codigo, t1.id_situacao_turma , situacaotu5_.descricao, t1.id_turma_serie , ts.nome, ts.tipo_diario , 
ts.periodo , ts.id_tipo_turma_serie , ts.id_turno , ts.id_turno ,
ts.data_cadastro , ts.id_turma_serie_agrupadora , turmaserie22_.nome, turmaserie22_.tipo_diario , turmaserie22_.id_curriculo_medio ,
ts.capacidade_aluno , ts.ano , ts.id_curriculo_medio , curriculob9_.multisseriado , curriculob9_.possui_parte_diversificada,
curriculob9_.tipo_diario , curriculob9_.tipo_diario_diversificado , curriculob9_.habilita_relatorio_final_polivalente , ts.id_serie A, 
serie11_.descricao, serie11_.tipo_diario , serie11_.multisseriada , serie11_.id_etapa_ensino , 
etapaensin14_.denominacao , etapaensin14_.periodicidade_etapa , etapaensin14_.id_forma_organizacao_Etapa , 
etapaensin14_.id_modalidade , ts.id_escola A, escola83_.nome , escola83_.id_municipio , 
municipio88_.nome , escola83_.id_regional_ensino , unidade93_.nome AS col_49_0_, t1.id_disciplina AS col_50_0_, 
componente6_.nome _, componente6_.codigo AS col_52_0_, componente6_.nivel AS col_53_0_, componente6_.id_tipo_componente AS col_54_0_, 
componente6_.sigla , t1.id_categoria_componente AS col_56_0_, categoriac4_.descricao AS col_57_0_,(SELECT DISTINCT curriculob101_.ch_ano
FROM basico.curriculo_basico_componente curriculob101_, basico.curriculo_basico curriculob102_
WHERE curriculob101_.id_curriculo_basico = curriculob102_.id_curriculo_basico
AND curriculob101_.id_componente_curricular = t1.id_disciplina
AND curriculob101_.id_curriculo_basico = ts.id_curriculo_medio) AS col_58_0_, turno20_.id_turno AS id1_618_0_, formaorgan77_.id_forma_organizacao_etapa AS id1_904_1_, tipocompon98_.id_tipo_disciplina AS id1_611_2_, turno20_.ativo AS ativo618_0_, turno20_.codigo_rh AS codigo3_618_0_, turno20_.descricao AS descricao618_0_, turno20_.hora_fim AS hora5_618_0_, turno20_.hora_inicio AS hora6_618_0_, turno20_.ordem AS ordem618_0_, turno20_.sigla AS sigla618_0_, formaorgan77_.data_atualizacao AS data2_904_1_, formaorgan77_.denominacao AS denomina3_904_1_, formaorgan77_.gerencia_turmas_individuais AS gerencia4_904_1_, formaorgan77_.id_registro_atualizacao AS id5_904_1_, formaorgan77_.id_unidade AS id6_904_1_, tipocompon98_.ativo AS ativo611_2_, tipocompon98_.cr_ead_max AS cr3_611_2_, tipocompon98_.descricao AS descricao611_2_
FROM ensino.turma t1
LEFT OUTER JOIN ensino.turma t ON t1.id_turma_agrupadora = t.id_turma
LEFT OUTER JOIN ensino.componente_curricular componente3_ ON
t.id_disciplina = componente3_.id_componente_curricular
LEFT OUTER JOIN basico.categoria_componente categoriac4_ ON
t1.id_categoria_componente = categoriac4_.id_categoria_componente
INNER JOIN ensino.situacao_turma situacaotu5_ ON
t1.id_situacao_turma = situacaotu5_.id_situacao_turma
INNER JOIN ensino.componente_curricular componente6_ ON
t1.id_disciplina = componente6_.id_componente_curricular
INNER JOIN ensino.tipo_componente_curricular tipocompon98_ ON
componente6_.id_tipo_componente = tipocompon98_.id_tipo_disciplina
INNER JOIN basico.turma_serie ts ON
t1.id_turma_serie = ts.id_turma_serie
LEFT OUTER JOIN basico.curriculo_basico curriculob9_ ON
ts.id_curriculo_medio = curriculob9_.id_curriculo_basico
INNER JOIN basico.serie serie11_ ON
ts.id_serie = serie11_.id_serie
INNER JOIN basico.etapa_ensino etapaensin14_ ON
serie11_.id_etapa_ensino = etapaensin14_.id_etapa_ensino
INNER JOIN basico.modalidade_ensino_basico modalidade18_ ON
etapaensin14_.id_modalidade = modalidade18_.id_modalidade_ensino_basico
INNER JOIN basico.forma_organizacao_etapa formaorgan77_ ON
etapaensin14_.id_forma_organizacao_Etapa = formaorgan77_.id_forma_organizacao_etapa
INNER JOIN ensino.turno turno20_ ON
ts.id_turno = turno20_.id_turno
LEFT OUTER JOIN basico.turma_serie turmaserie22_ ON
ts.id_turma_serie_agrupadora = turmaserie22_.id_turma_serie
LEFT OUTER JOIN ensino.turma t2  ON t2.id_turma_bloco  = turmaserie22_.id_turma_serie
LEFT OUTER JOIN basico.curriculo_basico curriculob25_ ON
turmaserie22_.id_curriculo_medio = curriculob25_.id_curriculo_basico, escola.escola escola83_, comum.municipio municipio88_, comum.unidade unidade93_
WHERE ts.id_escola = escola83_.id_escola
AND escola83_.id_municipio = municipio88_.id_municipio
AND escola83_.id_regional_ensino = unidade93_.id_unidade
AND (t1.id_turma IN (684341))
AND t1.id_situacao_turma <> 4
ORDER BY etapaensin14_.denominacao, serie11_.descricao, t1.codigo, componente6_.nome
