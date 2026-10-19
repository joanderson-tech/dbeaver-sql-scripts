-- SUBSISTEMA
INSERT INTO comum.subsistema (id, id_sistema, nome, link_entrada, nome_reduzido, ativo) VALUES (40, 2, 'BUSCA ATIVA', '/app/mvc/verMenuBuscaAtiva', 'BUSCA_ATIVA', true);
INSERT INTO comum.papel (id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo) VALUES(4001, 2, 40, 'Gestor do módulo Busca Ativa',  false, false,  'GESTOR BUSCA ATIVA', 1, NULL, NULL, true);
INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('HABILITAR_MODULO_BUSCA_ATIVA', 'Habilitar o módulo de Busca Ativa no menu principal',  'true', 40, 2, 'busca_ativa.habilitar_modulo', null, null, '', null, null, false);


[
    {
        "script":[
            "INSERT INTO comum.subsistema (id, id_sistema, nome, link_entrada, nome_reduzido, ativo) VALUES (40, 2, 'BUSCA ATIVA', '/app/mvc/verMenuBuscaAtiva', 'BUSCA_ATIVA', true);",
			"INSERT INTO comum.papel (id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo) VALUES(4001, 2, 40, 'Gestor do módulo Busca Ativa',  false, false,  'GESTOR BUSCA ATIVA', 1, NULL, NULL, true);",
			"INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('HABILITAR_MODULO_BUSCA_ATIVA', 'Habilitar o módulo de Busca Ativa no menu principal',  'true', 40, 2, 'busca_ativa.habilitar_modulo', null, null, '', null, null, false);"
        ],
        "database":"comum"
    }
]