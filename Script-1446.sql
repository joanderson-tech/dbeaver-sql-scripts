SELECT turmacompo0_.id_turma AS col_0_0_, turmacompo0_.agrupadora AS col_1_0_, turmacompo0_.ano AS col_2_0_, turmacompo0_.descricao_horario AS col_3_0_, turmacompo0_.periodo AS col_4_0_, situacaotu1_.id_situacao_turma AS col_5_0_, situacaotu1_.descricao AS col_6_0_, componente2_.id_componente_curricular AS col_7_0_, componente2_.nome AS col_8_0_, escola5_.id_escola AS col_9_0_, escola5_.nome AS col_10_0_, serie4_.id_serie AS col_11_0_, turmaserie3_.nome AS col_12_0_, CASE WHEN situacaotu1_.id_situacao_turma = 3 THEN TRUE
ELSE FALSE END AS col_13_0_, serie4_.id_serie AS id1_2683_, serie4_.ativo AS ativo2683_, serie4_.bloquear_oferta_vagas AS bloquear3_2683_, serie4_.capacidade_excesso AS capacidade4_2683_, serie4_.capacidade_maxima AS capacidade5_2683_, serie4_.capacidade_minima AS capacidade6_2683_, serie4_.cod_censo AS cod7_2683_, serie4_.codigo_rh AS codigo8_2683_, serie4_.correcao_fluxo AS correcao9_2683_, serie4_.data_atualizacao AS data10_2683_, serie4_.data_cadastro AS data11_2683_, serie4_.descricao AS descricao2683_, serie4_.emite_certificado AS emite13_2683_, serie4_.id_etapa_ensino AS id29_2683_, serie4_.exige_carga_horaria_por_componente AS exige14_2683_, serie4_.final_etapa AS final15_2683_, serie4_.multisseriada AS multiss16_2683_, serie4_. nao_contabiliza_turma AS column17_2683_, serie4_.numero AS numero2683_, serie4_.permite_avanco_estudo AS permite19_2683_, serie4_.permite_gerenciar_turma_sem_horario AS permite20_2683_, serie4_.permite_participar_atv_esportiva AS permite21_2683_, serie4_.permite_participar_sol_cadastro_reserva AS permite22_2683_, serie4_.id_proxima_serie AS id28_2683_, serie4_.id_registro_atualizacao AS id26_2683_, serie4_.id_registro_entrada AS id27_2683_, serie4_.sigla AS sigla2683_, serie4_.tipo_diario AS tipo24_2683_, serie4_.id_unidade AS id30_2683_, serie4_. verifica_frequencia_anos_anteriores AS column25_2683_
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
turmacompo0_.id_categoria_componente = categoriac6_.id_categoria_componente, basico.etapa_ensino etapaensin7_
WHERE serie4_.id_etapa_ensino = etapaensin7_.id_etapa_ensino
AND turmacompo0_.id_turma_serie =76752849
AND turmacompo0_.ano =2025
AND (turmacompo0_.id_turma_agrupadora IS NULL)
AND (situacaotu1_.id_situacao_turma IN (1 , 3 , 7))
--AND turmacompo0_.id_disciplina <> 220
ORDER BY escola5_.nome, etapaensin7_.denominacao, serie4_.descricao, turmacompo0_.periodo, componente2_.nome;


SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 76752849;