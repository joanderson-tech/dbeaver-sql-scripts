SELECT 
    ra.*
    --COUNT(ra.id_topico_aula ) AS toral_aulas_lançadas
FROM basico.turma_serie ts
INNER JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
LEFT JOIN ensino.docente_turma dt   ON dt.id_turma = t.id_turma AND dt.ativo = TRUE
LEFT JOIN RH.servidor s   ON s.id_servidor  = dt.id_docente
LEFT JOIN comum.pessoa p_s  ON p_s.id_pessoa = s.id_pessoa
LEFT JOIN ava.topico_aula ra  ON ra.id_turma = t.id_turma 
WHERE ts.ano = 2026
  AND ts.ativo = TRUE
  AND s.id_servidor = 712
  
GROUP BY  ra, ts.id_turma_serie, ts.nome, p_s.nome


HAVING COUNT(ra.id_topico_aula) = 0;


SELECT * FROM ava.topico_aula ra;


SELECT ra
FROM basico.turma_serie ts
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN ensino.docente_turma dt   ON dt.id_turma = t.id_turma 
JOIN ava.topico_aula ra  ON ra.id_turma = t.id_turma 
WHERE dt.id_docente = 712;