SELECT t.id_disciplina , t.id_turma_serie,dt.* FROM ensino.turma t 
JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma 
WHERE t.id_situacao_turma = 3 AND ano = 2025 AND t.id_turma_serie = 58535393
AND t.id_turma = 695036;
