SELECT *
FROM basico.curriculo_basico
WHERE codigo IN ('NIDHRG5');

SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.codigo IN ('NIDHRG4', 'NIDHRG5');
--IN ('NIDHRG4','EMEITIP2');

SELECT *
FROM basico.curriculo_basico
WHERE codigo IN ('NIDHRG4', 'NIDHRG5');

SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.codigo IN ('EMEITIP2', 'EMEITIP1');

SELECT *
--string_agg(id_componente_curricular::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN(49) ;

SELECT * FROM basico.curriculo_basico;
WHERE id_curriculo_basico = 52824686;

SELECT * id_componente_curricular
FROM ensino_infantil.configuracao_relatorio AS cr
WHERE cr.id_curriculo_basico IN (52824704) ;

SELECT * -- DISTINCT id_componente_curricular
--string_agg(id_configuracao_relatorio_componente::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN(44,49) ;
AND id_componente_curricular IN (221, 222, 230, 229, 223, 224, 225, 238) ;
--vai alterar aqui 

SELECT *
--string_agg(id_configuracao_relatorio_componente::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (76, 77) ;


;

BEGIN;
--PASSO 01
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 83382276, 4, 5, TRUE, 'NIDHRG4', NULL, NULL, now(), NULL, FALSE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 83382286, 4, 5, TRUE, 'NIDHRG5', NULL, NULL, now(), NULL, FALSE);

--PASSO 02
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(
    id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo
)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq') AS id_configuracao_relatorio_componente, cr.id_configuracao_relatorio, foo.id_componente_curricular, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN 1
ELSE 2
    END AS id_tipo_avaliacao_componente_relatorio, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN 9999
ELSE NULL
    END AS maximo_caracteres_relatorio, TRUE AS ativo, NULL AS id_registro_cadastro, NULL AS id_registro_atualizacao, current_date AS data_cadastro, NULL AS data_alteracao, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN FALSE
ELSE TRUE
    END AS possui_parecer_final_fixo, TRUE AS possui_parecer_final_descritivo
FROM ensino_infantil.configuracao_relatorio cr
CROSS JOIN
    UNNEST(ARRAY[283, 513, 514, 515, 516, 517, 518, 519, 520]) AS foo (id_componente_curricular)
WHERE cr.codigo IN ('NIDHRG4', 'NIDHRG5')
ORDER BY
    cr.id_configuracao_relatorio, foo.id_componente_curricular;

--PASSO 03
WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch
JOIN ensino_infantil.configuracao_relatorio_componente crc
	USING(id_configuracao_relatorio_componente)
JOIN ensino_infantil.configuracao_relatorio cr
	USING(id_configuracao_relatorio)
WHERE cr.id_configuracao_relatorio IN (44, 49)
	AND crch.ativo
ORDER BY 
		crc.id_configuracao_relatorio = 44, crc.id_configuracao_relatorio = 49, crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
), curriculo_associacao AS (
	SELECT *
FROM(
VALUES
		(83382276, 61639761), --EMEITIP2
		(83382286, 61639644)--EMEITIP1
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio = cr.id_configuracao_relatorio
JOIN curriculo_associacao ca ON
ca.id_cb_alvo = cr.id_curriculo_basico
JOIN configuracao_relatorio_referencia crr ON
crr.id_curriculo_basico = ca.id_cb_referencia
AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (83382276, 83382286);

SELECT 'UPDATE ensino_infantil.configuracao_relatorio SET ativo = FALSE WHERE id_configuracao_relatorio = ' || cr.id_configuracao_relatorio || ';' AS BACKUP
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.codigo IN ('NIDHRG4', 'NIDHRG5');


