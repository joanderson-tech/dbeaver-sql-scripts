SELECT 
'UPDATE ensino.turma SET id_categoria_componente=1	WHERE id_turma = '||t.id_turma  ||';' AS solução,
'UPDATE ensino.turma SET id_categoria_componente='|| COALESCE('''' || t.id_categoria_componente || '''', 'NULL') ||'	WHERE id_turma = '||t.id_turma  ||';' AS backup
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio = 51895190
AND t.id_categoria_componente IS NULL
AND t.id_disciplina = 521;


SELECT e.nome AS escola, ts.nome AS turma
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN escola.escola e ON e.id_escola = ts.id_escola 
WHERE ts.id_curriculo_medio = 51895190
AND t.id_categoria_componente IS NULL
AND t.id_disciplina = 521;