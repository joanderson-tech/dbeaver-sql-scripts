

begin;

--Primeira copia 
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
values
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880517, 4, 6, true, 'AI2', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880526, 4, 6, true, 'AI3', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880535, 4, 6, true, 'AI4', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880544, 4, 6, true, 'AI5', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35555398, 4, 6, true, 'AF5INT', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35556003, 4, 6, true, '1F', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51882502, 4, 6, true, '2F', NULL, NULL, current_date, NULL, TRUE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq'), cr.id_configuracao_relatorio, foo.id_componente_curricular, 2, NULL, true, NULL, NULL, current_date, NULL, FALSE, FALSE
FROM ensino_infantil.configuracao_relatorio cr
	CROSS JOIN unnest(ARRAY[222, 223, 221, 229, 238, 224, 225, 230]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (51880517,51880526, 51880535, 51880544, 35555398, 35556003, 51882502)
ORDER BY cr.id_configuracao_relatorio, foo.id_componente_curricular;


WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (1) 
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 1,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (values
		(51880517, 35497185),
		(51880526, 35497185),
		(51880535, 35497185),
		(51880544, 35497185),
		(35555398, 35497185),
		(35556003, 35497185),
		(51882502, 35497185)
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (51880517,51880526, 51880535, 51880544, 35555398, 35556003, 51882502);

begin;

--segunda copia Não precisa da configuracao_relatorio_componente_habilidade pois ela é descritiva 
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880886, 2, 5, true, 'EICB2', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51869717, 2, 5, true, 'EICM', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51869718, 2, 5, true, 'EIPI1', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 1012879, 2, 5, true, 'EIPI2', NULL, NULL, current_date, NULL, TRUE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq'), cr.id_configuracao_relatorio, foo.id_componente_curricular, 1, NULL, true, NULL, NULL, current_date, NULL, FALSE, FALSE
FROM ensino_infantil.configuracao_relatorio cr
	CROSS JOIN unnest(ARRAY[506, 507, 508, 509, 510]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (51880886, 51869717, 51869718, 1012879)
ORDER BY cr.id_configuracao_relatorio, foo.id_componente_curricular;



UPDATE ensino_infantil.configuracao_relatorio cr SET ativo = FALSE WHERE cr.id_curriculo_basico IN (51880517,51880526, 51880535, 51880544, 35555398, 35556003, 51882502,51880886, 51869717, 51869718, 1012879);

