BEGIN;

SELECT 
'UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = '||t.id_turma  ||';' AS solução,
'UPDATE ensino.turma SET id_categoria_componente='|| COALESCE('''' || t.id_categoria_componente || '''', 'NULL') ||'	WHERE id_turma = '||t.id_turma  ||';' AS backup
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio in (51895174, 51895190) 
AND t.id_categoria_componente IS NULL
AND t.id_disciplina = 521;

BEGIN;


UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685497;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685498;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685499;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685500;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685505;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685501;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685502;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685506;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685504;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685507;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685503;

COMMIT;

UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685497;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685498;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685499;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685500;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685505;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685501;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685502;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685506;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685504;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685507;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685503;