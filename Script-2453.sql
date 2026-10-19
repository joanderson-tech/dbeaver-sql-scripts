SELECT mes.*
FROM basico.matricula_estudante_serie mes
--JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE mes.id_estudante IN (1020422, 1020423, 1020160, 1021158, 1020031)
AND mes.ano_calendario = 2025;

SELECT DISTINCT rdi.*
FROM transporte.rota r
JOIN transporte.rota_detalhe rd
	USING (id_rota)
JOIN transporte.rota_discente rdi
	USING (id_rota)
WHERE r.ativo = trueValue()
AND rdi.id_discente IN (1020422, 1020423, 1020160, 1021158, 1020031)


select * FROM ( SELECT DISTINCT ON (d.id_discente, r.id_rota, rv.id_veiculo) u.nome AS dired, m.nome, e.nome AS escola, t.descricao AS turno, v.placa, r.descricao AS nome_rota, 
COUNT(DISTINCT d.id_discente) AS alunos, t.id_turno FROM transporte.rota r 
JOIN transporte.rota_detalhe rd USING (id_rota) 
JOIN transporte.rota_discente rdi USING (id_rota) 
JOIN transporte.rota_veiculo rv USING (id_rota) 
JOIN discente d USING (id_discente) 
JOIN comum.pessoa p USING (id_pessoa) 
LEFT JOIN transporte.veiculo v USING (id_veiculo) 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente AND mes.id_situacao_matricula_serie = 1 
JOIN ensino.turno t ON t.id_turno = mes.id_turno 
--JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie
JOIN escola.escola e ON e.id_escola = rd.id_escola --AND e.id_escola = ts.id_escola 
JOIN comum.unidade u ON u.id_unidade = e.id_regional_ensino
LEFT JOIN comum.municipio m ON m.id_municipio = p.id_municipio_contato 
WHERE rv.ativo = trueValue() 
AND (rdi.data_fim IS NULL OR DATE(rdi.data_fim) >= DATE(NOW())) AND r.ativo = trueValue() 
AND rdi.ativo AND r.id_rota = 53066605 
GROUP BY u.nome, m.nome, e.nome, t.descricao, v.placa, r.descricao, t.id_turno, rv.id_veiculo, r.id_rota, d.id_discente ) alunos_transportados 
ORDER BY dired, municipio, escola, id_turno, turno, placa, nome_rota, discente;