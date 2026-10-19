INSERT INTO comum.papel
(id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo)
VALUES(7024, 2, 35, 'RECURSOS HUMANOS RELATORIOS - ESCOLA', false, false, 'RECURSOS HUMANOS RELATORIOS - ESCOLA', 1, NULL, NULL, true);


DELETE FROM comum.papel
WHERE id=7024;

select * from comum.papel p where p.id = 7024;