SELECT *--string_agg(id_frequencia :: varchar, ',')
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma in (683725);
AND fa."data" in('2025-09-30', '2025-10-01', '2025-10-02') ;
AND fa.ativo;




SELECT *--string_agg(id_frequencia :: varchar, ',')
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma in (683743)
AND fa."data" in('2025-07-28') 
AND fa.ativo;