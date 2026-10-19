SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crc.id_tipo_avaliacao_componente_relatorio, crc.id_tipo_avaliacao_componente_relatorio, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, crch.*
FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
	JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
	JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
WHERE cr.id_configuracao_relatorio IN (1) --  respectivamente: 2º Ano, 3º Ano
	AND crch.ativo
ORDER BY 
	crc.id_configuracao_relatorio = 1,
	--crc.id_configuracao_relatorio = 16,
	crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade;


-- id_curriculo_basico 51877808 AI1INT

SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 51877808;  

SELECT * FROM basico.curriculo_basico cb   where cb.codigo = 'AI2INT';

select * from ensino_infantil.relatorio_avaliativo_habilidade h where h.id_relatorio_avaliativo_componente =  1;

SELECT * FROM ensino_infantil.configuracao_relatorio; AS cr WHERE cr.id_configuracao_relatorio  in (2) ; 

select * --string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente in (2) ;

SELECT crc.* FROM ensino_infantil.configuracao_relatorio_componente AS crc WHERE id_configuracao_relatorio_componente = 10;

SELECT rac.* FROM ensino_infantil.relatorio_avaliativo_componente AS rac
WHERE id_relatorio_avaliativo_componente = 44;

select * --string_agg(id_configuracao_relatorio_componente   ::varchar, ', ') 
from ensino_infantil.configuracao_relatorio_componente crc  where crc.id_configuracao_relatorio = 2

begin;

rollback;

commit;

INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51877821, 4, 7, true, 'AI2INT', NULL, NULL, current_date, NULL, FALSE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35498937, 4, 7, true, 'AI2', NULL, NULL, current_date, NULL, FALSE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51877808, 4, 6, true, 'AI1INT', NULL, NULL, current_date, NULL, FALSE);

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



begin;

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
		(51877821, 35497185) --AI2INT
		(35498937, 35497185) --AI2
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






SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (1) --  respectivamente: 2º Ano, 3º Ano
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 2,
		--crc.id_configuracao_relatorio = 16,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade;





































/*-- CURRICULOS DESTINO
--SERIE						ID_CURRICULO	ID_SERIE	ID_CR_BASE	ID_CURRICULO_REFENCIA
--2º Ano					57108150		1005219		16			57037718
--3º Ano					57108306		1005220		17			57037737

INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 57108150, 4, 7, true, 'EFTIAIN-2', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 57108306, 4, 7, true, 'EFTIAIN-3', NULL, NULL, current_date, NULL, TRUE);


INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq'), cr.id_configuracao_relatorio, foo.id_componente_curricular, 2, NULL, true, NULL, NULL, current_date, NULL, FALSE, FALSE
FROM ensino_infantil.configuracao_relatorio cr
	CROSS JOIN unnest(ARRAY[222,223,221,227,229,238,224,225,230,512,513,514,515,516,517,518,519,520]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (57108150, 57108306)
ORDER BY cr.id_configuracao_relatorio, foo.id_componente_curricular;


WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (16, 17) --  respectivamente: 2º Ano, 3º Ano
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 17,
		crc.id_configuracao_relatorio = 16,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (VALUES
		(57108150, 57037718), --2º Ano
		(57108306, 57037737)  --3º Ano
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (57108150, 57108306);*/