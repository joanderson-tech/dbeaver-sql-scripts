select
	distinct s.id_servidor,
	s.siape,
	s.data_desligamento,
	p.id_pessoa,
	p.cpf_cnpj,
	p.nome,
	p.email,
	p.sexo,
	u.id_unidade,
	u.codigo_unidade,
	u.nome as unidade,
	c.id_categoria,
	c.descricao as categoria,
	ss.id_situacao,
	ss.descricao as situacao,
	e.id_escolaridade,
	e.descricao as escolaridade,
	f.id_formacao,
	f.denominacao as formacao,
	s.digito_siape,
	ca.id_cargo,
	ca.denominacao as cargo,
	a.id_atividade,
	a.descricao as atividade
from
	rh.servidor s
left join comum.pessoa p
		using (id_pessoa)
left join comum.unidade u on
	u.id_unidade = s.id_unidade
left join comum.responsavel_unidade ru on
	ru.id_servidor = s.id_servidor
left join rh.categoria c
		using (id_categoria)
left join rh.situacao_servidor ss
		using (id_situacao)
left join rh.escolaridade e on
	(e.id_escolaridade = p.id_escolaridade)
left join rh.formacao f
		using (id_formacao)
left join rh.cargo ca on
	ca.id_cargo = s.id_cargo
left join rh.atividade a
		using (id_atividade)
join ensino.docente_turma dt on
	(dt.id_docente = s.id_servidor)
join ensino.turma t on
	(t.id_turma = dt.id_turma)
join basico.turma_serie ts on
	(ts.id_turma_serie = t.id_turma_serie)
where
	1 = 1
	and ss.id_situacao <> 50
	and s.id_ativo in ( 1, 7 )
	and (s.data_desligamento is null
		or s.data_desligamento > now())
	and s.id_categoria = 1
	and ts.id_escola = 52232984
	and dt.ativo = true
	and dt.data_fim > '14/05/2025'
order by
	p.nome asc