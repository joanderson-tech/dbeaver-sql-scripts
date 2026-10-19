select
	distinct rv.id_rota_veiculo,
	r.id_rota,
	rv.data_inicio,
	rv.data_fim,
	r.id_turno,
	t.descricao as turno_descricao,
	v.id_veiculo,
	v.placa,
	rm.id_rota_motorista,
	rm.data_inicio_vigencia,
	rm.data_fim_vigencia,
	m.id_motorista,
	m.nome as moto,
	emb.id_embarcacao,
	emb.numero_inscricao,
	rma.id_rota_marinheiro,
	rma.data_inicio_vigencia,
	rma.data_fim_vigencia,
	ma.id_marinheiro,
	ma.nome as marinheiro,
	r.kmida,
	r.kmvolta,
	r.descricao as rota_descricao,
	rd.id_rota_detalhe,
	rd.id_escola,
	e.nome as esco,
	rd.bairro,
	rd.tipo_ponto,
	rd.ordem,
	rd.sentido,
	rd.observacao,
	c.id_comunidade,
	c.id_municipio,
	c.nome,
	coalesce(l.id_localidade,
	0),
	l.nome as nome_localidade,
	(
	select
		count(*)
	from
		transporte.rota_veiculo rv
	where
		rv.id_rota = r.id_rota
		and rv.ativo) as quantidade_rota,
	rod.id_rota_discente,
	rod.id_discente
from
	transporte.rota_veiculo rv
join transporte.rota r on
	rv.id_rota = r.id_rota
join transporte.rota_detalhe rd on
	r.id_rota = rd.id_rota
left join transporte.rota_discente rod on
	r.id_rota = rod.id_rota
join ensino.turno t on
	r.id_turno = t.id_turno
left join escola.escola e on
	rd.id_escola = e.id_escola
left join escola.bairro_escola be on
	be.id_bairro_escola = e.id_bairro_escola
left join transporte.veiculo v on
	rv.id_veiculo = v.id_veiculo
left join transporte.rota_motorista rm on
	rv.id_rota_motorista = rm.id_rota_motorista
join comum.municipio mu on
	mu.id_municipio = r.id_municipio
left join transporte.comunidade c on
	rd.id_comunidade = c.id_comunidade
left join transporte.motorista m on
	rm.id_motorista = m.id_motorista
left join transporte.localidade l on
	l.id_localidade = rd.id_localidade
left join transporte.embarcacao emb on
	emb.id_embarcacao = rv.id_embarcacao
left join transporte.rota_marinheiro rma on
	rma.id_rota_marinheiro = rv.id_rota_marinheiro
left join transporte.marinheiro ma on
	ma.id_marinheiro = rma.id_marinheiro
where
	rv.ativo = true
	and r.descricao ilike '01'
order by
	r.id_rota,
	r.descricao ;