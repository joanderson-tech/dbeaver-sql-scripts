select distinct
	u.nome as dired,
	m.nome,
	e.nome as escola,
	t.descricao as turno,
	v.placa,
	r.descricao as nome_rota,
	p.nome as discente,
	d.matricula,
	p.cpf_cnpj as cpf,
	t.id_turno,
	rdi.data_cadastro,
	pe.nome as responsavel_cadastro
from
	transporte.rota r
join transporte.rota_detalhe rd
		using (id_rota)
join transporte.rota_discente rdi
		using (id_rota)
join transporte.rota_veiculo rv
		using (id_rota)
join discente d on d.id_discente = rdi.id_discente
join comum.pessoa p
		using (id_pessoa)
join transporte.veiculo v
		using (id_veiculo)
join ensino.turno t
		using (id_turno)
join basico.matricula_estudante_serie mes on
	mes.id_estudante = d.id_discente
join basico.turma_serie ts
		using (id_turma_serie)
join escola.escola e on
	e.id_escola = rd.id_escola
	and e.id_escola = ts.id_escola
join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
join comum.municipio m on
	m.id_municipio = coalesce(e.id_municipio, u.id_municipio)
left join comum.registro_entrada re on
	re.id_entrada = rdi.id_registro_cadastro
left join comum.usuario us on
	us.id_usuario = re.id_usuario
left join comum.pessoa pe on
	pe.id_pessoa = us.id_pessoa
where
	r.ativo = trueValue()
	and (rdi.data_fim is null
		or DATE(rdi.data_fim) >= DATE(NOW()))
	and rv.ativo = trueValue()
	and rdi.ativo
	and r.id_rota = 61070418
group by
	u.nome,
	m.nome,
	e.nome,
	t.descricao,
	v.placa,
	r.descricao,
	p.nome,
	d.matricula,
	p.cpf_cnpj,
	t.id_turno,
	rdi.data_cadastro,
	pe.nome
order by
	u.nome,
	m.nome,
	e.nome,
	t.id_turno,
	t.descricao,
	v.placa,
	r.descricao;