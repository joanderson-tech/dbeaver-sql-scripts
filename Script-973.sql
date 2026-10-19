begin;

ALTER TABLE basico.curriculo_basico_componente ADD permite_multiplos_professores bool DEFAULT FALSE NOT NULL;
ALTER TABLE basico.curriculo_basico_componente ALTER COLUMN permite_multiplos_professores SET STORAGE PLAIN;
COMMENT ON COLUMN basico.curriculo_basico_componente.permite_multiplos_professores IS 'Indica se a disciplina pode alocar mais de um professor.';
ALTER TABLE basico.curriculo_basico ADD permite_multiplos_professores_polivalente bool DEFAULT FALSE NOT NULL;
ALTER TABLE basico.curriculo_basico ALTER COLUMN permite_multiplos_professores_polivalente SET STORAGE PLAIN;
COMMENT ON COLUMN basico.curriculo_basico.permite_multiplos_professores_polivalente IS 'Indica se a disciplina polivalente pode alocar mais de um professor.';
ALTER TABLE ensino.turma ADD permite_multiplos_professores bool DEFAULT FALSE NOT NULL;
ALTER TABLE ensino.turma ALTER COLUMN permite_multiplos_professores SET STORAGE PLAIN;
COMMENT ON COLUMN ensino.turma.permite_multiplos_professores IS 'Indica se a disciplina pode alocar mais de um professor.';
DROP TABLE ensino.horario_docente;
CREATE TABLE ensino.horario_docente (id_horario_docente int4 NOT NULL, id_docente_turma int4 NOT NULL, id_horario int4 NOT NULL, dia_semana bpchar(1) NOT NULL, ativo bool DEFAULT true NOT NULL, id_registro_cadastro int4 NULL, data_cadastro timestamp NOT NULL, id_registro_alteracao int4 NULL, data_alteracao timestamp NULL, CONSTRAINT horario_docente_pkey PRIMARY KEY (id_horario_docente));
ALTER TABLE ensino.horario_docente ADD CONSTRAINT horario_docente_id_docente_turma_fkey FOREIGN KEY (id_docente_turma) REFERENCES ensino.docente_turma(id_docente_turma);
ALTER TABLE ensino.horario_docente ADD CONSTRAINT horario_docente_id_horario_fkey FOREIGN KEY (id_horario) REFERENCES ensino.horario(id_horario);
ALTER TABLE ensino.horario_docente ADD CONSTRAINT id_registro_alteracao_fkey FOREIGN KEY (id_registro_alteracao) REFERENCES comum.registro_entrada(id_entrada);
ALTER TABLE ensino.horario_docente ADD CONSTRAINT id_registro_cadastro_fkey FOREIGN KEY (id_registro_cadastro) REFERENCES comum.registro_entrada(id_entrada);
CREATE SEQUENCE ensino.horario_docente_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1276 CACHE 1 NO CYCLE;

commit;