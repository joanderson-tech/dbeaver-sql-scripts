WITH usuarios_responsaveis AS ( SELECT DISTINCT uf.id_usuario, e.id_unidade_escola
FROM basico.usuario_familiar uf
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = uf.id_discente_medio
JOIN escola.escola_etapa_ensino_serie es ON
mes.id_serie_escola = es.id_escola_etapa_ensino_serie
JOIN escola.escola e ON
e.id_escola = es.id_escola
WHERE uf.ativo ), usuarios_alunos AS ( SELECT DISTINCT u.id_usuario, ea.id_unidade_escola, d.matricula
FROM discente d
JOIN comum.usuario u ON
u.id_pessoa = d.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN escola.escola_etapa_ensino_serie es ON
mes.id_serie_escola = es.id_escola_etapa_ensino_serie
JOIN escola.escola ea ON
ea.id_escola = es.id_escola
WHERE d.status = 1 ), usuarios_docentes AS( SELECT u.id_usuario, COALESCE(e.id_unidade_escola, s.id_unidade) AS id_unidade, cargo.denominacao, s.id_categoria, s.siape FROM rh.servidor s JOIN comum.usuario u ON u.id_pessoa = s.id_pessoa JOIN rh.cargo cargo USING (id_cargo) LEFT JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor AND dt.ativo AND NOT dt.finalizada AND now() BETWEEN dt.data_inicio AND dt.data_fim LEFT JOIN ensino.turma t ON t.id_turma = dt.id_turma AND t.id_situacao_turma <> 4 LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie LEFT JOIN escola.escola e ON e.id_escola = ts.id_escola ) SELECT DISTINCT u.id_usuario AS idUsuario, u.login, u.email, u.inativo, p.nome AS nomeUsuario, us.siape, ua.matricula, und.id_unidade AS idUnidade, und.nome AS nomeUnidade, COALESCE(e.nome, und.nome) AS nomeEscola, us.denominacao AS cargo, COALESCE(p.nome_responsavel_matricula, 'Não informado') AS nomeResponsavel, pessoa_responsavel.nome AS responsavel_por
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
LEFT JOIN usuarios_alunos ua ON
ua.id_usuario = u.id_usuario
LEFT JOIN usuarios_responsaveis ur ON
ur.id_usuario = u.id_usuario
LEFT JOIN usuarios_docentes us ON
us.id_usuario = u.id_usuario
LEFT JOIN comum.unidade und ON
und.id_unidade IN (ua.id_unidade_escola, ur.id_unidade_escola, us.id_unidade)
LEFT JOIN escola.escola e ON
e.id_unidade_escola = und.id_unidade
LEFT JOIN basico.usuario_familiar uf ON
u.id_usuario = uf.id_usuario
LEFT JOIN discente discente_responsavel ON
discente_responsavel.id_discente = uf.id_discente_medio
LEFT JOIN comum.pessoa pessoa_responsavel ON
discente_responsavel.id_pessoa = pessoa_responsavel.id_pessoa
WHERE 1 = 1
AND und.id_unidade = 1932
AND ua IS NOT NULL
ORDER BY nomeEscola ASC, p.nome ASC, us.denominacao ASC ;

SELECT pe.id, pe.id_papel, pe.id_usuario, p.descricao, p.nome, und.nome AS nome_unidade
FROM comum.permissao pe
JOIN comum.papel p ON
p.id = pe.id_papel
JOIN comum.usuario u ON
u.id_usuario = pe.id_usuario
LEFT JOIN comum.unidade und ON
und.id_unidade = pe.id_unidade_papel
WHERE pe.autorizada
AND pe.id_usuario IN ( )
AND (pe.data_expiracao IS NULL
	OR pe.data_expiracao > CURRENT_DATE )
ORDER BY pe.id_usuario;