select
	u.nome as dired,
	m.nome,
	e.nome as escola,
	t.descricao as turno,
	v.placa,
	r.descricao as nome_rota,
	COUNT(distinct d.id_discente) as alunos,
	t.id_turno
from
	transporte.rota r
join transporte.rota_detalhe rd
		using (id_rota)
join transporte.rota_discente rdi
		using (id_rota)
join transporte.rota_veiculo rv
		using (id_rota)
join discente d
		using (id_discente)
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
where
	rv.ativo = trueValue()
	and (rdi.data_fim is null
		or DATE(rdi.data_fim) >= DATE(NOW()))
	and r.ativo = trueValue()
	and rdi.ativo
	and e.id_escola = 52232846
	and r.id_rota = 61024795
group by
	u.nome,
	m.nome,
	e.nome,
	t.descricao,
	v.placa,
	r.descricao,
	t.id_turno
order by
	u.nome,
	m.nome,
	e.nome,
	t.id_turno,
	t.descricao,
	v.placa,
	r.descricao;
