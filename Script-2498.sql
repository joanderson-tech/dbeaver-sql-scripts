select p.nome,
        u.login, u.id_usuario 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and u.login ilike '%m.graca251%';


SELECT pa.* FROM ensino.turma t 
JOIN ava.plano_aula pa ON pa.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 51899264;

SELECT * FROM ava.plano_aula_categoria pac WHERE pac.id_plano_aula  = 232;


SELECT * FROM ava.registro_acao_ava WHERE  id_turma = 682012;