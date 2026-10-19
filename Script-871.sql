ALTER TABLE basico.curriculo_basico_componente ADD permite_multiplos_professores bool DEFAULT FALSE NOT NULL;
ALTER TABLE basico.curriculo_basico_componente ALTER COLUMN permite_multiplos_professores SET STORAGE PLAIN;

COMMENT ON COLUMN basico.curriculo_basico_componente.permite_multiplos_professores IS 'Indica se a disciplina pode alocar mais de um professor.';
ALTER TABLE basico.curriculo_basico ADD permite_multiplos_professores_polivalente bool DEFAULT FALSE NOT NULL;
ALTER TABLE basico.curriculo_basico ALTER COLUMN permite_multiplos_professores_polivalente SET STORAGE PLAIN;
COMMENT ON COLUMN basico.curriculo_basico.permite_multiplos_professores_polivalente IS 'Indica se a disciplina polivalente pode alocar mais de um professor.';