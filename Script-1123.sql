UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);
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

select * from basico.curriculo_basico cb where cb.id_curriculo_basico in (52824686);

select distinct id_habilidade_competencia  from ensino_infantil.configuracao_relatorio_componente_habilidade where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241); --25

select * from ensino_infantil.configuracao_relatorio cr where cr.id_configuracao_relatorio = 25;

SELECT * --string_agg(id_configuracao_relatorio_componente :: varchar , ', ') 
FROM ensino_infantil.configuracao_relatorio_componente crc WHERE id_configuracao_relatorio in (25);

begin;

rollback;
SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (16) --  respectivamente: EF1A, EF2A, EF3A
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 16,
		--crc.id_configuracao_relatorio = 17,
		--crc.id_configuracao_relatorio = 18,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade;


select * from 	ensino_infantil.configuracao_relatorio_componente_habilidade
where	id_configuracao_relatorio_componente_habilidade in (
	select id_configuracao_relatorio_componente_habilidade
	from ensino_infantil.configuracao_relatorio_componente_habilidade crh
	where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235, 242, 243, 244, 245, 246, 247, 248, 249, 256, 257, 258, 259, 260, 261, 262, 263, 236, 237, 238, 239, 240, 241, 250, 251, 252, 253, 254, 255, 264, 265, 266, 267, 268, 269));

UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=1 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);



select * from 	ensino_infantil.configuracao_relatorio_componente_habilidade
where	id_configuracao_relatorio_componente_habilidade in (
	select id_configuracao_relatorio_componente_habilidade
	from ensino_infantil.configuracao_relatorio_componente_habilidade crh
	where id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235, 242, 243, 244, 245, 246, 247, 248, 249, 256, 257, 258, 259, 260, 261, 262, 263, 236, 237, 238, 239, 240, 241, 250, 251, 252, 253, 254, 255, 264, 265, 266, 267, 268, 269));


select * from ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);



select * from discente d where d.matricula = '202130005078'

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 976922 and mes.ano_calendario = 2025;

	
select
	distinct ra.id_relatorio_avaliativo as id_relatorio,
	ra.id_configuracao_relatorio as id_configuracao,
	cr.possui_parecer_descritivo as possui_parecer_descritivo,
	ra.id_matricula_discente_serie as id_mes,
	mes.id_turma_serie,
	mes.id_turma_serie_multisseriado,
	ra.id_situacao_relatorio_avaliativo as id_situacao_relatorio,
	ra.ativo as ativo_relatorio,
	ra.id_parecer_descritivo_individual as id_parecer,
	pdi.ativo as ativo_parecer ,
	ra.situacao as relatorio_situacao,
	ra.justificativa_situacao as relatorio_justificativa_situacao,
	cb.possui_parte_diversificada,
	cb.tipo_diario,
	cb.tipo_diario_diversificado,
	rac.id_configuracao_relatorio_componente as id_configuracao_componente,
	crc.possui_parecer_final_fixo,
	crc.possui_parecer_final_descritivo,
	rac.id_relatorio_avaliativo_componente as id_relatorio_componente,
	rac.parecer_final_fixo,
	rac.parecer_final_descritivo,
	mc.id_matricula_componente as id_matricula_componente,
	rac.avaliacao_descritiva as avaliacao_descritiva,
	rac.id_situacao_relatorio_avaliativo_componente as situacao_componente,
	rac.avaliacao_descritiva_2 as avaliacao_descritiva_2,
	rac.avaliacao_descritiva_3 as avaliacao_descritiva_3,
	rac.avaliacao_descritiva_4 as avaliacao_descritiva_4,
	rah.id_relatorio_avaliativo_habilidade as id_relatorio_habilidade,
	rah.id_configuracao_relatorio_componente_habilidade as id_configuracao_habilidade,
	crch.ativo as configuracao_habilidade_ativo,
	rahr.id_relatorio_avaliativo_habilidade_resposta as id_relatorio_resposta,
	rahr.id_opcao_grupo_avaliacao_relatorio as id_opcao_resposta,
	rahr.periodo as resposta_periodo,
	pdi.descricao as parecer_descricao,
	pdi.descricao_medial as parecer_descricao_medial,
	pdi.descricao_final as parecer_descricao_final,
	p.nome as pessoa_nome,
	p.nome_mae as nome_mae,
	p.nome_pai as nome_pai,
	d.matricula as matricula,
	sms.descricao as situacao_descricao,
	pr.id_periodicidade_relatorio as periodicidade_relatorio,
	pr.descricao as periodicidade_descricao,
	pr.quantidade_repeticoes as periodicidade_qtd_repeticoes,
	pr.unidade_descricao as unidade_descricao,
	tacr.id_tipo_avaliacao_componente_relatorio as id_tipo_avaliacao,
	ogar.id_opcao_grupo_avaliacao_relatorio as opcao_id,
	ogar.sigla as opcao_sigla,
	ogar.descricao as opcao_descricao,
	cc.nome as componente_nome,
	cc.id_componente_curricular as id_componente_curricular,
	ac.descricao as area_conhecimento_descricao,
	cb.id_curriculo_basico,
	hc.id_habilidade_competencia as id_habilidade_competencia,
	hc.descricao as habilidade_descricao,
	crc.maximo_caracteres_relatorio,
	t.id_categoria_componente
from
	basico.matricula_estudante_serie mes
join public.discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
join ensino_infantil.relatorio_avaliativo ra on
	mes.id_matricula_discente_serie = ra.id_matricula_discente_serie
