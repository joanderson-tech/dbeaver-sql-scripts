UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;

UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;


alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;


ALTER TABLE matricula.calendario_matricula ADD COLUMN inicio_renovacao_nee date, ADD COLUMN fim_renovacao_nee date, ADD COLUMN inicio_transf_nee date, ADD COLUMN fim_transf_nee date;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;

alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;


ALTER TABLE comum.pessoa ADD nome_social varchar(200) NULL; COMMENT ON COLUMN comum.pessoa.nome_social IS 'Nome Social';

alter table ensino.frequencia_aluno add column abonada_escola boolean NULL;

alter table ensino.abono_frequencia ALTER COLUMN justificativa DROP NOT NULL;

ALTER TABLE ensino.frequencia_aluno ALTER COLUMN atual TYPE int2 ;

alter table basico.motivo_baixa_frequencia add column nao_abona boolean null;


ALTER TABLE basico.serie
ADD COLUMN permite_participar_sol_cadastro_reserva bool NOT NULL DEFAULT FALSE;

ALTER TABLE matricula.calendario_matricula ADD data_inicio_transf_int_proprio_semestral timestamp NULL;
ALTER TABLE matricula.calendario_matricula ADD data_fim_transf_int_proprio_semestral timestamp NULL;
UPDATE matricula.calendario_matricula cm SET data_inicio_transf_int_proprio_semestral = cm.data_inicio_transf_int_proprio, data_fim_transf_int_proprio_semestral = cm.data_fim_transf_int_proprio;



