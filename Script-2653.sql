SELECT *
FROM diario.campo_configuracao_conteudo_ministrado ;
-- Adiciona a coluna destino_persistencia na tabela especificada caso ela não exista
ALTER TABLE diario.campo_configuracao_conteudo_ministrado ADD COLUMN IF NOT EXISTS destino_persistencia VARCHAR(30) NULL;




[
    {
        "script":[
            "ALTER TABLE diario.campo_configuracao_conteudo_ministrado ADD COLUMN IF NOT EXISTS destino_persistencia VARCHAR(30) NULL;"
        ],
        "database":"sigeduc"
    }
]