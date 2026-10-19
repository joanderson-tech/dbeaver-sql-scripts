CREATE TABLE comum.logging_lancamento_notas (id_logging_lancamento_notas int4 NOT NULL DEFAULT nextval('hibernate_sequence'::regclass), id_turma_componente int4 NOT NULL, id_registro_entrada int4 NOT NULL, data_cadastro timestamp NOT NULL, CONSTRAINT pk_id_logging_lancamento_notas PRIMARY KEY (id_logging_lancamento_notas));
ALTER TABLE comum.logging_lancamento_notas OWNER TO sigeduc;
GRANT ALL ON TABLE comum.logging_lancamento_notas TO sigeduc;
CREATE INDEX fki_logging_lancamento_notas_id_turma_componente ON comum.logging_lancamento_notas USING btree (id_turma_componente);
ALTER TABLE comum.logging_lancamento_notas ADD CONSTRAINT logging_lancamento_notas_id_usuario_fkey FOREIGN KEY (id_turma_componente) REFERENCES ensino.turma(id_turma);
ALTER TABLE comum.logging_lancamento_notas ADD CONSTRAINT logging_lancamento_notas_id_registro_entrada_fkey FOREIGN KEY (id_registro_entrada) REFERENCES comum.registro_entrada(id_entrada);


BEGIN;
COMMIT;
