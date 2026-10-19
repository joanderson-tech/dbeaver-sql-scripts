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

ALTER TABLE basico.calendario_escolar ADD COLUMN IF NOT EXISTS regime_letivo char(1) DEFAULT 'B';

ALTER TABLE basico.calendario_escolar ADD COLUMN IF NOT EXISTS regime_letivo char(1) DEFAULT 'B';
ALTER TABLE basico.calendario_escolar DROP CONSTRAINT IF EXISTS ck_regime_letivo;
ALTER TABLE basico.calendario_escolar ADD CONSTRAINT ck_regime_letivo CHECK(regime_letivo IN ('B', 'T'));
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS inicio_tri_1 DATE;
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS fim_tri_1 DATE;
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS inicio_tri_2 DATE;
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS fim_tri_2 DATE;
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS inicio_tri_3 DATE;
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS fim_tri_3 DATE;
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS regime_letivo char(1) DEFAULT 'B';
ALTER TABLE diario.extensao_calendario_escolar DROP CONSTRAINT IF EXISTS ck_regime_letivo;
ALTER TABLE diario.extensao_calendario_escolar ADD CONSTRAINT ck_regime_letivo CHECK(regime_letivo IN ('B', 'T'));
ALTER TABLE diario.extensao_calendario_escolar ADD COLUMN IF NOT EXISTS utiliza_regime_semestral BOOLEAN DEFAULT TRUE;
ALTER TABLE basico.calendario_escolar ADD COLUMN IF NOT EXISTS utiliza_regime_semestral BOOLEAN DEFAULT TRUE;
