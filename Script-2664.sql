BEGIN;

UPDATE comum.usuario SET id_pessoa = 748579 WHERE id_usuario = 105055;


DELETE FROM comum.pessoa WHERE id_pessoa = 748580;


COMMIT;