SELECT p.nome, u.login, t.id_turma, t.codigo, dt.id_docente_turma
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND p.nome = 'DENISE ALEXANDRE DA SILVA'
AND t.id_disciplina = 512;

SELECT *
FROM ensino.registro_falta_professor rfp
WHERE rfp.id_docente_turma IN (51896188, 52110813) ;


UPDATE ensino.registro_falta_professor
	SET ativo=false
	WHERE id_registro_falta_professor=12438;


SELECT *
FROM ensino.docente_turma dt
WHERE dt.id_docente_turma IN (51896188, 52110813) ;

SELECT *
FROM comum.usuario u
WHERE u.id_usuario = 104933;

UPDATE ensino.registro_falta_professor
SET
id_status_falta = 2, id_tipo_falta = 1
WHERE id_registro_falta_professor = 12438;

682706
-- Auto-generated SQL script #202605041058
UPDATE ensino.registro_falta_professor
SET
id_docente_turma = 51896188
WHERE id_registro_falta_professor = 12438;

SELECT DISTINCT rfs.*
FROM ensino.registro_falta_professor rfs
JOIN ensino.docente_turma dt ON
(dt.id_docente_turma = rfs.id_docente_turma)
WHERE dt.ativo IS TRUE
AND rfs.ativo IS TRUE
--AND dt.finalizada = FALSE
AND dt.id_turma IN (682706)


SELECT * FROM ensino.turma t WHERE t.id_situacao_turma = 3 AND ano = 2025;



SELECT p.nome, u.login
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
/*
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
*/
WHERE p.nome = 'MARIA DO SOCORRO DOS SANTOS LIMA';