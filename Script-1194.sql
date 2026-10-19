select p.nome, t.id_turma,
        u.login, dt.* 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo -- and p.nome = 'GLORIA CAMARA DE MATOS'
    and t.id_turma_serie = 55525085;

select * from ensino.docente_turma where  id_turma= 735538; 735538


-- Auto-generated SQL script #202509231205
UPDATE ensino.docente_turma SET finalizada=true WHERE id_docente_turma in (55525226, 55997863);


UPDATE ensino.docente_turma SET finalizada=FALSE WHERE id_docente_turma in (55525226, 55997863);

UPDATE ensino.docente_turma
	SET finalizada=true
	WHERE id_docente_turma=55997863;


