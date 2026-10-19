SELECT DISTINCT p.nome, u.login, dt.*
FROM comum.usuario u
JOIN comum.pessoa p ON p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor
JOIN ensino.turma t ON t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.ano = 2026
AND p.nome ILIKE '%alex%'
AND dt.id_docente = 524;



SELECT * FROM ensino.horario_turma ht WHERE ht.id_turma  IN (683975) AND ativo;