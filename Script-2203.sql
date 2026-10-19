UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;
UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;

alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;

ALTER TABLE basico.calendario_escolar ADD COLUMN IF NOT EXISTS regime_letivo char(1) DEFAULT 'B';

alter table basico.serie add column bloquear_edicao boolean default false;
update basico.serie set bloquear_edicao = true where id_serie in (19001542, 1005268, 1005259);

CREATE TABLE rh.tipo_falta (id_tipo_falta int4 NOT NULL, descricao varchar(255), servidor bool, professor bool, CONSTRAINT tipo_falta_pkey PRIMARY KEY (id_tipo_falta));
ALTER TABLE rh.tipo_falta OWNER TO sigeduc;
GRANT ALL ON TABLE rh.tipo_falta TO sigeduc;
CREATE SEQUENCE rh.tipo_falta_seq INCREMENT BY 1 START WITH 3 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER SEQUENCE rh.tipo_falta_seq OWNER TO sigeduc;
GRANT ALL ON SEQUENCE rh.tipo_falta_seq TO sigeduc;
INSERT INTO rh.tipo_falta (id_tipo_falta, descricao, servidor, professor) VALUES (1, 'Falta Abonada', TRUE, TRUE);
INSERT INTO rh.tipo_falta (id_tipo_falta, descricao, servidor, professor) VALUES (2, 'Falta Não Abonada', TRUE, TRUE);
INSERT INTO rh.tipo_falta (id_tipo_falta, descricao, servidor, professor) VALUES (3, 'Falta Aula/Atividade', FALSE, TRUE);
ALTER TABLE pessoas.falta_servidor ADD id_tipo_falta int4;
ALTER TABLE pessoas.falta_servidor ADD CONSTRAINT falta_servidor_id_tipo_falta_fkey FOREIGN KEY (id_tipo_falta) REFERENCES rh.tipo_falta(id_tipo_falta);
CREATE TABLE rh.status_falta (id_status_falta int4 NOT NULL, descricao varchar(255), CONSTRAINT status_falta_pkey PRIMARY KEY (id_status_falta));
ALTER TABLE rh.status_falta OWNER TO sigeduc;
GRANT ALL ON TABLE rh.status_falta TO sigeduc;
INSERT INTO rh.status_falta (id_status_falta, descricao) VALUES (1, 'Pendente');
INSERT INTO rh.status_falta (id_status_falta, descricao) VALUES (2, 'Aprovada');
INSERT INTO rh.status_falta (id_status_falta, descricao) VALUES (3, 'Recusada');
CREATE SEQUENCE rh.status_falta_seq INCREMENT BY 1 START WITH 3 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER SEQUENCE rh.status_falta_seq OWNER TO sigeduc;
GRANT ALL ON SEQUENCE rh.status_falta_seq TO sigeduc;
ALTER TABLE pessoas.falta_servidor ADD id_status_falta int4;
ALTER TABLE pessoas.falta_servidor ADD quantidade_dias int4;
ALTER TABLE pessoas.falta_servidor ADD CONSTRAINT falta_servidor_id_status_falta_fkey FOREIGN KEY (id_status_falta) REFERENCES rh.status_falta(id_status_falta);

