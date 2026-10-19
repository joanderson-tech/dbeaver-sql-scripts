ALTER TABLE basico.turma_serie ADD COLUMN id_registro_atualizacao int4 NULL;

ALTER TABLE basico.turma_serie ADD COLUMN data_atualizacao date NULL;

ALTER TABLE basico.turma_serie ADD CONSTRAINT turma_serie_id_registro_atualizacao_fk FOREIGN KEY (id_registro_atualizacao) REFERENCES comum.registro_entrada(id_entrada);