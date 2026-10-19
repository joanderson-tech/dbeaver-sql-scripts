SELECT *
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 683754
AND fa.ativo
AND fa."data" = todas AS sextas DO ano 


SELECT 
'UPDATE ensino.frequencia_aluno SET ativo = false WHERE id_frequencia IN ( ' || string_agg(fa.id_frequencia::TEXT,',') || ');' AS solucao,
'UPDATE ensino.frequencia_aluno SET ativo = true WHERE id_frequencia  IN ( ' || string_agg(fa.id_frequencia::TEXT,',') || ');' AS backup
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 683754
  AND fa.ativo = TRUE
  AND EXTRACT(DOW FROM fa."data") = 5;
  
  
  
UPDATE ensino.frequencia_aluno SET ativo = false WHERE id_frequencia IN ( 136994874,136995255,137229900,136994882,136995263,137039590,137229908,137528907,137692981,137975731,138281895,137039582,137528899,137692973,137841687,138354916,138355210);