-- banco academico

UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;
UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;

alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;

CREATE SEQUENCE matricula.cadastro_reserva_ordenacao_seq INCREMENT 1 START 1 MINVALUE 1 CACHE 1;
CREATE TABLE matricula.cadastro_reserva_criterio_ordenacao (
    id_criterio_ordenacao INT4 NOT NULL DEFAULT nextval('matricula.cadastro_reserva_ordenacao_seq'),
    ativo bool NOT NULL,
    valor varchar(30) NOT NULL,
    nome varchar(50) NOT NULL,
    ordem INT NOT NULL,
    CONSTRAINT pk_criterio_ordenacao PRIMARY KEY (id_criterio_ordenacao)
);
CREATE UNIQUE INDEX un_criterio_nome_ativo ON matricula.cadastro_reserva_criterio_ordenacao (nome)  WHERE ativo = TRUE;
CREATE TABLE matricula.cadastro_reserva_configurar_ordenacao (
    id_configuracao_criterio_ordenacao INT4 NOT NULL DEFAULT nextval('matricula.cadastro_reserva_ordenacao_seq'),
    id_calendario_matricula INT4 NOT NULL,
    id_registro_entrada INT4 NOT NULL,
    id_registro_atualizacao INT4,
    ativo bool NOT NULL,
    CONSTRAINT pk_configuracao_ordenacao PRIMARY KEY (id_configuracao_criterio_ordenacao),
    CONSTRAINT fk_config_registro_entrada FOREIGN KEY (id_registro_entrada)  REFERENCES comum.registro_entrada (id_entrada),
    CONSTRAINT fk_config_registro_atualizacao FOREIGN KEY (id_registro_atualizacao) REFERENCES comum.registro_entrada (id_entrada),
    CONSTRAINT fk_config_calendario FOREIGN KEY (id_calendario_matricula) REFERENCES matricula.calendario_matricula (id_calendario_matricula)
);
CREATE UNIQUE INDEX un_config_calendario_ativo ON matricula.cadastro_reserva_configurar_ordenacao (id_calendario_matricula)  WHERE ativo = TRUE;
CREATE TABLE matricula.configuracao_criterio (
    id_configuracao_criterio INT4 NOT NULL DEFAULT nextval('matricula.cadastro_reserva_ordenacao_seq'),
    id_configuracao_ordenacao INT4 NOT NULL,
    id_criterio_ordenacao INT4 NOT NULL,
    prioridade int NOT NULL,
    CONSTRAINT pk_configuracao_criterio PRIMARY KEY (id_configuracao_criterio),
    CONSTRAINT fk_confc_config_ord FOREIGN KEY (id_configuracao_ordenacao) REFERENCES matricula.cadastro_reserva_configurar_ordenacao (id_configuracao_criterio_ordenacao),
    CONSTRAINT fk_confc_criterio_ord FOREIGN KEY (id_criterio_ordenacao) REFERENCES matricula.cadastro_reserva_criterio_ordenacao (id_criterio_ordenacao),
    CONSTRAINT un_confc_config_criterio UNIQUE (id_configuracao_ordenacao, id_criterio_ordenacao)
);
