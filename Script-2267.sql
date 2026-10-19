
-- rodar essa parte no banco academico

UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET email = 'desenv@esig.com.br', ramal = 1234;
UPDATE escola.escola SET senhatransferencia = '123456' WHERE senhatransferencia IS NOT NULL;

ALTER TABLE comum.informacoes_medicas ADD COLUMN em_acompanhamento_psicologico BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE comum.informacoes_medicas ADD COLUMN observacao_acompanhamento_psicologico varchar(1000);
ALTER TABLE comum.informacoes_medicas ADD COLUMN em_investigacao_psicossocial BOOLEAN NOT NULL DEFAULT FALSE;
alter table ensino.horario_turma add column id_registro_atualizacao int4 NULL;
alter table ensino.horario_turma add constraint horario_turma_registro_atualizacao_fk foreign key (id_registro_atualizacao) references comum.registro_entrada(id_entrada);
alter table ensino.horario add column id_registro_cadastro int4 null;
alter table ensino.horario add column data_cadastro timestamp DEFAULT now() null;
update ensino.horario set data_cadastro = null;
alter table ensino.horario add column id_registro_atualizacao int4 null;
alter table ensino.horario add column data_alteracao timestamp null;
alter table ensino.horario add constraint horario_registro_cadastro_fk foreign key (id_registro_cadastro) references comum.registro_entrada(id_entrada);
alter table ensino.horario add constraint horario_registro_atualizacao_fk foreign key (id_registro_atualizacao) references comum.registro_entrada(id_entrada);
ALTER TABLE pessoas.falta_servidor ADD COLUMN IF NOT EXISTS id_registro_justificativa int4 NULL;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'falta_servidor_id_registro_justificativa_fkey') THEN ALTER TABLE pessoas.falta_servidor ADD CONSTRAINT falta_servidor_id_registro_justificativa_fkey FOREIGN KEY (id_registro_justificativa) REFERENCES comum.registro_entrada(id_entrada); END IF; END $$;
ALTER TABLE ensino.registro_falta_professor ADD COLUMN IF NOT EXISTS id_registro_justificativa int4 NULL;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'registro_falta_professor_id_registro_justificativa_fkey') THEN ALTER TABLE ensino.registro_falta_professor ADD CONSTRAINT registro_falta_professor_id_registro_justificativa_fkey FOREIGN KEY (id_registro_justificativa) REFERENCES comum.registro_entrada(id_entrada); END IF; END $$;

ALTER TABLE comum.tipo_etnia ADD PRIMARY KEY (id_tipo_etnia);
INSERT INTO comum.tipo_etnia(id_tipo_etnia, descricao ) VALUES 
	(1, 'Quilombola'),
	(2, 'Cigano'),
	(3, 'Povos Ribeirinhos'),
	(4, 'Povos Caiçaras'),
	(5, 'Povos Extrativistas'),
	(6, 'Comunidades Tradicionais do Campo'),
	(7, 'Comunidades Tradicionais da Floresta'),
	(8, 'Pescadores Artesanais'),
	(9, 'Quebradeiras de Coco Babaçu'),
	(10, 'Faxinalenses'),
	(11, 'Fundos e Fechos de Pasto');


CREATE TABLE comum.tipo_etnia_pessoa (
    id_tipo_etnia INTEGER NOT NULL REFERENCES comum.tipo_etnia (id_tipo_etnia),
    id_pessoa INTEGER NOT NULL REFERENCES comum.pessoa (id_pessoa),
    PRIMARY key (id_tipo_etnia, id_pessoa) 
);

COMMENT ON TABLE comum.tipo_etnia_pessoa IS 'Tabela responsável por relacionar comum.pessoa à comum.tipo_etnia';

CREATE SEQUENCE comum.seq_tipo_etnia_pessoa START WITH 1 INCREMENT BY 1;

CREATE INDEX idx_tipo_etnia_pessoa_etnia ON comum.tipo_etnia_pessoa (id_tipo_etnia);

CREATE INDEX idx_tipo_etnia_pessoa_pessoa ON comum.tipo_etnia_pessoa (id_pessoa);

INSERT INTO comum.tipo_etnia_pessoa(id_tipo_etnia, id_pessoa) SELECT 1, id_pessoa FROM comum.pessoa p WHERE p.quilombola;

ALTER TABLE comum.alteracao_pessoa ALTER COLUMN id_tipo_etnia TYPE varchar(100) USING NULL;