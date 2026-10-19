SELECT *
FROM matricula.calendario_matricula cm ;

SELECT mes
FROM MatriculaEstudanteSerie mes
JOIN FETCH mes.serie s
JOIN FETCH mes.serie.serie ss
LEFT JOIN mes.turmaSerie
JOIN mes.discenteMedio est
JOIN est.discente d
JOIN d.pessoa p
WHERE d.id IN (1371708)
AND mes.ano = :ano
AND mes.situacaoMatriculaSerie.id IN ( 2, 3, 1, 7, 8, 10,-1 )
ORDER BY mes.id DESC

SELECT mes.*
FROM basico.matricula_estudante_serie mes 
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie 
JOIN discente d ON d.id_discente = mes.id_estudante 
WHERE d.id_discente = 1371708
AND mes.ano_calendario = 2025
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 );

