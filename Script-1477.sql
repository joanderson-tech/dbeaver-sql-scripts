BEGIN;

update comum.parametro p set valor = 'FALSE' where codigo = 'estudantes.obrigatoriedade_tamanho_calcado_estudante';

COMMIT;

rollback;
