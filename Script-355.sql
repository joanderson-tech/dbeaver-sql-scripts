714255

714256

select * from ensino.horario_turma ht where ht.id_turma = 714256 order by ativo ;

SELECT string_agg(fa.id_frequencia::varchar , ',' )
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 714256
  AND fa.horarios = 1
  AND EXTRACT(DOW FROM fa.data) in( 2,3,5); -- 5 representa sexta-feira


SELECT string_agg(fa.id_data_aula_turma::varchar , ',')
FROM ensino.data_aula_turma fa
WHERE fa.id_turma = 714256
  AND fa.quantidade_horarios = 1
  AND EXTRACT(DOW FROM fa.data_aula) in( 2,3,5);  -- 5 representa sexta-feira
  
  
  segunda 1 
  terca 2 
  quarta 2 
  quinta 1
  sexta 2 
  
  
 
	