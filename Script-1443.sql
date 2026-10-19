SELECT turmacompo0_.id_turma AS col_0_0_, turmacompo0_.agrupadora AS col_1_0_, turmacompo0_.ano AS col_2_0_, turmacompo0_.descricao_horario AS col_3_0_, turmacompo0_.periodo AS col_4_0_, situacaotu1_.id_situacao_turma AS col_5_0_, situacaotu1_.descricao AS col_6_0_, componente2_.id_componente_curricular AS col_7_0_, componente2_.nome AS col_8_0_, escola5_.id_escola AS col_9_0_, escola5_.nome AS col_10_0_, serie4_.id_serie AS col_11_0_, turmaserie3_.nome AS col_12_0_, CASE WHEN situacaotu1_.id_situacao_turma = 3 THEN TRUE
ELSE FALSE END AS col_13_0_, serie4_.id_serie AS id1_899_, serie4_.ativo AS ativo899_, serie4_.bloquear_oferta_vagas AS bloquear3_899_, serie4_.capacidade_excesso AS capacidade4_899_, serie4_.capacidade_maxima AS capacidade5_899_, serie4_.capacidade_minima AS capacidade6_899_, serie4_.cod_censo AS cod7_899_, serie4_.codigo_rh AS codigo8_899_, serie4_.correcao_fluxo AS correcao9_899_, serie4_.data_atualizacao AS data10_899_, serie4_.data_cadastro AS data11_899_, serie4_.descricao AS descricao899_, serie4_.emite_certificado AS emite13_899_, serie4_.id_etapa_ensino AS id29_899_, serie4_.exige_carga_horaria_por_componente AS exige14_899_, serie4_.final_etapa AS final15_899_, serie4_.multisseriada AS multiss16_899_, serie4_. nao_contabiliza_turma AS column17_899_, serie4_.numero AS numero899_, serie4_.permite_avanco_estudo AS permite19_899_, serie4_.permite_gerenciar_turma_sem_horario AS permite20_899_, serie4_.permite_participar_atv_esportiva AS permite21_899_, serie4_.permite_participar_sol_cadastro_reserva AS permite22_899_, serie4_.id_proxima_serie AS id28_899_, serie4_.id_registro_atualizacao AS id26_899_, serie4_.id_registro_entrada AS id30_899_, serie4_.sigla AS sigla899_, serie4_.tipo_diario AS tipo24_899_, serie4_.id_unidade AS id27_899_, serie4_. verifica_frequencia_anos_anteriores AS column25_899_
FROM ensino.turma turmacompo0_
INNER JOIN ensino.situacao_turma situacaotu1_ ON
turmacompo0_.id_situacao_turma = situacaotu1_.id_situacao_turma
INNER JOIN ensino.componente_curricular componente2_ ON
turmacompo0_.id_disciplina = componente2_.id_componente_curricular
INNER JOIN basico.turma_serie turmaserie3_ ON
turmacompo0_.id_turma_serie = turmaserie3_.id_turma_serie
INNER JOIN basico.serie serie4_ ON
turmaserie3_.id_serie = serie4_.id_serie
INNER JOIN escola.escola escola5_ ON
turmaserie3_.id_escola = escola5_.id_escola
LEFT OUTER JOIN basico.categoria_componente categoriac6_ ON
turmacompo0_.id_categoria_componente = categoriac6_.id_categoria_componente, basico.etapa_ensino etapaensin8_
WHERE serie4_.id_etapa_ensino = etapaensin8_.id_etapa_ensino
AND turmacompo0_.id_turma_serie =?
AND turmacompo0_.ano =?
AND turmacompo0_.id_disciplina <> 220
AND (SELECT count(*)
FROM ensino.docente_turma docentetur7_
WHERE docentetur7_.id_turma = turmacompo0_.id_turma
AND (? BETWEEN docentetur7_.data_inicio AND docentetur7_.data_fim)
	AND docentetur7_.ativo =?)= 0
AND turmacompo0_.tipo <>?
AND (situacaotu1_.id_situacao_turma IN (1 , 3 , 7))
ORDER BY escola5_.nome, etapaensin8_.denominacao, serie4_.descricao, turmacompo0_.periodo, componente2_.nome