SELECT * FROM ensino.horario_turma ht WHERE ht.id_turma  IN (683975); AND ativo;


SELECT * FROM ensino.frequencia_aluno fa WHERE fa.id_turma = 683975


SELECT * 
FROM ensino.frequencia_aluno fa 
WHERE fa.id_turma = 683975
  AND fa."data"  >= '2024-01-01' 
  AND fa."data" <= '2024-12-31'
  AND EXTRACT(DOW FROM fa."data") = 1;