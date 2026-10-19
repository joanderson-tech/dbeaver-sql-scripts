
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;

UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;



ALTER TABLE matricula.calendario_matricula ADD data_inicio_transf_int_proprio_semestral timestamp NULL;
ALTER TABLE matricula.calendario_matricula ADD data_fim_transf_int_proprio_semestral timestamp NULL;
UPDATE matricula.calendario_matricula cm SET data_inicio_transf_int_proprio_semestral = cm.data_inicio_transf_int_proprio, data_fim_transf_int_proprio_semestral = cm.data_fim_transf_int_proprio;


ALTER TABLE comum.pessoa ADD nome_social varchar(200) NULL;
COMMENT ON COLUMN comum.pessoa.nome_social IS 'Nome Social';
alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;
alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;
alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;
alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;
alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;
ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;


ALTER TABLE comum.subtipo_necessidade_especial ADD COLUMN ativo bool DEFAULT TRUE NOT NULL;

ALTER TABLE comum.subtipo_necessidade_especial ADD COLUMN ordem int4 NULL;

UPDATE comum.subtipo_necessidade_especial SET descricao = 'Necessidade Especial', ativo = FALSE, ordem = 1 WHERE id_subtipo_necessidade_especial = 1;
UPDATE comum.subtipo_necessidade_especial SET descricao = 'Altas Habilidades / Dotação', ordem = 6 WHERE id_subtipo_necessidade_especial = 2;

INSERT INTO comum.subtipo_necessidade_especial (id_subtipo_necessidade_especial, descricao, ordem) VALUES
(3, 'Auditiva', 2),
(4, 'Visual', 3),
(5, 'Motora', 4),
(6, 'Intelectual', 5),
(7, 'Dificuldade de Aprendizagem', 7);

ALTER TABLE comum.subtipo_necessidade_especial ALTER COLUMN ordem SET NOT NULL;

ALTER TABLE comum.tipo_necessidade_especial ADD COLUMN quantidade_vaga int4 NULL;

UPDATE comum.tipo_necessidade_especial
SET quantidade_vaga = CAST((SELECT pa.valor FROM comum.parametro_academico pa WHERE pa.codigo = '2_2_10') AS integer)
WHERE TRUE;

ALTER TABLE comum.tipo_necessidade_especial ALTER COLUMN quantidade_vaga SET NOT NULL;

DELETE FROM comum.parametro_academico pa WHERE pa.codigo = '2_2_10';

