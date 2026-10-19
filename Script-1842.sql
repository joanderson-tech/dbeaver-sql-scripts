SELECT 'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || 
       ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie  || ';' AS backup
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio IN (51880851, 51880867, 51880817, 51880834);