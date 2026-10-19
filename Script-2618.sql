select p.nome,
        u.login, t.codigo, e.nome , ts.tipo_diario
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    JOIN basico.turma_serie ts ON TS.id_turma_serie = t.id_turma_serie 
    JOIN escola.escola e ON e.id_escola = ts.id_escola 
    where dt.ativo and t.ano = 2026
    AND ts.tipo_diario IN (2, 38);