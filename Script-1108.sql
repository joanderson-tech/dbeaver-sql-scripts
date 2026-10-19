select * from comum.parametro p where p.nome ilike 'EMITE_RELATORIOS_ACOMPANHAMENTO';


INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('EMITE_RELATORIOS_ACOMPANHAMENTO', 'Indica se o município emite os relatórios de acompanhamento de preenchimento de frequências e avaliações', 'true', NULL, 2, 'estudantes.emiteRelatoriosAcompanhamento', 0, 0, NULL, NULL, NULL, false);