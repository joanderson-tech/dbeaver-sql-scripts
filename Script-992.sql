ALTER TABLE basico.turma_serie ADD COLUMN id_registro_atualizacao int4 NULL;

ALTER TABLE basico.turma_serie ADD COLUMN data_atualizacao date NULL;

ALTER TABLE basico.turma_serie ADD CONSTRAINT turma_serie_id_registro_atualizacao_fk FOREIGN KEY (id_registro_atualizacao) REFERENCES comum.registro_entrada(id_entrada);


ALTER TABLE ensino.docente_turma_alteracao ADD COLUMN justificativa VARCHAR(255);

ALTER TABLE ensino.docente_turma_alteracao ADD COLUMN id_alteracao_em_lote INT;

comment on column ensino.docente_turma_alteracao.id_alteracao_em_lote is 'Id que agrupa alterações em lote feitas numa mesma requisição';