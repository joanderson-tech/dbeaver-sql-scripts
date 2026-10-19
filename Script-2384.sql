
-- rodar essa parte no banco academico
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;
UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;, INSERT INTO comum.tipo_etnia(id_tipo_etnia, descricao ) VALUES 
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

CREATE TABLE ensino.assistente_educacional_turma (
            id_assistente_educacional_turma integer NOT NULL, 
            id_turma_serie integer NOT NULL,
            id_turma integer NOT NULL,
            id_servidor integer NOT NULL, 
            ch_dedicada_periodo integer NOT NULL, 
            data_inicio date NOT NULL, 
            data_fim date NOT NULL, 
            ativo boolean NOT NULL DEFAULT TRUE,
            finalizada boolean NOT NULL DEFAULT FALSE,
            id_registro_cadastro integer, 
            data_cadastro timestamp WITHOUT time ZONE, 
            id_registro_atualizacao integer, 
            data_alteracao timestamp WITHOUT time ZONE, 
            ordem integer NOT NULL, 
            CONSTRAINT pk_assistente_educacional_turma PRIMARY KEY (id_assistente_educacional_turma), 
            CONSTRAINT fk_assistente_educacional_turma_turma_serie FOREIGN KEY (id_turma_serie) REFERENCES basico.turma_serie (id_turma_serie), 
            CONSTRAINT fk_assistente_educacional_turma_turma FOREIGN KEY (id_turma) REFERENCES ensino.turma (id_turma), 
            CONSTRAINT fk_assistente_educacional_turma_servidor FOREIGN KEY (id_servidor) REFERENCES rh.servidor (id_servidor)
);
ALTER TABLE basico.serie ADD COLUMN qtd_assistente_educacional integer NOT NULL DEFAULT 0;
ALTER TABLE diario.limite_lancamento_notas ADD COLUMN IF NOT EXISTS bloquear_dias_futuros boolean DEFAULT false;
INSERT INTO escola.dependencia (id_dependencia, denominacao, seq_censo, ativo) SELECT nextval('hibernate_sequence'), 'LABORATÓRIO ESPECÍFICO PARA ROBÓTICA', 46, true WHERE NOT EXISTS (SELECT 1 FROM escola.dependencia WHERE seq_censo = 46);
ALTER TABLE escola.escola_dados_censo ADD COLUMN IF NOT EXISTS total_assistentes_sociais int4;