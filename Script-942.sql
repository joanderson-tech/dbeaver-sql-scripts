
select p.nome, u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma in (688754, 688746, 688747, 688748, 688749, 688750, 688752, 688745, 688753, 688751);

select string_agg(id_turma :: varchar , ', ') from ensino.turma t where t.id_turma_serie = 53037900;

select * from ensino.frequencia_aluno fa where fa.id_turma in (688754, 688746, 688747, 688748, 688749, 688750, 688752, 688745, 688753, 688751) and id_discente = 974333;

select d.id_discente, p.nome from discente d join comum.pessoa p on p.id_pessoa = d.id_pessoa where p.nome ilike '%BRENDA HELOÍSA GONÇALVES SILVA%'

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 974333 and ano_calendario = 2025;

select * from ensino.matricula_componente mc ;

select * from ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr where rahr.id_relatorio_avaliativo_habilidade = 479422;


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
	rac.id_matricula_componente as id_matricula_componente,
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
left join ensino.matricula_componente mc on
	mc.id_matricula_componente = rac.id_matricula_componente
	and mc.id_discente = d.id_discente
left join basico.curriculo_basico cb on
	cb.id_curriculo_basico = cr.id_curriculo_basico
left join ensino.turma t on
	t.id_turma = mc.id_turma
	and t.id_disciplina = mc.id_componente_curricular
where
	ra.ativo
	and crc.ativo
and	rahr.id_opcao_grupo_avaliacao_relatorio is not null
--and	rahr.id_relatorio_avaliativo_habilidade = 479422
	--and hc.id_habilidade_competencia = 51870296
	and ((cr.possui_parecer_descritivo
		and pdi.ativo)
	or not cr.possui_parecer_descritivo)
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
	and mes.id_matricula_discente_serie in (1327729)
	and mc.id_situacao_matricula in ( 5, 6, 2, 8, 9, 4 );

select * from  ensino_infantil.parecer_descritivo_individual pdi where pdi.id_matricula_discente_serie = 1327729;
select * from ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr where rahr.id_relatorio_avaliativo_habilidade = 479422;



select * from ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr; where rahr.id_relatorio_avaliativo_habilidade = 479422;