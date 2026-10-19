SELECT * FROM ( SELECT DISTINCT ON (d.id_discente, r.id_rota, rv.id_veiculo) u.nome AS dired, m.nome AS municipio, e.nome 
AS escola, t.descricao AS turno, v.placa, r.descricao AS nome_rota, p.nome AS discente, d.matricula, p.cpf_cnpj AS cpf, t.id_turno, rdi.data_cadastro, pe.nome as responsavel_cadastro 
FROM transporte.rota r JOIN transporte.rota_detalhe rd USING (id_rota)
JOIN transporte.rota_discente rdi USING (id_rota) 
JOIN transporte.rota_veiculo rv USING (id_rota) 
JOIN discente d USING (id_discente) 
JOIN comum.pessoa p USING (id_pessoa) 
LEFT JOIN transporte.veiculo v USING (id_veiculo) 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
AND mes.id_situacao_matricula_serie = 1 
left JOIN ensino.turno t ON t.id_turno = mes.id_turno --AND t.id_turno = r.id_turno 
--JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie 
JOIN escola.escola e ON e.id_escola = rd.id_escola 
JOIN comum.unidade u ON u.id_unidade = e.id_regional_ensino 
LEFT JOIN comum.municipio m ON m.id_municipio = p.id_municipio_contato 
LEFT JOIN comum.registro_entrada re ON re.id_entrada = rdi.id_registro_cadastro 
LEFT JOIN comum.usuario us ON us.id_usuario = re.id_usuario 
LEFT JOIN comum.pessoa pe ON pe.id_pessoa = us.id_pessoa 
WHERE r.ativo = trueValue() AND (rdi.data_fim IS NULL OR DATE(rdi.data_fim) >= DATE(NOW())) 
AND rv.ativo = trueValue() AND rdi.ativo AND r.id_rota = 53066605 
--AND rdi.id_discente IN (1020422, 1020423, 1020160, 1021158, 1020031)
ORDER BY d.id_discente, r.id_rota, rv.id_veiculo, rdi.id_rota_discente ) alunos_transportados 





with alunos_filtrados as ( select distinct on
(d.id_discente, r.id_rota, rv.id_veiculo) u.nome as dired, m.nome as municipio, e.nome as escola, t.descricao as turno, v.placa, r.descricao as nome_rota, d.id_discente, t.id_turno
from transporte.rota r
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
left join transporte.veiculo v
	using (id_veiculo)
join basico.matricula_estudante_serie mes on
mes.id_estudante = d.id_discente
	and mes.id_situacao_matricula_serie = 1
join ensino.turno t on
	t.id_turno = mes.id_turno
	and t.id_turno = r.id_turno
join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
join escola.escola e on
	e.id_escola = rd.id_escola
	and e.id_escola = ts.id_escola
join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
left join comum.municipio m on
	m.id_municipio = p.id_municipio_contato
where rv.ativo = trueValue()
	and (rdi.data_fim is null
		or DATE(rdi.data_fim) >= DATE(NOW()))
		and r.ativo = trueValue()
		and rdi.ativo
		and r.id_rota = 53066605
	order by d.id_discente, r.id_rota, rv.id_veiculo, rdi.id_rota_discente ) select dired, municipio, escola, turno, placa, nome_rota, COUNT(id_discente) as alunos, id_turno
from alunos_filtrados
group by dired, municipio, escola, turno, placa, nome_rota, id_turno
order by dired, municipio, escola, id_turno, turno, placa, nome_rota;


ORDER BY dired, municipio, escola, id_turno, turno, placa, nome_rota, discente;

SELECT * FROM ( SELECT DISTINCT ON (d.id_discente, r.id_rota, rv.id_veiculo) u.nome AS dired, m.nome AS municipio, e.nome AS escola, t.descricao AS turno, v.placa, r.descricao 
AS nome_rota, p.nome AS discente, d.matricula, p.cpf_cnpj AS cpf, t.id_turno, rdi.data_cadastro, pe.nome as responsavel_cadastro 
FROM transporte.rota r 
JOIN transporte.rota_detalhe rd USING (id_rota) 
JOIN transporte.rota_discente rdi USING (id_rota) 
JOIN transporte.rota_veiculo rv USING (id_rota) 
JOIN discente d USING (id_discente) 
JOIN comum.pessoa p USING (id_pessoa) 
LEFT JOIN transporte.veiculo v USING (id_veiculo) 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente AND mes.id_situacao_matricula_serie = 1 
JOIN ensino.turno t ON t.id_turno = mes.id_turno
JOIN escola.escola e ON e.id_escola = rd.id_escola 
JOIN comum.unidade u ON u.id_unidade = e.id_regional_ensino 
LEFT JOIN comum.municipio m ON m.id_municipio = p.id_municipio_contato 
LEFT JOIN comum.registro_entrada re ON re.id_entrada = rdi.id_registro_cadastro 
LEFT JOIN comum.usuario us ON us.id_usuario = re.id_usuario 
LEFT JOIN comum.pessoa pe ON pe.id_pessoa = us.id_pessoa 
WHERE r.ativo = trueValue() 
AND (rdi.data_fim IS NULL OR DATE(rdi.data_fim) >= DATE(NOW())) 
AND rv.ativo = trueValue() 
AND rdi.ativo 
AND r.id_rota = 53066605 
--AND rdi.id_discente IN (1020422, 1020423, 1020160, 1021158, 1020031)
ORDER BY d.id_discente, r.id_rota, rv.id_veiculo, rdi.id_rota_discente ) alunos_transportados 
ORDER BY dired, municipio, escola, id_turno, turno, placa, nome_rota, discente;



select *  from transporte.rota_discente rdi	
WHERE  rdi.id_discente IN (1020422, 1020423, 1020160, 1021158, 1020031);