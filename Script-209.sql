select * from comum.papel p;
select * from comum.permissao p where p.id_papel = 7001;
select * from comum.papel p where p.id = 7024;

SELECT x.* FROM comum.subsistema x;
3

INSERT INTO comum.papel
(id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo)
VALUES(7024, 2, 3, 'RECURSOS HUMANOS RELATORIOS - ESCOLA', false, true, 'RECURSOS HUMANOS RELATORIOS - ESCOLA', 1, NULL, NULL, true);


DELETE FROM comum.papel
WHERE id=7024;


begin;
rollback;