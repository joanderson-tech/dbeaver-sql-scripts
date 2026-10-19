CREATE SEQUENCE pessoas.configuracao_tema_seq;
CREATE TABLE pessoas.configuracao_tema (
    id_configuracao_tema   INTEGER      PRIMARY KEY DEFAULT nextval('pessoas.configuracao_tema_seq'),
    id_instituicao         INTEGER      NOT NULL UNIQUE
                                        REFERENCES pessoas.instituicao (id_instituicao),
    cor_primaria           CHAR(7)      NOT NULL
                                        CHECK (cor_primaria ~ '^#[0-9A-Fa-f]{6}$'),
    cor_botao_primario     CHAR(7)
                                        CHECK (cor_botao_primario IS NULL OR cor_botao_primario ~ '^#[0-9A-Fa-f]{6}$'),
    data_atualizacao       TIMESTAMP    NOT NULL DEFAULT now(),
    id_usuario_atualizacao INTEGER      REFERENCES comum.usuario (id_usuario)
);
ALTER SEQUENCE pessoas.configuracao_tema_seq OWNED BY pessoas.configuracao_tema.id_configuracao_tema;
COMMENT ON TABLE  pessoas.configuracao_tema
        IS 'Cor predominante do tema visual definida pela prefeitura - vale para o município inteiro (todas as escolas e unidades).';
COMMENT ON COLUMN pessoas.configuracao_tema.id_instituicao
        IS 'FK para pessoas.instituicao da prefeitura (prefeitura=true); UNIQUE pois há no máximo uma config por banco operacional/município.';
COMMENT ON COLUMN pessoas.configuracao_tema.cor_primaria
        IS 'Hex no formato #RRGGBB; demais variáveis CSS são derivadas em runtime via HSL.';
COMMENT ON COLUMN pessoas.configuracao_tema.cor_botao_primario
        IS 'Hex no formato #RRGGBB para botões primários; quando nulo, usa cor_primaria.';
COMMENT ON COLUMN pessoas.configuracao_tema.id_usuario_atualizacao
        IS 'Usuário que realizou a última alteração da cor.';



ALTER TABLE diario.limite_lancamento_notas ADD COLUMN IF NOT EXISTS bloquear_dias_futuros boolean DEFAULT false;