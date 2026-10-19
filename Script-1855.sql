BEGIN;

--SOLUÇÃO
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51894944;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51894946;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51894955;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51894957;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51894968;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51894970;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51896294;
UPDATE ensino.docente_turma
	SET id_docente=533
	WHERE id_docente_turma=51896460;

DELETE FROM rh.servidor
WHERE id_servidor=531;

DELETE FROM comum.pessoa
WHERE id_pessoa=51889163;

COMMIT;