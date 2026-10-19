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
	(mee.id_estudante = est.id_estudante)
	left join basico.curriculo_basico cb on
	cb.id_curriculo_basico = mee.id_curriculo_medio
left join basico.turma_serie ts on
	(mee.id_turma_serie = ts.id_turma_serie)
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
	and mee.ano_calendario = '2023'
	and d.nivel = 'B'
	and ( upper(p.nome) like '%%%%%'
		or upper(p.nome_ascii) like '%%%%%')
	and esc.id_escola = 51870408
	and sms.id_situacao_matricula_serie in ( 6 , -1)
	and mee.id_turma_serie IS NOT NULL
	--and d.matricula = '202330020848'
	--and cb.possui_parte_diversificada = false
order by
	mun_esc.nome,
	esc.nome,
	p.nome;

with ultima_movimentacao as (
select
	distinct id_matricula_estudante_serie,
	max(id_movimentacao_estudante_escola) as id_movimentacao
from
	matricula.movimentacao_estudante_escola mee
group by
	id_matricula_estudante_serie )
select
	mee.id_movimentacao_estudante_escola as idMovimentacao,
	discente.matricula as matricula,
	tst.denominacao as tipo,
	sms.descricao as situacao,
	sms_mee.descricao as situacaoMee,
	pessoa.nome as nomeEstudante,
	escola.nome as origem,
	substring(mee.escola_municipal_privada,
	1,
	50) as destino,
	mes.ano_calendario as ano,
	etapaEnsino.denominacao as descricaoEtapaEnsino,
	serie.descricao as descricaoSerie,
	sm.descricao as descricaoSerieMultisseriado,
	t.descricao as turno,
	mee.data_solicitacao
from
	basico.matricula_estudante_serie mes
inner join basico.estudante estudante on
	estudante.id_estudante = mes.id_estudante
inner join public.discente discente on
	discente.id_discente = estudante.id_estudante
inner join comum.pessoa pessoa on
	pessoa.id_pessoa = discente.id_pessoa
inner join matricula.movimentacao_estudante_escola mee on
	mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
join ultima_movimentacao um on
	um.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	and um.id_movimentacao = mee.id_movimentacao_estudante_escola
inner join matricula.tipo_solicitacao_transferencia tst on
	tst.id_tipo_solicitacao_transferencia = mee.id_tipo_sol_transferencia
inner join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
inner join basico.situacao_matricula_serie sms_mee on
	sms_mee.id_situacao_matricula_serie = mee.id_situacao_matricula_serie
inner join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
inner join escola.escola escola on
	escola.id_escola = eees.id_escola
inner join basico.serie serie on
	serie.id_serie = eees.id_serie
left join basico.serie sm on
	sm.id_serie = mes.id_serie_multisseriado
inner join basico.etapa_ensino etapaEnsino on
	etapaEnsino.id_etapa_ensino = serie.id_etapa_ensino
inner join ensino.turno t on
	t.id_turno = mes.id_turno
where
	mes.id_situacao_matricula_serie = 6
	and mee.id_tipo_sol_transferencia in (3, 4, 5)
	and mes.ano_calendario = 2023
	and mee.id_tipo_sol_transferencia = 3
	and upper(escola.nome) like upper('%Escola Municipal de Educação Básica Santo Antônio%')

inner join matricula.movimentacao_estudante_escola mee on mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie 


select * from escola.escola e 
where e.id_escola =  51870408


select * from basico.situacao_matricula_serie sms  


 select
	sms
from
	basico.situacao_matricula_serie sms
where
	sms.id_situacao_matricula_serie  in ( 2, 3, 8, 4, 7, 10 )
order by
	sms.id_situacao_matricula_serie
	
	
	
	SELECT x.* FROM rh.categoria x