SELECT p.id_pessoa, p.nome, u.login
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
WHERE p.nome = 'AILA VALENTINA SANTOS LIMA';

SELECT mes.* FROM discente d 
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
WHERE d.id_pessoa = 52775996;


SELECT * FROM matricula.solicitacao_transferencia st WHERE st.id_matricula_discente_serie= 1541421 ;
