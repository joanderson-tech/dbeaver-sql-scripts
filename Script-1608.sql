select  dt.*
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and u.login  = 'thamiresmtns@hotmail.com'
    AND t.id_turma IN (748862) ;



SELECT dt.* FROM ensino.turma t
 join ensino.docente_turma dt on dt.id_turma = t.id_turma 
 JOIN basico.turma_serie ts ON t.id_turma_serie = ts.id_turma_serie 
 JOIN escola.escola e ON e.id_escola = ts.id_escola 
 WHERE t.id_turma = 748862;

-- professor THALIS COELHO DE SANTANA
UPDATE ensino.docente_turma	SET finalizada=true	WHERE id_docente_turma IN (76820856,76820847,76820858,76820861,76820863);
--professora MARIA THAMIRES NOBREGA DA SILVA
UPDATE ensino.docente_turma	SET finalizada=true	WHERE id_docente_turma IN (81117330);

--Backup
-- professor THALIS COELHO DE SANTANA
UPDATE ensino.docente_turma	SET finalizada=false	WHERE id_docente_turma IN (76820856,76820847,76820858,76820861,76820863);
--professora MARIA THAMIRES NOBREGA DA SILVA
UPDATE ensino.docente_turma	SET finalizada=false	WHERE id_docente_turma IN (81117330);




SELECT p.nome, u.login
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE p.nome = 'THALIS COELHO DE SANTANA';