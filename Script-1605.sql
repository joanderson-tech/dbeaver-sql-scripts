select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where t.id_turma =743460;
    
and 


select * from ensino.docente_turma dt 
where dt.id_docente_turma  = 77013807;

and dt.id_docente_turma = 743460


;



UPDATE ensino.docente_turma
	SET data_fim='2025-12-23 00:00:00.000 -0300'
	WHERE id_docente_turma=77013807;


UPDATE ensino.docente_turma
	SET data_fim='2026-01-09 00:00:00.000 -0300'
	WHERE id_docente_turma=73002628;