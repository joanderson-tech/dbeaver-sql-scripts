with usuario_portal_estudante as (
select
	usuario.login,
	usuario.email,
	pessoa.cpf_cnpj
from
	comum.usuario usuario
inner join comum.pessoa pessoa on
	(pessoa.id_pessoa = usuario.id_pessoa) )
select
	distinct 
	p.nome AS "NOME ALUNO",
	s_mult.descricao,
	p.codigo_inep as "INEP",
	esc.nome as "ESCOLA",
	es.denominacao as "ETAPA ENSINO",
	s.descricao as "SÉRIE",
	t.descricao as "TURNO",
	ts.nome as "TURMA",
	TO_CHAR(p.data_nascimento, 'DD/MM/YYYY') AS "DATA DE NASCIMENTO",
    p.nome_mae AS "NOME MÃE" 
from
	basico.matricula_estudante_serie mes
join basico.estudante e on
	(e.id_estudante = mes.id_estudante)
join discente d on
	(d.id_discente = e.id_estudante)
join comum.pessoa p on
	(p.id_pessoa = d.id_pessoa)
left join comum.tipo_raca tr on
	(tr.id_tipo_raca = p.id_raca)
left join basico.situacao_matricula_serie sms on
	(sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie)
left join comum.informacoes_medicas im on
	(im.id_informacoes_medicas = p.id_informacoes_medicas)
left join escola.escola_etapa_ensino_serie eees on
	(eees.id_escola_etapa_ensino_serie = mes.id_serie_escola)
left join escola.escola esc on
	(esc.id_escola = eees.id_escola)
left join basico.serie s on
	(s.id_serie = eees.id_serie)
join basico.curriculo_basico cb on cb.id_serie = s.id_serie
left join basico.serie s_mult on (s_mult.id_serie = mes.id_serie_multisseriado)
left join basico.etapa_ensino es on
	(es.id_etapa_ensino = s.id_etapa_ensino)
left join basico.turma_serie ts on
	(ts.id_turma_serie = mes.id_turma_serie)
left join comum.municipio m on
	(m.id_municipio = p.id_municipio_contato)
left join comum.municipio m_naturalidade on
	(m_naturalidade.id_municipio = p.id_municipio_naturalidade)
left join comum.unidade_federativa uf_naturalidade on
	(uf_naturalidade.id_unidade_federativa = m_naturalidade.id_unidade_federativa)
left join comum.unidade_federativa uf_estado on
	(uf_estado.id_unidade_federativa = p.id_uf_contato)
left join ensino.turno t on
	(t.id_turno = ts.id_turno)
left join (
	select
		string_agg(distinct tne_nee.descricao, ', ') as motivo,
		string_agg(distinct case when ran.descricao != 'Nenhum' then ran.descricao else null end, ', ') as recurso,
		p_nee.id_pessoa
	from
		comum.pessoa p_nee
	left join comum.pessoa_necessidade_especial pne_nee on
		(pne_nee.id_pessoa = p_nee.id_pessoa)
	left join comum.tipo_necessidade_especial tne_nee on
		(tne_nee.id_tipo_necessidade_especial = pne_nee.id_necessidade_especial)
	left join comum.pessoa_recurso_avaliacao_nee pra on
		pra.id_pessoa = p_nee.id_pessoa
	left join comum.recurso_avaliacao_nee ran on
		pra.id_recurso_avaliacao_nee = ran.id_recurso_avaliacao_nee
			and ran.ativo
		where
			tne_nee.ativo
		group by
			p_nee.id_pessoa ) as nee on
	nee.id_pessoa = p.id_pessoa
left join usuario_portal_estudante upe on
	(upe.cpf_cnpj = p.cpf_cnpj)
left join basico.modalidade_ensino_basico meb on
	(meb.id_modalidade_ensino_basico = es.id_modalidade)
left join educacao_especial.atendimento_educacao_especial_estudante aeee on
	(aeee.id_estudante = e.id_estudante)
left join educacao_especial.tipo_atendimento_educacao_especial_estudante taeee on
	(taeee.id_atendimento_especial_estudante = aeee.id_atendimento_educacao_especial_estudante)
left join educacao_especial.tipo_atendimento_estudante_ee taee on
	(taee.id = taeee.id_tipo)
left join educacenso.educacenso_pessoa eep on
	(eep.id_pessoa = p.id_pessoa)
left join escola.localizacao_diferenciada ld on
	(ld.id_localizacao_diferenciada = eep.id_localidade_diferenciada)
left join (
	select
		string_agg(vte.denominacao, ', ') as tipo_transporte,
		t_e.id_estudante
	from
		basico.estudante t_e
	left join comum.veiculo_transporte_escolar_estudante vtee on
		vtee.id_estudante = t_e.id_estudante
	left join comum.veiculo_transporte_escolar vte on
		vte.id_veiculo_transporte_escolar = vtee.id_veiculo_transporte_escolar
	group by
		t_e.id_estudante ) as transporte on
	transporte.id_estudante = e.id_estudante
left join transporte.rota_discente rd on
	rd.id_discente = d.id_discente
	and rd.ativo
	and (rd.data_fim is null
		or date(rd.data_fim) >= date(now()))
left join transporte.rota r on
	r.id_rota = rd.id_rota
	and r.ativo
where
	1 = 1
	and s_mult.descricao IS null 
	and sms.id_situacao_matricula_serie not in (5, 4, 6, 12, 9)
	and mes.ano_calendario = 2025
	and cb.multisseriado = true
order by
	p.nome asc;