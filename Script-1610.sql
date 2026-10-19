select t.codigo, dt,*
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.nome = 'THALIS COELHO DE SANTANA'
    AND t.id_turma = 767274;



SELECT * FROM ensino.turma t
 join ensino.docente_turma dt on dt.id_turma = t.id_turma 
 JOIN basico.turma_serie ts ON t.id_turma_serie = ts.id_turma_serie 
 JOIN escola.escola e ON e.id_escola = ts.id_escola 
 WHERE t.id_turma = 767274;
