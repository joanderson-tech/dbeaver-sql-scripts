BEGIN;

INSERT INTO comum.parametro
(nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)
VALUES('OBRIGATORIEDADE_TAMANHO_CALCADO_ESTUDANTES', 'Determina se é obrigatório o preenchimento do campo de tamanho do calçado dos estudantes.', 'TRUE', NULL, 2, 'estudantes.obrigatoriedade_tamanho_calcado_estudante', 0, 0, NULL, NULL, NULL, false);


COMMIT;


ROLLBACK;



update comum.parametro p set valor 'FALSE' where codigo = 'estudantes.obrigatoriedade_tamanho_calcado_estudante';