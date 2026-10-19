BEGIN;

UPDATE comum.usuario
SET id_pessoa = 773173
WHERE id_usuario = 140287;

DELETE FROM comum.pessoa
WHERE id_pessoa = 812652;

COMMIT;