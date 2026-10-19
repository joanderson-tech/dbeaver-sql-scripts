ALTER TABLE ensino.docente_turma_alteracao ADD COLUMN justificativa VARCHAR(255);

ALTER TABLE ensino.docente_turma_alteracao ADD COLUMN id_alteracao_em_lote INT;

comment on column ensino.docente_turma_alteracao.id_alteracao_em_lote is 'Id que agrupa alterações em lote feitas numa mesma requisição';

EDUC-168

ALTER TABLE ensino.descricao_nota ADD COLUMN semestral bool DEFAULT FALSE;

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(27, 'AQ1', 'Avaliação Quantitativa 1', FALSE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(28, 'AQ2', 'Avaliação Quantitativa 2', FALSE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(29, 'MS', 'Média Semestral', TRUE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(30, 'RS', 'Recuperação Semestral', TRUE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(31, 'MSF', 'Média Semestral Final', TRUE);

EDUC-969 

ALTER TABLE basico.matricula_estudante_serie ADD bloquear_renovacao bool DEFAULT false NOT NULL;
ALTER TABLE basico.matricula_estudante_serie ALTER COLUMN bloquear_renovacao SET STORAGE PLAIN;