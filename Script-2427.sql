SELECT mc.* 
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (84777071,84777072, 84777073);