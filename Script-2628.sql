BEGIN;

UPDATE public.discente SET id_pessoa=51918396 WHERE id_discente=998343;
UPDATE basico.matricula_estudante_serie SET id_estudante=988061 WHERE id_matricula_discente_serie=1358879;
DELETE FROM comum.pessoa WHERE id_pessoa=749078;

COMMIT;