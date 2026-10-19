SELECT DISTINCT rv.id_rota_veiculo, r.id_rota, rv.data_inicio, rv.data_fim, r.id_turno, t.descricao AS turno_descricao, v.id_veiculo, v.placa, rm.id_rota_motorista, rm.data_inicio_vigencia, rm.data_fim_vigencia, m.id_motorista, m.nome AS moto, emb.id_embarcacao, emb.numero_inscricao, rma.id_rota_marinheiro, rma.data_inicio_vigencia, rma.data_fim_vigencia, ma.id_marinheiro, ma.nome AS marinheiro, r.kmida, r.kmvolta, r.tipo_rota, r.min_ida, r.min_volta, r.descricao AS rota_descricao, rd.id_rota_detalhe, rd.id_escola, e.nome AS esco, rd.bairro, rd.tipo_ponto, rd.ordem, rd.sentido, rd.observacao, c.id_comunidade, c.id_municipio, c.nome, COALESCE(l.id_localidade, 0), l.nome AS nome_localidade,(SELECT count(*)
FROM transporte.rota_veiculo rv
WHERE rv.id_rota = r.id_rota
AND rv.ativo) AS quantidade_rota, rod.id_rota_discente, rod.id_discente
FROM transporte.rota_veiculo rv
JOIN transporte.rota r ON
rv.id_rota = r.id_rota
JOIN transporte.rota_detalhe rd ON
r.id_rota = rd.id_rota
LEFT JOIN transporte.rota_discente rod ON
r.id_rota = rod.id_rota
JOIN ensino.turno t ON
r.id_turno = t.id_turno
LEFT JOIN escola.escola e ON
rd.id_escola = e.id_escola
LEFT JOIN escola.bairro_escola be ON
be.id_bairro_escola = e.id_bairro_escola
LEFT JOIN transporte.veiculo v ON
rv.id_veiculo = v.id_veiculo
LEFT JOIN transporte.rota_motorista rm ON
rv.id_rota_motorista = rm.id_rota_motorista
JOIN comum.municipio mu ON
mu.id_municipio = r.id_municipio
LEFT JOIN transporte.comunidade c ON
rd.id_comunidade = c.id_comunidade
LEFT JOIN transporte.motorista m ON
rm.id_motorista = m.id_motorista
LEFT JOIN transporte.localidade l ON
l.id_localidade = rd.id_localidade
LEFT JOIN transporte.embarcacao emb ON
emb.id_embarcacao = rv.id_embarcacao
LEFT JOIN transporte.rota_marinheiro rma ON
rma.id_rota_marinheiro = rv.id_rota_marinheiro
LEFT JOIN transporte.marinheiro ma ON
ma.id_marinheiro = rma.id_marinheiro
WHERE rv.ativo = TRUE
ORDER BY r.id_rota, rv.id_rota_veiculo, rd.ordem, rod.id_rota_discente;



SELECT * FROM transporte.veiculo v ;