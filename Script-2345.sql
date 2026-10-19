--
-- rodar essa parte no banco academico
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;
UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;

--
ALTER TABLE comum.informacoes_medicas ADD COLUMN em_acompanhamento_psicologico BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE comum.informacoes_medicas ADD COLUMN observacao_acompanhamento_psicologico varchar(1000);
ALTER TABLE comum.informacoes_medicas ADD COLUMN em_investigacao_psicossocial BOOLEAN NOT NULL DEFAULT FALSE;

---
INSERT INTO comum.tipo_etnia(id_tipo_etnia, descricao ) VALUES 
	(1, 'Quilombola'),
	(2, 'Cigano'),
	(3, 'Povos Ribeirinhos'),
	(4, 'Povos Caiçaras'),
	(5, 'Povos Extrativistas'),
	(6, 'Comunidades Tradicionais do Campo'),
	(7, 'Comunidades Tradicionais da Floresta'),
	(8, 'Pescadores Artesanais'),
	(9, 'Quebradeiras de Coco Babaçu'),
	(10, 'Faxinalenses'),
	(11, 'Fundos e Fechos de Pasto');


CREATE TABLE comum.tipo_etnia_pessoa (
    id_tipo_etnia INTEGER NOT NULL REFERENCES comum.tipo_etnia (id_tipo_etnia),
    id_pessoa INTEGER NOT NULL REFERENCES comum.pessoa (id_pessoa),
    PRIMARY key (id_tipo_etnia, id_pessoa) 
);

COMMENT ON TABLE comum.tipo_etnia_pessoa IS 'Tabela responsável por relacionar comum.pessoa à comum.tipo_etnia';

CREATE SEQUENCE comum.seq_tipo_etnia_pessoa START WITH 1 INCREMENT BY 1;

CREATE INDEX idx_tipo_etnia_pessoa_etnia ON comum.tipo_etnia_pessoa (id_tipo_etnia);

CREATE INDEX idx_tipo_etnia_pessoa_pessoa ON comum.tipo_etnia_pessoa (id_pessoa);

INSERT INTO comum.tipo_etnia_pessoa(id_tipo_etnia, id_pessoa) SELECT 1, id_pessoa FROM comum.pessoa p WHERE p.quilombola;

ALTER TABLE comum.alteracao_pessoa ALTER COLUMN id_tipo_etnia TYPE varchar(100) USING NULL;

--
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


--
ALTER TABLE basico.serie ADD COLUMN qtd_assistente_educacional integer NOT NULL DEFAULT 0;

--

ALTER TABLE diario.limite_lancamento_notas ADD COLUMN IF NOT EXISTS bloquear_dias_futuros boolean DEFAULT false;
