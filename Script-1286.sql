SELECT ht.* FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
--JOIN ensino.frequencia_aluno fa ON t.id_turma = fa.id_turma 
WHERE t.id_turma_serie = 53960751
--AND fa.ativo = FALSE;


