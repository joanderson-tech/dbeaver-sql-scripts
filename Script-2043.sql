BEGIN;
DELETE FROM rh.servidor s WHERE id_servidor IN (92);
DELETE FROM comum.alteracao_pessoa p WHERE id_alteracao_pessoa IN (518963040,519224490,519224810,519224811);
DELETE FROM educacenso.educacenso_pessoa WHERE id_educacenso_pessoa IN (54);
DELETE FROM comum.pessoa p WHERE id_pessoa IN (51880754);
COMMIT;