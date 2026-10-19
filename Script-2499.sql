SELECT * FROM ensino.turma t 
JOIN ava.plano_aula pa ON pa.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 51899264;