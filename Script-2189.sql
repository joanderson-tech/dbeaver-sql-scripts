-- SOLUÇÃO-COMUM E ACADEMICO

BEGIN;

UPDATE comum.usuario 	SET id_pessoa=783855	WHERE id_usuario=111239;
UPDATE comum.pessoa 	SET cpf_cnpj=6626412485	WHERE id_pessoa=783855;
DELETE FROM comum.pessoa WHERE id_pessoa=781277;

COMMIT;