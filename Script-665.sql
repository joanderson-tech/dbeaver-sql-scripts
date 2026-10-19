-- Auto-generated SQL script #202506120946
UPDATE basico.matricula_estudante_serie SET id_serie_multisseriado=NULL WHERE id_matricula_discente_serie=1318722;


UPDATE basico.matricula_estudante_serie SET id_serie_multisseriado=1005339 WHERE id_matricula_discente_serie=1318722;


select * from basico.matricula_estudante_serie mes where mes.id_estudante = 977115 and mes.ano_calendario = 2020;

select * from ensino.matricula_componente mc where mc.id_discente = 977115 and mc.ano = 2020;

select * from comum.pessoa p where p.nome = 'VITORIA RAFAELLE PONTES DA PAIXÃO'
select * from discente d where d.id_pessoa  = 51879156;
select * from ensino.turma t where t.id_turma_serie = 51880827;
select * from basico.serie s where s.id_serie =1005339;
select * from basico.serie_equivalencia se where se.id_serie = 51886512;
select * from basico.serie   where id_etapa_ensino IN  ( 3,4 ) and numero is not null  and descricao ~ '^[1-9].*' order by descricao 

select * from diario.historico_implantado hi where hi.id_estudante = 977115;

  with matriculas_estudante as (
select
	*
from
	basico.matricula_estudante_serie smes
join escola.escola_etapa_ensino_serie eees3 on
	eees3.id_escola_etapa_ensino_serie = smes.id_serie_escola
join basico.serie s on
	s.id_serie = eees3.id_serie
where
	id_estudante in (977115)
	and smes.id_situacao_matricula_serie in ( 1, 2, 3, 4, 7, 8, 9, 10, 11, 12, 6 )
	and not (s.multisseriada
		and smes.id_serie_multisseriado is null
		and smes.id_situacao_matricula_serie = 6)  AND (smes.ano_calendario < 2020
		or (eees3.id_escola = 1515
			and smes.ano_calendario = 2020)) )
