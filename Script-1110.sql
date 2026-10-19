UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;
UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;

alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;


alter table ensino.registro_falta_professor ADD COLUMN data_cadastro timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;

alter table ensino.registro_falta_professor ADD COLUMN data_abono timestamp NULL;

alter table ensino.registro_falta_professor ADD COLUMN justificativa_abono varchar;

alter table ensino.registro_falta_professor ADD COLUMN id_arquivo int default NULL;

ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;

EDUC-969 

ALTER TABLE basico.matricula_estudante_serie ADD bloquear_renovacao bool DEFAULT false NOT NULL;
ALTER TABLE basico.matricula_estudante_serie ALTER COLUMN bloquear_renovacao SET STORAGE PLAIN;

EDUC-1035

CREATE TABLE basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido int4 NOT NULL, descricao varchar(100) UNIQUE NULL, ordem int4 NULL, ativo bool NOT NULL, CONSTRAINT tamanho_fardamento_predefinido_pkey PRIMARY KEY (id_tamanho_fardamento_predefinido));
CREATE SEQUENCE basico.tamanho_fardamento_predefinido_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE;
ALTER TABLE comum.pessoa ADD COLUMN id_tamanho_camisa_predefinido int4 DEFAULT NULL;
ALTER TABLE comum.pessoa ADD CONSTRAINT fk_pessoa_tamanho_camisa_predefinido FOREIGN KEY (id_tamanho_camisa_predefinido) REFERENCES basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido);
ALTER TABLE comum.pessoa ADD COLUMN id_tamanho_short_calca_predefinido int4 DEFAULT NULL;
ALTER TABLE comum.pessoa ADD CONSTRAINT fk_pessoa_tamanho_short_calca_predefinido FOREIGN KEY (id_tamanho_short_calca_predefinido) REFERENCES basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (1, '0 (Infantil)', 1, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (2, '2 (Infantil)', 2, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (3, '4 (Infantil)', 3, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (4, '6 (Infantil)', 4, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (5, '8 (Infantil)', 5, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (6, '10 (Infantil)', 6, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (7, '12 (Infantil)', 7, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (8, '14 (Infantil)', 8, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (9, '16 (Infantil)', 9, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (10, 'P (Adulto)', 10, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (11, 'M (Adulto)', 11, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (12, 'G (Adulto)', 12, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (13, 'GG (Adulto)', 13, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (14, 'XG (Adulto)', 14, TRUE);
INSERT INTO basico.tamanho_fardamento_predefinido (id_tamanho_fardamento_predefinido, descricao, ordem, ativo) VALUES (15, 'XGG (Adulto)', 15, TRUE);

EDUC-961

CREATE TABLE comum.grau_parentesco (id_grau_parentesco int primary key, descricao varchar(100), ativo bool not null default true);

ALTER TABLE comum.pessoa add column id_grau_parentesco_responsavel_matricula integer null;

ALTER TABLE comum.pessoa ADD CONSTRAINT fk_id_grau_parentesco_responsavel_matricula FOREIGN KEY (id_grau_parentesco_responsavel_matricula) REFERENCES comum.grau_parentesco(id_grau_parentesco);

INSERT INTO comum.grau_parentesco (id_grau_parentesco, descricao) VALUES(1, 'Mãe'), (2, 'Pai'), (3, 'Avô(ó)'), (4, 'Tio(a)'), (5, 'Irmão(ã)'), (6, 'O próprio(a)'), (-1, 'Outro');

update comum.pessoa p set grau_parentesco_responsavel_matricula = 'Mãe', id_grau_parentesco_responsavel_matricula = 1 where UPPER(retira_acentuacao(TRIM(p.grau_parentesco_responsavel_matricula))) ilike 'mae';

update comum.pessoa p set grau_parentesco_responsavel_matricula = 'Pai', id_grau_parentesco_responsavel_matricula = 2 where UPPER(retira_acentuacao(TRIM(p.grau_parentesco_responsavel_matricula))) ilike 'pai';

update comum.pessoa p set grau_parentesco_responsavel_matricula = 'Avô(ó)', id_grau_parentesco_responsavel_matricula = 3 where UPPER(retira_acentuacao(TRIM(p.grau_parentesco_responsavel_matricula))) ilike 'avo';

update comum.pessoa p set grau_parentesco_responsavel_matricula = 'Tio(a)', id_grau_parentesco_responsavel_matricula = 4 WHERE UPPER(retira_acentuacao(TRIM(p.grau_parentesco_responsavel_matricula))) ~* '^(tia|tio)$';

update comum.pessoa p set grau_parentesco_responsavel_matricula = 'Irmão(ã)', id_grau_parentesco_responsavel_matricula = 5 WHERE UPPER(retira_acentuacao(TRIM(p.grau_parentesco_responsavel_matricula))) ~* '^(irmao|irma)$';

update comum.pessoa p set grau_parentesco_responsavel_matricula = 'O próprio(a)', id_grau_parentesco_responsavel_matricula = 6 WHERE UPPER(retira_acentuacao(TRIM(p.grau_parentesco_responsavel_matricula))) ~* '^(o proprio|a propria|o aluno|a aluna)$';