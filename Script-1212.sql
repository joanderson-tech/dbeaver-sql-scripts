select * from ensino.frequencia_aluno fa
join ensino.turma t on t.id_turma = fa.id_turma 
where fa.id_discente = 980526 
and fa."data" > '2025-01-01'
and fa.frequencia >=1;
