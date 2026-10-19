BEGIN;

UPDATE discente d SET id_pessoa = 767212 WHERE d.id_discente = 994068;
UPDATE comum.alteracao_pessoa ap SET id_pessoa = 767212 WHERE ap.id_alteracao_pessoa = 545233169;
UPDATE educacenso.educacenso_pessoa eep SET id_pessoa = 767212 WHERE eep.id_educacenso_pessoa = 10329;
DELETE FROM comum.pessoa p WHERE p.id_pessoa = 767645;

COMMIT;