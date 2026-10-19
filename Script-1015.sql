ALTER TABLE ensino.descricao_nota ADD COLUMN semestral bool DEFAULT FALSE;

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(27, 'AQ1', 'Avaliação Quantitativa 1', FALSE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(28, 'AQ2', 'Avaliação Quantitativa 2', FALSE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(29, 'MS', 'Média Semestral', TRUE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(30, 'RS', 'Recuperação Semestral', TRUE);

INSERT INTO ensino.descricao_nota (id_descricao_nota, cod_nota, descricao_nota, semestral) VALUES(31, 'MSF', 'Média Semestral Final', TRUE);