SELECT u.id_usuario, COALESCE(e.id_unidade_escola, s.id_unidade) AS id_unidade, cargo.denominacao, s.id_categoria, s.siape 
FROM rh.servidor s 
JOIN comum.usuario u ON u.id_pessoa = s.id_pessoa 
JOIN rh.cargo cargo USING (id_cargo) 
LEFT JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor AND dt.ativo AND NOT dt.finalizada AND now() BETWEEN dt.data_inicio AND dt.data_fim 
LEFT JOIN ensino.turma t ON t.id_turma = dt.id_turma AND t.id_situacao_turma <> 4 
LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
LEFT JOIN escola.escola e ON e.id_escola = ts.id_escola