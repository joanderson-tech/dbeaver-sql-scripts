SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE true
AND t.id_turma_serie  IN (52056838) 
ORDER BY fa."data" ,fa.id_discente;