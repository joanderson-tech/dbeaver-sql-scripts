 select
	d.id_discente,
	d.matricula,
	d.status,
	d.nivel,
	d.tipo,
	p.nome as nome_discente,
	d.ano_ingresso,
	d.periodo_ingresso,
	esc.id_escola,
	esc.nome as nome_escola,
	mun_esc.nome as nome_mun_escola,
	mee.id_matricula_discente_serie as id_matricula_estudante_serie,
	s.id_serie,
	s.descricao as serie_nome,
	etapa.id_etapa_ensino as id_etapa,
	etapa.denominacao as etapa_nome,
	mee.id_situacao_matricula_serie,
	sms.descricao as situacaoMatricula,
	t.descricao as turnoDescricao,
	ts.nome as nomeTurma,
	est.participa_bolsa_familia as participaBolsaFamilia,
	cb.possui_parte_diversificada
from
	discente d
inner join comum.pessoa p on
	(p.id_pessoa = d.id_pessoa)
inner join basico.estudante est on
	(est.id_estudante = d.id_discente)
left join basico.matricula_estudante_serie mee on
	mee.id_estudante = est.id_estudante
	and mee.data_cadastro = (
	select
		MAX(mee2.data_cadastro)
	from
		basico.matricula_estudante_serie mee2
	where
		mee2.id_estudante = est.id_estudante
		and mee2.ano_calendario = mee.ano_calendario )
left join basico.turma_serie ts on
	(mee.id_turma_serie = ts.id_turma_serie)
left join basico.curriculo_basico cb on
	cb.id_curriculo_basico = ts.id_curriculo_medio
left join ensino.turno t on
	(mee.id_turno = t.id_turno)
left join basico. situacao_matricula_serie sms
		using(id_situacao_matricula_serie)
left join escola.escola_etapa_ensino_serie esc_serie on
	(esc_serie.id_escola_etapa_ensino_serie = mee.id_serie_escola)
left join escola.escola esc on
	(esc.id_escola = esc_serie.id_escola)
left join escola.configuracao_escola ce on
	(esc.id_escola = ce.id_Escola)
left join comum.municipio as mun_esc on
	(mun_esc.id_municipio = esc.id_municipio)
left join basico.serie s on
	(s.id_serie = esc_serie.id_serie)
left join basico.grupo_serie gs on
	(gs.id_serie = s.id_serie)
left join basico.etapa_ensino etapa on
	(etapa.id_etapa_ensino = s.id_etapa_ensino)
where
	1 = 1
	and mee.ano_calendario = '2024'
	and d.nivel = 'B'
	and ( upper(p.nome) like '%INGRID NAIARA VIEIRA DA SILVA%'
		or upper(p.nome_ascii) like '%INGRID NAIARA VIEIRA DA SILVA%')
	and sms.id_situacao_matricula_serie in ( 1, 2, 3,-1, 8, 5, 4, 7, 10, 6, 9, 11 )
order by
	mun_esc.nome,
	esc.nome,
	p.nome;
	

select * from basico.matricula_estudante_serie mes where id_estudante = 1390079;