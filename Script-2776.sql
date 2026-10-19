BEGIN;

CREATE TABLE IF NOT EXISTS educacao_especial.questionario_anamnese (id_questionario_anamnese integer PRIMARY KEY, titulo varchar(255) NOT NULL, ano_letivo integer NOT NULL, ativo boolean NOT NULL DEFAULT TRUE);

CREATE UNIQUE INDEX IF NOT EXISTS uk_questionario_anamnese_ativo_ano ON
educacao_especial.questionario_anamnese (ano_letivo)
WHERE ativo = TRUE;

CREATE TABLE IF NOT EXISTS educacao_especial.bloco_questionario_anamnese (id_bloco_questionario_anamnese integer PRIMARY KEY, id_questionario_anamnese integer NOT NULL REFERENCES educacao_especial.questionario_anamnese, titulo varchar(255) NOT NULL, ordem integer NOT NULL, ativo boolean NOT NULL DEFAULT TRUE);

CREATE TABLE IF NOT EXISTS educacao_especial.pergunta_anamnese (id_pergunta_anamnese integer PRIMARY KEY, id_bloco_questionario_anamnese integer NOT NULL REFERENCES educacao_especial.bloco_questionario_anamnese, descricao varchar(2000) NOT NULL, explicacao varchar(2000), ordem integer NOT NULL, tipo char(1) NOT NULL, obrigatorio boolean NOT NULL DEFAULT FALSE, ativo boolean NOT NULL DEFAULT TRUE);

CREATE TABLE IF NOT EXISTS educacao_especial.alternativa_anamnese (id_alternativa_anamnese integer PRIMARY KEY, id_pergunta_anamnese integer NOT NULL REFERENCES educacao_especial.pergunta_anamnese, descricao varchar(2000) NOT NULL, ordem integer NOT NULL, outro boolean NOT NULL DEFAULT FALSE, ativo boolean NOT NULL DEFAULT TRUE);

CREATE TABLE IF NOT EXISTS educacao_especial.questionario_anamnese_versao ( id_questionario_anamnese_versao integer PRIMARY KEY, id_questionario_anamnese integer NOT NULL REFERENCES educacao_especial.questionario_anamnese(id_questionario_anamnese), numero integer NOT NULL, data_criacao timestamp WITHOUT time ZONE NOT NULL, estrutura text NOT NULL, CONSTRAINT uq_questionario_anamnese_versao_numero UNIQUE (id_questionario_anamnese, numero) );

CREATE TABLE IF NOT EXISTS educacao_especial.anamnese_escolar (id_anamnese_escolar integer PRIMARY KEY, id_atendimento_educacao_especial_estudante integer NOT NULL REFERENCES educacao_especial.atendimento_educacao_especial_estudante, id_questionario_anamnese integer REFERENCES educacao_especial.questionario_anamnese, id_questionario_anamnese_versao integer NOT NULL REFERENCES educacao_especial.questionario_anamnese_versao, status char(1) NOT NULL DEFAULT 'E' CHECK (status IN ('E', 'C')), data_cadastro timestamp NOT NULL, data_atualizacao timestamp NOT NULL, data_conclusao timestamp, id_usuario_cadastro integer NOT NULL REFERENCES comum.usuario, id_usuario_atualizacao integer REFERENCES comum.usuario, ativo boolean NOT NULL DEFAULT TRUE, CONSTRAINT uk_anamnese_estudante_questionario UNIQUE (id_atendimento_educacao_especial_estudante, id_questionario_anamnese), CONSTRAINT uq_anamnese_atendimento_versao UNIQUE (id_atendimento_educacao_especial_estudante, id_questionario_anamnese_versao) );

CREATE TABLE IF NOT EXISTS educacao_especial.resposta_anamnese (id_resposta_anamnese integer PRIMARY KEY, id_anamnese_escolar integer NOT NULL REFERENCES educacao_especial.anamnese_escolar ON
DELETE CASCADE, id_pergunta_anamnese integer NOT NULL REFERENCES educacao_especial.pergunta_anamnese, id_alternativa_anamnese integer REFERENCES educacao_especial.alternativa_anamnese, complemento varchar(255), resposta_descritiva text);

COMMIT;