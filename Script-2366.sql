BEGIN;

DELETE FROM pessoas.vaga_administrativa WHERE id_vaga_administrativa=58;
DELETE FROM comum.pessoa WHERE id_pessoa in (51890271,51890272,51890250);
DELETE FROM rh.servidor WHERE id_servidor in (163,130,139);

COMMIT;