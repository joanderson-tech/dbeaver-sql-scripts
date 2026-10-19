begin;

DELETE FROM learn.avaliacao;--precisa remover todos registros da tabela mesmo.
INSERT INTO learn.avaliacao (id_avaliacao, valor) values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
--rollback;
commit;