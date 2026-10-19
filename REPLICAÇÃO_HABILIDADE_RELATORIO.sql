select *--string_agg(id_curriculo_basico::varchar, ', ')  
from basico.curriculo_basico where codigo in ('AI2');

'EICB2','EICM','EIPI1','EIPI2'

select e.nome, t.codigo, ts.nome  from basico.turma_serie ts 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
join escola.escola e on e.id_escola = ts.id_escola 
where ts.id_curriculo_medio = 51880517


SELECT * --string_agg(id_configuracao_relatorio::varchar, ', ')
FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico in (51880517) ; 

select * from basico.matricula_estudante_serie mes where mes.ano_calendario = 2025;
select * from ensino_infantil.configuracao_relatorio_componente_habilidade where  id_configuracao_relatorio_componente = 2;



SELECT t.codigo, e.nome FROM basico.curriculo_basico  cb
join basico.turma_serie ts on ts.id_curriculo_medio = cb.id_curriculo_basico 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
join escola.escola e on e.id_escola = ts.id_escola 
WHERE cb.id_curriculo_basico   = 52824686;  


SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 52824686;  
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (52824704) ; 

select  * --string_agg(id_componente_curricular::varchar, ', ') 
FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio in(24, 25, 26, 27)  ;
and id_componente_curricular in (221,222,230,229,223,224,225,238) ; --vai alterar aqui 

SELECT nome FROM ensino.componente_curricular WHERE id_componente_curricular in  (221,222,230,229,223,224,225,238);

select * from ensino_infantil.configuracao_relatorio_componente_habilidade crh
where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);
;

begin;

rollback ;

UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);


begin;

select *--string_agg(id_componente_curricular::varchar, ', ')  
from ensino_infantil.configuracao_relatorio_componente where id_configuracao_relatorio = 3;

('AI2','AI3','AI4','AI5','AF5INT','1F','2F');

, , , , , 

INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880526, 4, 6, true, 'AI3', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880535, 4, 6, true, 'AI4', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51880544, 4, 6, true, 'AI5', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35555398, 4, 6, true, 'AF5INT', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 35556003, 4, 6, true, '1F', NULL, NULL, current_date, NULL, TRUE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 51882502, 4, 6, true, '2F', NULL, NULL, current_date, NULL, TRUE);

commit;

INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq'), cr.id_configuracao_relatorio, foo.id_componente_curricular, 1, NULL, true, NULL, NULL, current_date, NULL, FALSE, FALSE
FROM ensino_infantil.configuracao_relatorio cr
	CROSS JOIN unnest(ARRAY[222, 223, 221, 229, 238, 224, 225, 230]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (51880526, 51880535, 51880544, 35555398, 35556003, 51882502)
ORDER BY cr.id_configuracao_relatorio, foo.id_componente_curricular;


WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (1) --  respectivamente: 2º Ano, 3º Ano
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 1,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (VALUES
		(51880526, 35497185),
		(51880535, 35497185),
		(51880544, 35497185),
		(35555398, 35497185),
		(35556003, 35497185),
		(51882502, 35497185)--2º Ano
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (51880526, 51880535, 51880544, 35555398, 35556003, 51882502);


select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 35497185;

SELECT cr.* FROM ensino_infantil.configuracao_relatorio AS cr
WHERE cr.id_curriculo_basico  = 35497185


begin;

rollback ;
--segunda copia 

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


WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (2) 
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 2,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (values
		(51880886, 51869719),
		(51869717, 51869719),
		(51869718, 51869719),
		(1012879, 51869719)
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (51880886, 51869717, 51869718, 1012879);
