

SELECT distinct  pae.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON ts.id_turma_serie = t.id_turma_serie 
JOIN ava.plano_anual_ensino pae ON pae.id_turma = t.id_turma 
WHERE  ts.ativo 
AND ts.ano = 2026;



select p.nome,
        u.login, t.codigo  
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma = 683794;
    AND t.id_disciplina = 220;


