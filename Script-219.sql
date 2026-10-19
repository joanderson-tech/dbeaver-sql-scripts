begin;
rollback;
INSERT INTO comum.papel
(id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo)
VALUES(7024, 2, 3, 'RH ESCOLA - RELATORIOS', false, true, 'RH ESCOLA - RELATORIOS', 1, NULL, NULL, true);