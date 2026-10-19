select * from comum.parametro p where p.codigo = '2_10100_47';


INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('CARGA_HORARIA_EDUCAOAO_FISICA_ENSFUND_ANOS_INICIAIS', 'Define a carga horária de educação física para os anos iniciais', '0', NULL, 2, '2_10100_47', 0, 4, NULL, 0.0, 0.0, false);



DELETE FROM comum.parametro WHERE codigo='2_10100_47';



[
    {
        "script":[
            "DELETE FROM comum.parametro WHERE codigo='2_10100_47';"
        ],
        "database":"comumdb"
    }
]



[
    {
        "script":[
            "INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('CARGA_HORARIA_EDUCAOAO_FISICA_ENSFUND_ANOS_INICIAIS', 'Define a carga horária de educação física para os anos iniciais', '0', NULL, 2, '2_10100_47', 0, 4, NULL, 0.0, 0.0, false);"
        ],
        "database":"comumdb"
    }
]