select
	distinct mes.id_matricula_discente_serie,
	mc.id_matricula_componente as id_matricula,
	d.id_discente as id_discente,
	d.matricula as matricula,
	mes.ano_calendario as ano,
	turno.id_turno,
	turno.descricao as turno_descricao,
	case
		mes.id_situacao_matricula_serie when 12 then cast(saec.resultado_avaliacao_nota as numeric(5, 2))
		else mc.media_final
	end as media_final,
	(mc.media_final * 10)::INTEGER as media_final_porcentagem,
	mc.numero_faltas as numero_faltas,
	coalesce(p.codigo_inep, 'Não informado') as codigoInep,
	cc.nome as disciplina,
	cc.id_componente_curricular as id_disciplina,
	turma.id_turma,
	turma.periodo as periodo,
	case
		when exists (
		select
			*
		from
			ensino.turma tt1
		where
			tt1.id_turma_serie = turma.id_turma_serie
			and tt1.id_situacao_turma <> 4
			and tt1.id_disciplina = turma.id_disciplina
			and tt1.periodo <> turma.periodo) then true
		else false
	end as tem_turma_outro_bloco,
	(case
		when cbc.id_curriculo_basico is not null  
			and cb_ts.possui_parte_diversificada  
			and cbc.id_categoria_componente = 2   THEN cb_ts.tipo_diario_diversificado   ELSE coalesce(ts.tipo_diario, s.tipo_diario)
		end) as tipo_diario,
	sm.descricao as situacao,
	cb_ts.carga_horaria as ch_anual,
	cb_ts.possui_parte_diversificada,
	cb_ts.tipo_diario_diversificado,
	nee.id_nivel_etapa_ensino ,
	nee.denominacao as nivel_etapa,
	ee.denominacao as etapa_ensino,
	ee.id_etapa_ensino,
	ee.id_modalidade,
	ee.eja_especial,
	s.id_serie as id_serie,
	(
	select
		string_agg(ss.id_serie::text, '@')
	from
		basico.serie_equivalencia se
	join basico.serie ss on
		ss.id_serie = se.id_serie_equivalente
	where
		se.id_serie = s.id_serie
		and ss.id_etapa_ensino in ( 3, 4, 5, 9, 10, 51900263, 51900264, 52079587, 52095367 )
			and ss.numero is not null
			and ss.tipo_diario is not null ) as id_serie_equivalente,
	s.descricao as serie_descricao,
	sms.descricao as situacao_serie,
	sms.sigla as situacao_serie_sigla,
	p.nome as nome_discente,
	p.data_nascimento as data_nascimento,
	p.nome_mae as nome_mae,
	p.nome_pai as nome_pai,
	p.codigo_nis as nis,
	p.id_pais_nacionalidade as id_pais,
	p.pais_nacionalidade as nacionalidade,
	p.numero_identidade as rg ,
	mn.nome || ' - ' || uf.sigla as unidade_federativa,
	escola.nome as nome_escola,
	escola.codigo_inep,
	escola.endereco as escola_endereco,
	escola.numero as escola_numero,
	escola.id_escola as id_escola,
	escola.id_unidade_escola unidadeEsc,
	escola.telefone as telefone_escola,
	escola.email as email_escola,
	escola.codigo_cadastro_escolar as codigo_cadastro_escolar,
	mun.nome as escola_municipio,
	bairro.denominacao as escola_bairro,
	ufEsc.sigla as uf_escola,
	ce.id_calendario_escolar as id_calendar,
	case
		when ee.periodicidade_etapa = 'SEMESTRAL' then (
		select
			case
				when turma.periodo = 2 then calEsc.dias_sem_2
				else calEsc.dias_sem_1
			end
		from
			basico.calendario_escolar calEsc
		where
			calEsc.id_calendario_escolar = ce.id_calendario_escolar)
		else (
		select
			sum(calEsc.dias_bim_1 + calEsc.dias_bim_2 + calEsc.dias_bim_3 + calEsc.dias_bim_4)
		from
			basico.calendario_escolar calEsc
		where
			calEsc.id_calendario_escolar = ce.id_calendario_escolar)
	end as dias_letivos,
	eees.id_escola_etapa_ensino_serie,
	hi.id_historico_implantado,
	coalesce(hi.tipo_avaliacao, 'N') as tipo_avaliacao,
	case
		when turma.id_turma_agrupadora is not null then (
		select
			macs.frequencia
		from
			ensino.matricula_componente macs
		where
			macs.id_discente = mc.id_discente
			and macs.id_turma = turma.id_turma_agrupadora
			and macs.id_situacao_matricula in (5, 6, 2, 8))
		else mc.frequencia
	end as frequencia,
	escola.nome as nome_escola_serie,
	turma.agrupadora,
	turma.id_turma_agrupadora,
	turma.id_modulo,
	modulo.denominacao,
	mcPP.id_matricula_componente as id_matricula_progressao,
	case
		when mcPP.id_matricula_componente is null then false
		else true
	end as isProgressao,
	coalesce(escola.ato_criacao_descricao, 'Não informado') as ato_criacao_descricao,
	coalesce(to_char(escola.ato_criacao_data, 'DD/MM/YYYY'), 'Não informado') as ato_criacao_data,
	coalesce(escola.ato_criacao_doe_numero, 'Não informado') as ato_criacao_doe_numero,
	coalesce(to_char(escola.ato_criacao_doe_data, 'DD/MM/YYYY'), 'Não informado') as ato_criacao_doe_data,
	coalesce(escola.ato_autorizacao_descricao, 'Não informado') as ato_autorizacao_descricao,
	coalesce(to_char(escola.ato_autorizacao_data, 'DD/MM/YYYY'), 'Não informado') as ato_autorizacao_data,
	coalesce(escola.ato_autorizacao_doe_numero, 'Não informado') as ato_autorizacao_doe_numero,
	coalesce(to_char(escola.ato_autorizacao_doe_data, 'DD/MM/YYYY'), 'Não informado') as ato_autorizacao_doe_data,
	coalesce(escola.ato_reconhecimento_descricao, 'Não informado') as ato_reconhecimento_descricao,
	coalesce(to_char(escola.ato_reconhecimento_data, 'DD/MM/YYYY'), 'Não informado') as ato_reconhecimento_data,
	coalesce(escola.ato_reconhecimento_doe_numero, 'Não informado') as ato_reconhecimento_doe_numero,
	coalesce(to_char(escola.ato_reconhecimento_doe_data, 'DD/MM/YYYY'), 'Não informado') as ato_reconhecimento_doe_data,
	coalesce(p.profissaoPai, 'Não informado') as profissaoPai,
	coalesce(p.profissaomae, 'Não informado') as profissaomae,
	case
		when pne.id_pessoa is not null then true
		else false
	end as nee,
	p.cpf_cnpj,
	dired.nome as dired,
	mun.nome || ' - ' || ufEsc.sigla as unidade_federativa_escola,
	case
		 WHEN mc.id_situacao_matricula = 11  THEN true
	end as nao_matriculado,
	case
		when mc.id_situacao_matricula = 11 then 'AVE'
	end as sigla_nao_matriculado,
	mc.nao_optou,
	cbc.ch_ano as ch_componente,
	rac.parecer_final_descritivo as parecer_descritivo_componente,
	rac.parecer_final_fixo as parecer_fixo_componente
from
	matriculas_estudante mes
join discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
left join basico.turma_serie ts on
	ts.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
left join basico.curriculo_basico cb_ts on
	cb_ts.id_curriculo_basico = ts.id_curriculo_medio
join escola.escola_etapa_ensino_serie eees2 on
	eees2.id_escola_etapa_ensino_serie = mes.id_serie_escola
left join ensino.matricula_componente mc on
	mc.id_discente = mes.id_estudante
	and (mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		or mc.id_matricula_estudante_serie is null)
	and mc.ano = mes.ano_calendario
	and mc.id_situacao_matricula not in ( 3, 7 )
