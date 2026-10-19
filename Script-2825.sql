begin;

UPDATE rh.servidor	SET id_pessoa=748403	WHERE id_servidor=850;


DELETE FROM comum.pessoa WHERE id_pessoa=748402;

COMMIT ;