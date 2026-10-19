
begin;

commit ;

SELECT * from ensino_infantil.configuracao_relatorio_componente; 

-- Inserir a configuração do relatório
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51877821, 4, 6, true, 'AI2INT', NULL, NULL, current_date, NULL, FALSE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35498937, 4, 6, true, 'AI2', NULL, NULL, current_date, NULL, FALSE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51877808, 4, 6, true, 'AI1INT', NULL, NULL, current_date, NULL, FALSE);

-- Inserir a configuração do componente do relatório
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT 
    nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 
    cr.id_configuracao_relatorio, 
    foo.id_componente_curricular,
    CASE 
        WHEN foo.id_componente_curricular IN (222, 221) THEN 2 
        ELSE 1 
    END AS id_tipo_avaliacao_componente_relatorio,
    CASE 
        WHEN foo.id_componente_curricular IN (222, 221) THEN NULL 
        ELSE 9999 
    END AS maximo_caracteres_relatorio,
    true, NULL, NULL, current_date, NULL, FALSE, FALSE
FROM ensino_infantil.configuracao_relatorio cr
CROSS JOIN unnest(ARRAY[222, 223, 221, 229, 238, 224, 225, 230]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (51877808, 51877821, 35498937)
ORDER BY cr.id_configuracao_relatorio, foo.id_componente_curricular;


-- Inserir a configuração das habilidades do componente do relatório
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
		(51877821, 35497185), --AI2INT
		(35498937, 35497185), --AI2
		(51877808, 35497185) --AI1INT
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (51877821,35498937,51877808);





UPDATE ensino_infantil.configuracao_relatorio cr SET ativo = FALSE WHERE cr.id_curriculo_basico IN IN (51877821,35498937,51877808);