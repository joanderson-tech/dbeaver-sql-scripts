select * from basico.curriculo_basico where codigo = 'EFAI1';


SELECT *
FROM ensino_infantil.configuracao_relatorio cr; WHERE cr.id_curriculo_basico in (1) ; 

select * from basico.matricula_estudante_serie mes where mes.ano_calendario = 2025;



SELECT t.codigo, e.nome FROM basico.curriculo_basico  cb
join basico.turma_serie ts on ts.id_curriculo_medio = cb.id_curriculo_basico 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
join escola.escola e on e.id_escola = ts.id_escola 
WHERE cb.id_curriculo_basico   = 52824686;  


SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 52824686;  
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (52824704) ; 

SELECT string_agg(id_configuracao_relatorio_componente::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio in(25,26,27)  
and id_componente_curricular in (221,222,230,229,223,224,225,238) ; --vai alterar aqui 

SELECT nome FROM ensino.componente_curricular WHERE id_componente_curricular in  (221,222,230,229,223,224,225,238);

select * from ensino_infantil.configuracao_relatorio_componente_habilidade crh
where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);
;

begin;

rollback ;

UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);



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

commit;

begin;


INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35497185, 4, 6, true, 'AI2', NULL, NULL, current_date, NULL, TRUE);


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
WHERE cr.id_curriculo_basico IN (57108150, 57108306);





--backup
--Desativa os novas configuraraçoes de relatorio habilidade 
update	ensino_infantil.configuracao_relatorio_componente_habilidade
set	ativo = false
where	id_configuracao_relatorio_componente_habilidade in (
	select id_configuracao_relatorio_componente_habilidade
	from ensino_infantil.configuracao_relatorio_componente_habilidade crh
	where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235, 242, 243, 244, 245, 246, 247, 248, 249, 256, 257, 258, 259, 260, 261, 262, 263));


UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=1 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);
