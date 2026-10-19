SELECT u.nome AS dired, m.nome, e.nome AS escola, t.descricao AS turno, v.placa, r.descricao AS nome_rota, 
		p.nome AS discente, d.matricula, p.cpf_cnpj AS cpf, t.id_turno, rdi.data_cadastro, pe.nome as responsavel_cadastro 
		FROM transporte.rota r 
		JOIN transporte.rota_detalhe rd USING (id_rota) 
		JOIN transporte.rota_discente rdi USING (id_rota) 
		JOIN transporte.rota_veiculo rv USING (id_rota) 
		JOIN discente d USING (id_discente) 
		JOIN comum.pessoa p USING (id_pessoa) 
		LEFT JOIN transporte.veiculo v USING (id_veiculo) 
		JOIN ensino.turno t USING (id_turno) 
		JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
		AND mes.id_situacao_matricula_serie = 1
		JOIN escola.escola e ON e.id_escola = rd.id_escola 
		JOIN comum.unidade u ON u.id_unidade = e.id_regional_ensino 
		JOIN comum.municipio m ON m.id_municipio = COALESCE(e.id_municipio, u.id_municipio) 
		LEFT JOIN comum.registro_entrada re ON re.id_entrada = rdi.id_registro_cadastro 
		LEFT JOIN comum.usuario us ON us.id_usuario = re.id_usuario 
		LEFT JOIN comum.pessoa pe ON pe.id_pessoa = us.id_pessoa 
		WHERE r.ativo = trueValue()
	AND (rdi.data_fim IS NULL
		OR DATE(rdi.data_fim) >= DATE(NOW()))
		AND rv.ativo = trueValue()
		AND rdi.ativo
		AND rdi.id_discente IN (1020422, 1020423, 1020160, 1021158, 1020031) 
		AND u.ativo
		AND r.id_rota = 53066605
	ORDER BY d.id_discente, r.id_rota, rv.id_veiculo, rdi.id_rota_discente 
	;




SELECT dt.*
FROM ensino.turma t
JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma 
WHERE dt.suplementar = TRUE;