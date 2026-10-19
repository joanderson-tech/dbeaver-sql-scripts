begin

INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('OCULTA_CPF_RESPONSAVEL_E_FILIACAO', 'Parâmetro que indica se a obrigatoriedade de CPF do responsável e do CPF da filiação 1', 'false', NULL, 2, 'oculta_cpf_responsavel_e_filiacao', NULL, 16, NULL, NULL, NULL, FALSE);



SELECT * FROM comum.parametro p WHERE p.nome = 'OCULTA_CPF_RESPONSAVEL_E_FILIACAO';



[
    {
        "script":[
            "INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('OCULTA_CPF_RESPONSAVEL_E_FILIACAO', 'Parâmetro que indica se a obrigatoriedade de CPF do responsável e do CPF da filiação 1', 'false', NULL, 2, 'oculta_cpf_responsavel_e_filiacao', NULL, 16, NULL, NULL, NULL, FALSE);"
        ],
        "database":"comumdb"
    }
]