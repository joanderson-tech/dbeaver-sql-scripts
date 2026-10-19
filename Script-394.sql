alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;
alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;
alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;
alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;
alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;
ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;


ALTER TABLE matricula.calendario_matricula ADD inicio_consulta_solicitacao_reserva date NULL;
ALTER TABLE matricula.calendario_matricula ADD fim_consulta_solicitacao_reserva date NULL;


CREATE TABLE matricula.alteracao_estudante_inscrito (id_alteracao_estudante_inscrito int4 NOT NULL, id_estudante_inscrito int4 NOT NULL, comando int4 NOT NULL, data_cadastro timestamp NOT NULL, id_registro_cadastro int4 NOT NULL, CONSTRAINT alteracao_estudante_inscrito_pkey PRIMARY KEY (id_alteracao_estudante_inscrito));
CREATE INDEX idx_alteracao_estudante_inscrito ON matricula.alteracao_estudante_inscrito (id_estudante_inscrito);
ALTER TABLE matricula.alteracao_estudante_inscrito ADD CONSTRAINT fk_estudante_inscrito FOREIGN KEY (id_estudante_inscrito) REFERENCES matricula.estudante_inscrito(id_estudante_inscrito);
ALTER TABLE matricula.alteracao_estudante_inscrito ADD CONSTRAINT fk_registro_cadastro FOREIGN KEY (id_registro_cadastro) REFERENCES comum.registro_entrada(id_entrada);
CREATE SEQUENCE matricula.alteracao_estudante_inscrito_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE;
ALTER TABLE matricula.historico_convocacao_cadastro_reserva ADD COLUMN ativo bool NOT NULL DEFAULT FALSE;
UPDATE matricula.historico_convocacao_cadastro_reserva SET ativo = TRUE WHERE tipo_convocacao = 2;

