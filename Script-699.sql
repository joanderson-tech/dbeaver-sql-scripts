SELECT SUM(fa.frequencia) AS total_frequencia
FROM ensino.frequencia_aluno fa 
WHERE fa.id_discente = 986805 
  AND EXTRACT(YEAR FROM fa.data) = 2025
  and FA.id_turma in (710398, 705368, 710974, 706842, 710375, 710498, 710368, 706557, 706397, 706742, 709802)