left join ensino_infantil.relatorio_avaliativo_componente rac on
	rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
left join ensino_infantil.parecer_descritivo_individual pdi on
	pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
left join ensino_infantil.relatorio_avaliativo_habilidade rah on
	rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
left join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on
	rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
left join ensino_infantil.configuracao_relatorio_componente crc on
	crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
left join ensino_infantil.configuracao_relatorio cr on
	cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
left join ensino_infantil.grupo_avaliacao_relatorio gar on
	gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio
left join ensino_infantil.opcao_grupo_avaliacao_relatorio ogar on
	ogar.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
left join ensino_infantil.periodicidade_relatorio pr on
	pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio
left join ensino_infantil.tipo_avaliacao_componente_relatorio tacr on
	tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio
left join ensino.componente_curricular cc on
	cc.id_componente_curricular = crc.id_componente_curricular
left join ensino_infantil.area_conhecimento ac on
	ac.id_area_conhecimento = cc.id_area_conhecimento
left join ensino_infantil.configuracao_relatorio_componente_habilidade crch on
	crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
left join ensino_infantil.habilidade_competencia hc on
	hc.id_habilidade_competencia = crch.id_habilidade_competencia
left join ensino.turma t on
	t.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
	and t.id_disciplina = crc.id_componente_curricular
	and t.id_situacao_turma <> 4
left join ensino.matricula_componente mc on
	mc.id_discente = d.id_discente
	and mc.id_componente_curricular = crc.id_componente_curricular
	and mc.id_turma = t.id_turma
left join basico.curriculo_basico cb on
	cb.id_curriculo_basico = cr.id_curriculo_basico
where
	ra.ativo
	/*and crc.ativo
		and ((cr.possui_parecer_descritivo
		and pdi.ativo)
	or not cr.possui_parecer_descritivo)*/
	and d.status <> 2
	and ((ra.id_situacao_relatorio_avaliativo <> 4
		and rac.id_situacao_relatorio_avaliativo_componente <> 4)
	or (mes.id_situacao_matricula_serie = 4
		and (
		select
			count(*)
		from
			basico.movimentacao_estudante me
		where
			me.id_discente = mc.id_discente
			and me.ativo
			and me.id_tipo_movimentacao_estudante = 3
			and ano_escolar = mes.ano_calendario ) > 0) )
	and mes.id_matricula_discente_serie in (1331057)
	and mc.id_situacao_matricula in ( 5, 6, 2, 8, 9, 4 );

select * from ensino_infantil.relatorio_avaliativo_habilidade rah; id_relatorio_avaliativo_componente

SELECT rac.* FROM ensino_infantil.relatorio_avaliativo_componente AS rac WHERE id_matricula_componente in (17171782,17171783,17171784,17171786,17171787,17171788,17171789,17171790,17171793,17171781,17171785,17171794,17171795,17171791,17171792)

SELECT rac.* FROM ensino_infantil.relatorio_avaliativo_componente AS rac WHERE rac.id_matricula_componente  in (17171737,17171738,17171739,17171741,17171742,17171743,17171744,17171745,17171746,17171748,17171740,17171747,17171750,17171749,17171736)


select * from ensino_infantil.habilidade_competencia hc; where hc.id_habilidade_competencia in(508, 236);

select string_agg(id_matricula_componente :: varchar,  ',') from ensino.matricula_componente mc where mc.id_matricula_estudante_serie = 1331132 and mc.id_situacao_matricula = 2;

select * from ensino_infantil.relatorio_avaliativo mc where mc.id_configuracao_relatorio   = 25;

select distinct rah from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on	rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
join ensino_infantil.relatorio_avaliativo_habilidade rah on	rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
--join ensino_infantil.configuracao_relatorio_componente_habilidade crch on	crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
--join ensino_infantil.habilidade_competencia hc on	hc.id_habilidade_competencia = crch.id_habilidade_competencia
where ra.id_configuracao_relatorio = 25 ;
--and ra.id_matricula_discente_serie = 1331057;




UPDATE ensino_infantil.configuracao_relatorio_componente SET id_tipo_avaliacao_componente_relatorio=2 WHERE id_configuracao_relatorio_componente in (228, 229, 230, 231, 232, 233, 234, 235,242, 243, 244, 245, 246, 247, 248, 249,256, 257, 258, 259, 260, 261, 262, 263);

WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
	FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch 
		JOIN ensino_infantil.configuracao_relatorio_componente crc USING(id_configuracao_relatorio_componente)
		JOIN ensino_infantil.configuracao_relatorio cr USING(id_configuracao_relatorio)
	WHERE cr.id_configuracao_relatorio IN (16) --  respectivamente: EF1A, EF2A, EF3A
		AND crch.ativo
	ORDER BY 
		crc.id_configuracao_relatorio = 16,
		crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
),
curriculo_associacao AS (
	SELECT *
	FROM (VALUES
		(52824686, 52448894) --EF1A
	) AS foo (id_cb_alvo, id_cb_referencia)
)
select distinct string_agg(crc.id_configuracao_relatorio_componente:: varchar, ' , ') 
FROM ensino_infantil.configuracao_relatorio cr
	JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	JOIN curriculo_associacao ca ON ca.id_cb_alvo = cr.id_curriculo_basico
	JOIN configuracao_relatorio_referencia crr ON crr.id_curriculo_basico = ca.id_cb_referencia AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (52824686);



