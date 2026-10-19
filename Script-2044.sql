--SOLUÇÃO COMUM
BEGIN;
DELETE FROM rh.servidor s WHERE id_servidor IN (92);
DELETE FROM comum.pessoa p WHERE id_pessoa IN (51880754);
COMMIT;

