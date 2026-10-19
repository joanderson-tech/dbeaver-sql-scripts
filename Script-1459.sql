SELECT *
FROM matricula.calendario_matricula ;
WHERE calendario0_.vigente = TRUE
AND calendario0_.ativo = TRUE



SELECT DISTINCT municipio2_.id_municipio AS id_munic1_15_, municipio2_.ativo AS ativo2_15_, municipio2_.codigo AS codigo3_15_, municipio2_.nome AS nome4_15_, municipio2_.id_unidade_federativa AS id_unida5_15_
FROM matricula.vaga_serie vagaserie0_
CROSS JOIN escola.escola escola1_
INNER JOIN comum.municipio municipio2_ ON
escola1_.id_municipio = municipio2_.id_municipio
WHERE vagaserie0_.id_escola = escola1_.id_escola
AND vagaserie0_.vagas_validadas>0
AND vagaserie0_.removida = FALSE
AND (vagaserie0_.vagas_remanescentes_bloqueadas = FALSE
	OR vagaserie0_.exibir_remanescentes_bloqueadas = TRUE)
AND vagaserie0_.id_calendario_matricula = 54733265;

SELECT unidadefed0_.id_unidade_federativa AS id_unida1_23_0_, unidadefed0_.ativo AS ativo2_23_0_, unidadefed0_.descricao AS descrica3_23_0_, unidadefed0_.id_pais AS id_pais5_23_0_, unidadefed0_.sigla AS sigla4_23_0_, pais1_.id_pais AS id_pais1_16_1_, pais1_.nacionalidade AS nacional2_16_1_, pais1_.nome AS nome3_16_1_
FROM comum.unidade_federativa unidadefed0_
LEFT OUTER JOIN comum.pais pais1_ ON
unidadefed0_.id_pais = pais1_.id_pais
WHERE unidadefed0_.id_unidade_federativa = 27;

SELECT ei.cpf, ei.nome, ei.nome_mae, ei.data_nascimento
FROM matricula.estudante_inscrito ei
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = ei.id_calendario_matricula
LEFT JOIN matricula.historico_convocacao_cadastro_reserva hccr ON
hccr.id_estudante_inscrito = ei.id_estudante_inscrito
AND hccr.tipo_convocacao = 2
WHERE cm.vigente;
AND hccr.id IS NULL
AND ei.id_status = 11;