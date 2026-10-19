SELECT distinct ht.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
JOIN ensino.horario h ON h.id_horario = ht.id_horario
WHERE ts.id_escola = 51877800
AND t.id_turma_serie = 51894937
AND t.id_turma = 684956
AND ht.ativo;


684956

-- Auto-generated SQL script #202605221232
UPDATE ensino.horario_turma
	SET id_turma=684956
	WHERE id_horario_turma=1406132;

--backup
UPDATE ensino.horario_turma
	SET id_turma=684961
	WHERE id_horario_turma=1406132;



SELECT distinct t.*
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_escola = 51877800
AND t.id_turma_serie = 51894937

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 51895174;


-- Auto-generated SQL script #202605220833
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma=685500;


SELECT 
'UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = '||t.id_turma  ||';' AS solução,
'UPDATE ensino.turma SET id_categoria_componente='|| COALESCE('''' || t.id_categoria_componente || '''', 'NULL') ||'	WHERE id_turma = '||t.id_turma  ||';' AS backup
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio in(51895174, 51895190) 
AND t.id_categoria_componente IS NULL
AND t.id_disciplina = 521;


SELECT e.nome AS escola, ts.nome AS turma
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN escola.escola e ON e.id_escola = ts.id_escola 
WHERE ts.id_curriculo_medio IN (51895174, 51895190) 
AND t.id_categoria_componente IS NULL
AND t.id_disciplina = 521;

UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685498;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685497;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685501;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685502;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685506;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685507;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685503;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685504;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685499;
UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = 685500;

UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685498;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685497;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685501;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685502;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685506;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685507;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685503;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685504;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685499;
UPDATE ensino.turma SET id_categoria_componente=NULL	WHERE id_turma = 685500;



UPDATE ensino.turma SET id_categoria_componente=null	WHERE id_turma = 685504;
UPDATE ensino.turma SET id_categoria_componente=null	WHERE id_turma = 685499;
UPDATE ensino.turma SET id_categoria_componente=null	WHERE id_turma = 685500;
UPDATE ensino.turma SET id_categoria_componente=null	WHERE id_turma = 685507;
UPDATE ensino.turma SET id_categoria_componente=null	WHERE id_turma = 685503;


UPDATE ensino.turma SET id_categoria_componente=2	WHERE id_turma = 685507;
UPDATE ensino.turma SET id_categoria_componente=2	WHERE id_turma = 685503;
UPDATE ensino.turma SET id_categoria_componente=2	WHERE id_turma = 685504;
UPDATE ensino.turma SET id_categoria_componente=2	WHERE id_turma = 685499;
UPDATE ensino.turma SET id_categoria_componente=2	WHERE id_turma = 685500;





SELECT t.*
FROM ensino.turma t
WHERE t.id_turma_serie = 51894973;


--AND t.id_disciplina IN (517, 513, 514)
-- Auto-generated SQL script #202605211701
UPDATE ensino.horario_turma
SET
id_turma = 685001
WHERE id_horario_turma = 1406217;
--
UPDATE ensino.horario_turma 	SET id_turma=685503	WHERE id_horario_turma=1406230;
--backup

UPDATE ensino.horario_turma
SET
id_turma = 684995
WHERE id_horario_turma = 1406217;

UPDATE ensino.horario_turma
SET
id_turma = 684995
WHERE id_horario_turma = 1406230;

684995

SELECT ht.id_horario_turma, ht.id_turma, ht.id_horario, ht.dia, ht.ativo, ht.data_alteracao, h.id_horario, h.inicio, h.fim, t.codigo, t.periodo, t.id_disciplina
FROM ensino.horario_turma ht
JOIN ensino.turma t
	USING (id_turma)
JOIN ensino.horario h
	USING (id_horario)
WHERE t.id_turma_serie = 51894973
AND ht.ativo = trueValue()
AND t.id_categoria_componente = 1
ORDER BY ht.data_alteracao, ht.id_horario, dia;

SELECT ht.id_horario_turma, ht.id_turma, ht.id_horario, ht.dia, ht.ativo, ht.data_alteracao, h.id_horario, h.inicio, h.fim, t.codigo, t.periodo, t.id_disciplina
FROM ensino.horario_turma ht
JOIN ensino.turma t
	USING (id_turma)
JOIN ensino.horario h
	USING (id_horario)
WHERE  ht.ativo = trueValue()
AND (t.id_categoria_componente IS NULL)
ORDER BY ht.data_alteracao, ht.id_horario, dia