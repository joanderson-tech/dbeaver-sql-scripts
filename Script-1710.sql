INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('OBRIGA_CPF_RESPONSAVEL_E_FILIACAO', 'Parâmetro que indica se a obrigatoriedade de CPF do responsável e do CPF da filiação 1', 'true', NULL, 2, 'obriga_cpf_responsavel_e_filiacao', NULL, 16, NULL, NULL, NULL, FALSE);


BEGIN ;

DELETE FROM comum.parametro WHERE codigo = (SELECT codigo  FROM comum.parametro WHERE nome ILIKE '%OCULTA_CPF_RESPONSAVEL_E_FILIACAO%');

SELECT *  FROM comum.parametro WHERE nome ILIKE '%OBRIGA_CPF_RESPONSAVEL_E_FILIACAO%'

COMMIT;

ROLLBACK  ;


[
    {
        "script":[
            "INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao)VALUES('OBRIGA_CPF_RESPONSAVEL_E_FILIACAO', 'Indica obrigatoriedade de CPF para responsável e filiação 1 (True=Obrigatório, False=Opcional).', 'true', NULL, 2, 'obriga_cpf_responsavel_e_filiacao', NULL, 16, NULL, NULL, NULL, FALSE);"
        ],
        "database":"comumdb"
    }
]



SELECT * FROM schema_version;



