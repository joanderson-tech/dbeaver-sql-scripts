--52162673   52288632

SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 52288632;  MUPREINT  -- 51963189 CMPEX02    51948319   EIP1INT 51948319

select * from ensino_infantil.relatorio_avaliativo_habilidade h where h.id_relatorio_avaliativo_componente =  18;


SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (52288632) ; 

select string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 44 ;

select * --string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 48 ;


select * --string_agg(id_habilidade_competencia ::varchar, ', ')  
from ensino_infantil.configuracao_relatorio_componente_habilidade crch  where crch.id_configuracao_relatorio_componente_habilidade = 44;

select * from ensino_infantil.habilidade_competencia hc where hc.id_habilidade_competencia in (51869907, 51869908, 51869909, 51869910, 51869911, 51869912);

51869985, 51869986, 51869987, 51869988, 51869989, 51869991

SELECT crc.* FROM ensino_infantil.configuracao_relatorio_componente AS crc
WHERE id_configuracao_relatorio_componente = 8;

SELECT rac.* FROM ensino_infantil.relatorio_avaliativo_componente AS rac
WHERE id_relatorio_avaliativo_componente = 44;

select * from ensino_infantil.configuracao_relatorio_componente crc;  where crc.id_configuracao_relatorio = 4;

select * -- string_agg(id_componente_curricular ::varchar, ', ')  
from ensino_infantil.configuracao_relatorio_componente crc 
where crc.id_configuracao_relatorio = 31; 


521, 222, 223, 221, 229, 238, 224, 225, 230, 506, 510, 511, 512, 513


begin;

commit;




-- Inserir a configuração do relatório
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 52288632, 4, 6, true, 'IFM', NULL, NULL, current_date, NULL, true);

-- Inserir a configuração do componente do relatório
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq'), cr.id_configuracao_relatorio, foo.id_componente_curricular, 2, NULL, true, NULL, NULL, current_date, NULL, FALSE, FALSE
FROM ensino_infantil.configuracao_relatorio cr
	CROSS JOIN unnest(ARRAY[521, 222, 223, 221, 229, 238, 224, 225, 230, 506, 510, 511, 512, 513]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (52288632)
ORDER BY cr.id_configuracao_relatorio, foo.id_componente_curricular;

-- Inserir a configuração das habilidades do componente do relatório
WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (30) 
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 30,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (values
		(52288632, 52162673) --IFM
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (52288632);