BEGIN;


DELETE FROM basico.matricula_estudante_serie WHERE id_matricula_discente_serie=1587287;
UPDATE matricula.estudante_inscrito SET id_estudante=null, id_status=4 WHERE id_estudante_inscrito=72210077;
UPDATE matricula.estudante_inscrito_processamento SET id_status=12 WHERE id_estudante_inscrito_processamento=72210082;

ROLLBACK;