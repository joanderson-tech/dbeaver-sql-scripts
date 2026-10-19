select nu from ensino.nota_unidade nu
join ensino.matricula_componente mc on mc.id_matricula_componente = nu.id_matricula_componente 
join ensino.turma t on t.id_turma = mc.id_turma 
where t.id_turma_serie = 55493953
and mc.id_matricula_componente = 18008023;

select * from ensino.turma t where id_turma = 728258;

728258


select * from ensino.matricula_componente mc where id_matricula_estudante_serie  = 1424050; 

select * from basico.serie s where id_serie = 1005220;

select id_turma_agrupadora, * from ensino.turma t where id_turma = 727297 and ano=2025;

select * from basico.turma_serie ts where id_turma_serie_agrupadora  = 727288;

SELECT x.* FROM ensino.tipo_componente_curricular x;


--id_matricula_componente 18008023 id_turma 727297  id_componente_curricular  604

-- Auto-generated SQL script #202504171004
UPDATE basico.turma_serie
	SET id_turma_serie_agrupadora=727288
	WHERE id_turma_serie=55493953;





 select
	distinct t.id_turma ,
	t.tipo,
	cc.id_componente_curricular,
	cc.nome ,
	case
		when p.nome is null then 'NÃO INFORMADO'
		else (case
			when t.id_situacao_turma = 3 then p.nome || ' (Consolidada)'
			else p.nome
		end)
	end,
	e.nome,
	ee.id_etapa_ensino,
	ee.denominacao,
	serie.id_serie,
	serie.descricao,
	ts.id_turma_serie,
	ts.nome,
	ts.id_tipo_turma_serie,
	turno.descricao,
	t.agrupadora,
	modulo.denominacao,
	t.grupo,
	foe.gerencia_turmas_individuais,
	t.id_turma_agrupadora,
	serie.tipo_diario,
	dt.data_fim,
	t.id_situacao_turma
from
	ensino.turma t
join ensino.componente_curricular cc on
	(t.id_disciplina = cc.id_componente_curricular)
left join ensino.docente_turma dt on
	(t.id_turma = dt.id_turma
		and dt.ativo = trueValue())
left join rh.servidor s on
	(dt.id_docente = s.id_servidor)
left join comum.pessoa p on
	(s.id_pessoa = p.id_pessoa)
join basico.turma_serie ts on
	(t.id_turma_serie = ts.id_turma_serie)
join basico.serie serie on
	(ts.id_serie = serie.id_serie)
join basico.etapa_ensino ee on
	(serie.id_etapa_ensino = ee.id_etapa_ensino)
join basico.forma_organizacao_etapa foe on
	(foe.id_forma_organizacao_etapa = ee.id_forma_organizacao_etapa)
join ensino.turno turno on
	(ts.id_turno = turno.id_turno )
join escola.escola e on
	(ts.id_escola = e.id_escola)
left join basico.modulo modulo on
	(t.id_modulo = modulo.id_modulo)
where
	t.id_situacao_turma <> 4
	and ts.ano = 2025
	and ts.id_turma_serie = 55493953
order by
	t.grupo,
	modulo.denominacao,
	cc.nome,
	dt.data_fim ;


