[
    {
        "script":[
            "INSERT INTO matricula.tipo_documento_matricula (id_tipo_documento_matricula, denominacao) VALUES(5, 'Termo de Ciência de Uso do Transporte Escolar');"
        ],
        "database":"sigeduc"
    }
]


INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES 'OBRIGATORIEDADE_TAMANHO_CALCADO_ESTUDANTES', 'Determina se é obrigatório o preenchimento do campo de tamanho do calçado dos estudantes.', 'TRUE', NULL, 2, 'estudantes.obrigatoriedade_tamanho_calcado_estudante', 0, 0, NULL, NULL, NULL, false);


[
    {
        "script":[
            "INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('OBRIGATORIEDADE_TAMANHO_CALCADO_ESTUDANTES','Determina se é obrigatório o preenchimento do campo de tamanho do calçado dos estudantes.', 'TRUE', NULL, 2, 'estudantes.obrigatoriedade_tamanho_calcado_estudante', 0, 0, NULL, NULL, NULL, false);"
        ],
        "database":"comumdb"
    }
]

INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('OBRIGATORIEDADE_TAMANHO_CALCADO_ESTUDANTES','Determina se é obrigatório o preenchimento do campo de tamanho do calçado dos estudantes.', 'TRUE', NULL, 2, 'estudantes.obrigatoriedade_tamanho_calcado_estudante', 0, 0, NULL, NULL, NULL, false);

SELECT * FROM matricula.tipo_documento_matricula WHERE id_tipo_documento_matricula = 5;

