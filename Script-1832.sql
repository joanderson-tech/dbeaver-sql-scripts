SELECT t.id_turma, ts.nome, cc.nome, p.nome, s.siape, dt.ch_dedicada_periodo, dt.data_inicio, dt.data_fim, dt.id_docente_turma, t.codigo, tr.descricao, t.agrupadora, t.grupo, s.digito_siape, s.id_servidor, t.id_turma_agrupadora, t.id_disciplina, ser.tipo_diario, ser.id_etapa_ensino, t.periodo, t.id_modulo, mod.denominacao, t.id_situacao_turma, t.descricao_horario, dt.suplementar, p.id_pessoa, de.id_docente_externo, de.id_pessoa, pde.nome, pde.cpf_cnpj
FROM basico.turma_serie ts
JOIN ensino.turma t	USING (id_turma_serie)
JOIN basico.serie ser	USING (id_serie)
JOIN ensino.componente_curricular cc ON( cc.id_componente_curricular = t.id_disciplina )
JOIN ensino.turno tr ON( tr.id_turno = ts.id_turno )
JOIN ensino.docente_turma dt ON( t.id_turma = dt.id_turma
	AND dt.ativo = trueValue()
	AND dt.data_fim >= current_date + INTERVAL '0 seconds'
	AND dt.finalizada = falseValue()
	/*AND auxiliar = trueValue()*/ )
JOIN rh.servidor s ON ( dt.id_docente = s.id_servidor )
JOIN comum.pessoa p	USING (id_pessoa)
LEFT JOIN ensino.docente_externo de ON ( dt.id_docente_externo = de.id_docente_externo )
LEFT JOIN comum.pessoa pde ON ( pde.id_pessoa = de.id_pessoa )
LEFT JOIN basico.modulo MOD ON t.id_modulo = mod.id_modulo
WHERE ts.id_turma_serie = 52554389
AND t.id_situacao_turma <> 4
ORDER BY t.grupo, t.id_modulo,(id_turma_agrupadora IS NULL) DESC, t.ordem ASC, cc.nome ASC, dt.id_docente_turma ASC;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 52554389;

SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente_turma = 52558005;



