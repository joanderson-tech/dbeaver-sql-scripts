-- banco academico
UPDATE comum.pessoa
SET
email = 'desenv@esig.com.br'
WHERE email IS NOT NULL
AND length(email) > 0;

UPDATE comum.usuario
SET
email = 'desenv@esig.com.br', ramal = 1234;

UPDATE escola.escola
SET
senhatransferencia = '123456'
WHERE senhatransferencia IS NOT NULL;

ALTER TABLE ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

ALTER TABLE ensino.registro_falta_professor ADD COLUMN abonada boolean DEFAULT FALSE;

ALTER TABLE ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

ALTER TABLE ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

ALTER TABLE ensino.registro_falta_professor ADD COLUMN id_arquivo int DEFAULT NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT TRUE;



