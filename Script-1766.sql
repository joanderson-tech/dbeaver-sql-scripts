BEGIN;

CREATE SEQUENCE IF NOT EXISTS ava.nomenclatura_campo_conteudo_ministrado_seq INCREMENT BY 1 START 1 CACHE 1 NO CYCLE;

CREATE TABLE IF NOT EXISTS ava.nomenclatura_campo_conteudo_ministrado( id_nomenclatura_campo_conteudo_ministrado int4 NOT NULL DEFAULT nextval('ava.nomenclatura_campo_conteudo_ministrado_seq'), tipo_campo int NOT NULL, descricao varchar NOT NULL, ativo boolean NOT NULL DEFAULT TRUE, data_cadastro timestamp NOT NULL DEFAULT now(), CONSTRAINT pk_nomenclatura_campo_conteudo_ministrado PRIMARY KEY (id_nomenclatura_campo_conteudo_ministrado) );

CREATE SEQUENCE IF NOT EXISTS ava.nomenclatura_campo_conteudo_ministrado_nivel_etapa_ensino_seq INCREMENT BY 1 START 1 CACHE 1 NO CYCLE;

CREATE TABLE IF NOT EXISTS ava.nomenclatura_campo_conteudo_ministrado_nivel_etapa_ensino( id_nomenclatura_campo_conteudo_ministrado_nivel_etapa_ensino int4 NOT NULL DEFAULT nextval('ava.nomenclatura_campo_conteudo_ministrado_nivel_etapa_ensino_seq'), id_nomenclatura_campo_conteudo_ministrado int4 NOT NULL, id_nivel_etapa_ensino int4 NOT NULL, CONSTRAINT pk_nomenclatura_campo_conteudo_ministrado_nivel_etapa_ensino PRIMARY KEY (id_nomenclatura_campo_conteudo_ministrado_nivel_etapa_ensino), CONSTRAINT fk_nomenclatura_campo_conteudo_ministrado FOREIGN KEY (id_nomenclatura_campo_conteudo_ministrado) REFERENCES ava.nomenclatura_campo_conteudo_ministrado(id_nomenclatura_campo_conteudo_ministrado), CONSTRAINT fk_nivel_etapa_ensino FOREIGN KEY (id_nivel_etapa_ensino) REFERENCES basico.nivel_etapa_ensino(id_nivel_etapa_ensino) );

COMMIT;
