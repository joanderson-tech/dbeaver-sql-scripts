SELECT * FROM comum.pessoa p WHERE p.cpf_cnpj = '01748703536';


SELECT * FROM rh.servidor s WHERE s.id_pessoa = 749530;

SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 976;





UPDATE ensino.docente_turma	SET id_docente=921 	WHERE id_docente_turma IN (52090849,52113153);


UPDATE ensino.docente_turma	SET id_docente=976 	WHERE id_docente_turma IN (52090849,52113153);
