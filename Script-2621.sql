SELECT * FROM comum.pessoa WHERE nome ilike 'ROSÂNGELA LIBÓRIO DE SANTANA' = 746548

SELECT * FROM rh.servidor s WHERE s.id_pessoa = 746548;

SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 291;

SELECT * FROM ensino.docente_turma dt WHERE dt.id_turma = 682447;


-- Auto-generated SQL script #202608280856
UPDATE ensino.docente_turma     SET finalizada=true    WHERE id_docente_turma=52045556;
