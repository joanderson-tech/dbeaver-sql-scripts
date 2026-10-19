begin;

UPDATE rh.servidor	SET id_pessoa=748403	WHERE id_servidor=850;
UPDATE comum.alteracao_pessoa	SET id_pessoa=748403	WHERE id_alteracao_pessoa=528038111;
UPDATE educacenso.educacenso_pessoa	SET id_pessoa=748403	WHERE id_educacenso_pessoa=6698;
DELETE FROM comum.pessoa WHERE id_pessoa=748402;

commit;
