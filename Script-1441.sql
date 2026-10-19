select p.nome, u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    where  p.nome ilike '%ALANE CRISTINA DE ARAUJO%';

    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.nome ilike '%INAH DE MEDEIROS DANTAS%';

distinct