-- Auto-generated SQL script #202504171020
-- Auto-generated SQL script #202504171052
UPDATE ensino.turma
	SET agrupadora=false
	WHERE id_turma=727297;

  select
	mc.id_matricula_componente,
	mc.media_anual,
	mc.media_final,
	mc.numero_faltas,
	mc.recuperacao,
	mc.ano,
	mc.periodo as periodo_matricula_componente,
	mc.media_anual_modulo,
	mc.prova_especial,
	mc.frequencia,
	mc.ausente_recuperacao,
	sm.id_situacao_matricula,
	sm.descricao as descricao_situacao_matricula,
	mc.conselho_classe,
	t.id_turma,
	t.execucao,
	t.periodo as periodo_turma,
	t.agrupadora,
	t.ordem,
	st.id_situacao_turma,
	st.descricao as descricao_situacao_turma,
	t_agrup.id_turma as id_turma_agrupadora,
	cc.id_componente_curricular as id_componente,
	cc.nome as nome_componente,
	ts.id_turma_serie,
	ts.nome as nome_turma_serie,
	ts.tipo_diario as tipo_diario_turma_serie,
	ts.id_turma_serie_agrupadora,
	tts.id_tipo_turma_serie,
	tts.descricao as descricao_tipo_turma_serie,
	cb.id_curriculo_basico,
	cb.codigo,
	cb.multisseriado as curriculo_multisseriado,
	cb.tipo_diario as tipo_diario_curriculo,
	e.id_escola,
	e.nome as nome_escola,
	dir.id_unidade as id_direc,
	dir.nome as nome_direc,
	s.id_serie,
	s.descricao as descricao_serie,
	s.tipo_diario as tipo_diario_serie,
	s.multisseriada as serie_multisseriada,
	ee.id_etapa_ensino,
	ee.denominacao as etapa_ensino,
	mes.id_matricula_discente_serie,
	mes.num_chamada,
	sms.id_situacao_matricula_serie,
	sms.descricao as descricao_situacao_matricula_serie,
	s_multi.id_serie as id_serie_multi,
	s_multi.tipo_diario as tipo_diario_s_multi,
	s_multi.descricao as descricao_s_multi,
	s_multi.sigla as sigla_s_multi,
	ts_multi.id_turma_serie as id_ts_multi,
	ts_multi.tipo_diario as tipo_diario_ts_multi,
	ts_multi.nome as nome_turma_ts_multi,
	a.id_aproveitamento,
	a.justificativa,
	a.escola as nome_escola_aprov,
	s_aprov.id_serie as id_serie_aprov,
	s_aprov.descricao as descricao_serie_aprov,
	s_aprov.tipo_diario as tipo_diario_serie_aprov,
	d.id_discente,
	d.matricula,
	p.id_pessoa,
	p.nome as nome_pessoa,
	p.cpf_cnpj as cpf
from
	basico.matricula_estudante_serie mes
join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
	and ts.id_serie not in ( 1005310, 1005325, 1005259, 1005268, 19001542 )
	and ts.periodo = mes.periodo
join basico.tipo_turma_serie tts on
	tts.id_tipo_turma_serie = ts.id_tipo_turma_serie
join basico.curriculo_basico cb on
	cb.id_curriculo_basico = ts.id_curriculo_medio
join basico.serie s on
	s.id_serie = ts.id_serie
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
join escola.escola e on
	e.id_escola = ts.id_escola
join comum.unidade dir on
	dir.id_unidade = e.id_regional_ensino
join ensino.turma t on
	t.id_turma_serie = ts.id_turma_serie
	and t.id_situacao_turma in ( 1, 2, 3 )
join ensino.situacao_turma st on
	st.id_situacao_turma = t.id_situacao_turma
join ensino.componente_curricular cc on
	cc.id_componente_curricular = t.id_disciplina
join ensino.matricula_componente mc on
	mc.ano = mes.ano_calendario
	and mc.id_discente = mes.id_estudante
	and mc.id_turma = t.id_turma
	and mc.id_situacao_matricula in ( 5, 6, 2, 8, 10, 9 )
	and mc.id_historico_implantado is null
	and (case
		when mes.id_situacao_matricula_serie = 6 then mc.id_situacao_matricula = 9
		else mc.id_situacao_matricula <> 9
	end )
join ensino.situacao_matricula sm on
	sm.id_situacao_matricula = mc.id_situacao_matricula
join public.discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
left join ensino.turma t_agrup on
	t_agrup.id_turma = t.id_turma_agrupadora
left join basico.turma_serie ts_multi on
	ts_multi.id_turma_serie = mes.id_turma_serie_multisseriado
left join basico.serie s_multi on
	s_multi.id_serie = mes.id_serie_multisseriado
left join diario.aproveitamento a on
	a.id_aproveitamento = mc.id_aproveitamento
left join basico.serie s_aprov on
	s_aprov.id_serie = a.id_serie
where
	mes.id_matricula_discente_serie = (
	select
		max(id_matricula_discente_serie)
	from
		basico.matricula_estudante_serie mes2
	join basico.turma_serie ts2 on
		ts2.id_turma_serie = mes2.id_turma_serie
	where
		mes2.id_estudante = mc.id_discente
		and ts2.id_escola = ts.id_escola
		and mes2.ano_calendario = mes.ano_calendario
		and (mes2.periodo = mc.periodo
			or mc.periodo is null))
	and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10, 13,-1, 6 )
	and t.id_turma_agrupadora = 727288
	and (t.id_categoria_componente is null
		or t.id_categoria_componente <> 2)
	and t.id_turma_agrupadora is not null
order by
	mes.ano_calendario,
	mes.periodo,
	ts.nome,
	cc.nome,
	mes.num_chamada,
	p.nome,
	d.id_discente