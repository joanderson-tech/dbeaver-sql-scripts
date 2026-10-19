


--EF1INTEG 	-- 52824686 
--EF1A 		-- 52448894

--EF2A_INTEG 	--52824704
--EF2A 			--52448903

--EF3A_INTEG --52824719
--EF3A  	 --52448912 


SELECT t.codigo, e.nome FROM basico.curriculo_basico  cb
join basico.turma_serie ts on ts.id_curriculo_medio = cb.id_curriculo_basico 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
join escola.escola e on e.id_escola = ts.id_escola 
WHERE cb.id_curriculo_basico   = 52824686;  

select id_curriculo_basico, * FROM basico.curriculo_basico where codigo in ('EF3A','EF3A_INTEG')


SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 52824686;  
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (52824686) ; 

SELECT * --string_agg(id_configuracao_relatorio_componente::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio = 25
and id_componente_curricular in (221,222,230,229,223,224,225,238) ; --vai alterar aqui 

SELECT nome FROM ensino.componente_curricular WHERE id_componente_curricular in  (221,222,230,229,223,224,225,238);

select * from ensino_infantil.configuracao_relatorio_componente_habilidade crh
where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235);


-- Auto-generated SQL script #202509101038
UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235);


UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=1 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235);




--EF1INTEG 	-- 52824686 
--EF1A 		-- 52448894

--EF2A_INTEG 	--52824704
--EF2A 			--52448903

--EF3A_INTEG --52824719
--EF3A  	 --52448912 
---------------------------

begin;

WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (16, 17, 18) --  respectivamente: EF1A, EF2A, EF3A
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 16,
		crc.id_configuracao_relatorio = 17,
		crc.id_configuracao_relatorio = 18,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (VALUES
		(52824686, 52448894), --EF1A
		(52824704, 52448903), --EF2A
		(52824719, 52448912)  --EF3A
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (52824686, 52824704, 52824719);




begin;
rollback;

-- Inserir a configuração das habilidades do componente do relatório para EF1INTEG
WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (16) 
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 16,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (values
		(52824686, 52448894) --IFM
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (52824686);

commit;