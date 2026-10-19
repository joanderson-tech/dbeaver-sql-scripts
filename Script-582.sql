alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;
alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;
alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;
alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;
alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;
ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;