left join diario.historico_implantado hi on
	mc.id_historico_implantado = hi.id_historico_implantado
left join diario.competencia_habilidades_aluno cha on
	cha.id_historico_implantado = hi.id_historico_implantado
left join basico.situacao_matricula_serie smsi on
	smsi.id_situacao_matricula_serie = hi.id_situacao_matricula
left join basico.serie shi on
	shi.id_serie = eees2.id_serie
left join basico.etapa_ensino eehi on
	eehi.id_etapa_ensino = shi.id_etapa_ensino
left join escola.escola ehi on
	ehi.id_escola = eees2.id_escola
left join basico.estudante est on
	est.id_estudante = d.id_discente
left join comum.pessoa_necessidade_especial pne on
	pne.id_pessoa = d.id_pessoa
left join comum.unidade_federativa uf on
	uf.id_unidade_federativa = p.id_uf_naturalidade
left join comum.municipio mn on
	mn.id_municipio = p.id_municipio_naturalidade
left join ensino.turma turma on
	turma.id_turma = mc.id_turma
left join ensino.turno turno on
	turno.id_turno = mes.id_turno
left join escola.escola escola on
	escola.id_escola = eees2.id_escola
left join comum.municipio mun on
	mun.id_municipio = escola.id_municipio
left join escola.bairro_escola bairro on
	bairro.id_bairro_escola = escola.id_bairro_escola
left join comum.unidade unidade on
	unidade.id_unidade = escola.id_unidade_escola
left join comum.unidade dired on
	dired.id_unidade = escola.id_regional_ensino
left join basico.calendario_escolar ce on
	ce.ano = ts.ano
	and ce.ativo
left join comum.unidade_federativa ufEsc on
	ufEsc.id_unidade_federativa = mun.id_unidade_federativa
left join basico.serie s on
	s.id_serie = coalesce(mes.id_serie_multisseriado, ts.id_serie)
left join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
left join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
left join basico.curriculo_basico_componente cbc on
	cbc.id_curriculo_basico = cb_ts.id_curriculo_basico
	and cbc.id_componente_curricular = mc.id_componente_curricular
left join escola.escola_etapa_ensino_serie eees on
	eees.id_escola = escola.id_escola
	and eees.id_serie = ts.id_serie
join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
left join ensino.componente_curricular cc on
	cc.id_componente_curricular = mc.id_componente_curricular
join ensino.situacao_matricula sm on
	sm.id_situacao_matricula = mc.id_situacao_matricula
	and (sm.id_situacao_matricula in ( 5, 6, 2, 8, 4, 11 )
		or sm.id_situacao_matricula = 9)
left join basico.modulo modulo on
	modulo.id_modulo = turma.id_modulo
left join ensino_infantil.relatorio_avaliativo ra on
	ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
	and ra.ativo
	and ra.id_situacao_relatorio_avaliativo <> 4
left join ensino_infantil.configuracao_relatorio cr on
	cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
left join ensino_infantil.configuracao_relatorio_componente crc on
	crc.id_configuracao_relatorio = cr.id_configuracao_relatorio
	and crc.id_componente_curricular = mc.id_componente_curricular
	and crc.possui_parecer_final_descritivo
left join ensino_infantil.relatorio_avaliativo_componente rac on
	rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
	and rac.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
	and rac.id_situacao_relatorio_avaliativo_componente <> 4
left join ensino.matricula_componente mcPP on
	mcPP.id_discente = mes.id_estudante
	and mcPP.ano = mes.ano_calendario
	and mcPP.id_turma in (
	select
		id_turma
	from
		ensino.matricula_componente mcSub
	join ensino.turma tSub
			using (id_turma)
	where
		tSub.tipo = 5
		and tSub.ano = mes.ano_calendario
		and mcSub.id_discente = mes.id_estudante
		and mcSub.id_situacao_matricula <> 7
		and turma.id_disciplina = tSub.id_disciplina)
left join diario.aproveitamento apr on
	apr.id_aproveitamento = mc.id_aproveitamento
left join ensino.solicitacao_avanco_estudo sae on
	sae.id_matricula_discente_serie_origem = mes.id_matricula_discente_serie
	and sae.id_status_solicitacao_avanco_estudo = 7
left join ensino.solicitacao_avanco_estudo_componente saec on
	saec.id_solicitacao_avanco_estudo = sae.id_solicitacao_avanco_estudo
	and saec.id_componente_curricular = mc.id_componente_curricular
where
	mc.id_turma in (
	select
		id_turma
	from
		ensino.turma t
	where
		id_situacao_turma <> 4
		and t.id_turma_serie = ts.id_turma_serie)
	and nee.id_nivel_etapa_ensino <> 51918782
order by
	mes.ano_calendario asc,
	mes.id_matricula_discente_serie,
	nee.id_nivel_etapa_ensino,
	s.id_serie,
	periodo desc,
	sms.descricao,
	turma.id_modulo desc,
	cc.nome