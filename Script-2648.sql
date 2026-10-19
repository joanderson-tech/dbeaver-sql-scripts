SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN (51870363, 746723);

BEGIN;


UPDATE comum.usuario SET id_pessoa=51870363 WHERE id_usuario=104929;

UPDATE comum.pessoa
    SET id_pessoa=51870363
    WHERE id_pessoa=746723;


ROLLBACK;


SELECT * FROM rh.servidor s WHERE s.id_pessoa IN (51870363, 746723);

SELECT * FROM comum.usuario u WHERE u.id_pessoa IN (51870363, 746723);