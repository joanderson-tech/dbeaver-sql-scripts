select p.nome,
        u.login, dt 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo 
    and u.login = 'davidfigueredo13@yahoo.com'
    AND t.ano = 2026;

SELECT *
FROM ensino.docente_turma dt
WHERE dt.id_docente IN (75620);


UPDATE rh.servidor
    SET id_cargo=9 , id_categoria = 1
    WHERE id_servidor=75620;


-- Auto-generated SQL script #202610051518
UPDATE rh.servidor
    SET id_cargo=9 , id_categoria = 11
    WHERE id_servidor=75620;



SELECT c.* FROM rh.categoria AS c;


689521
689530
    
    
    SELECT * FROM rh.servidor s WHERE s.id_servidor = 734;
    
        SELECT * FROM rh.servidor s WHERE s.id_servidor = 75620;
        
        SELECT * FROM comum.usuario u WHERE u.id_usuario  IN (105240); 