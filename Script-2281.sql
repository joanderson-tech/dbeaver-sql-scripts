[
                "ERROR: duplicate key value violates unique constraint \"subsistema_pkey\"\n  Detail: Key (id)=(40) already exists.",
                "ERROR: duplicate key value violates unique constraint \"papel_pkey\"\n  Detail: Key (id)=(4001) already exists.",
                "ERROR: duplicate key value violates unique constraint \"codigo_unique\"\n  Detail: Key (codigo)=(busca_ativa.habilitar_modulo) already exists."
            ]
            
            
            
            INSERT INTO comum.subsistema (id, id_sistema, nome, link_entrada, nome_reduzido, ativo) VALUES (40, 2, 'BUSCA ATIVA', '/app/mvc/verMenuBuscaAtiva', 'BUSCA_ATIVA', true);
INSERT INTO comum.papel (id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo) VALUES(4001, 2, 40, 'Gestor do módulo Busca Ativa',  false, false,  'GESTOR BUSCA ATIVA', 1, NULL, NULL, true);
INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('HABILITAR_MODULO_BUSCA_ATIVA', 'Habilitar o módulo de Busca Ativa no menu principal',  'true', 40, 2, 'busca_ativa.habilitar_modulo', null, null, '', null, null, false);



SELECT * FROM comum.subsistema s WHERE s.id = 40;


SELECT * FROM comum.papel WHERE id = 4001;