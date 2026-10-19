SELECT 
    'UPDATE ensino.frequencia_aluno SET id_turma = 717715 WHERE id_frequencia IN (' || string_agg(f.id_frequencia::TEXT, ',') || ');' AS solucao,
    'UPDATE ensino.frequencia_aluno SET id_turma = '||t.id_turma||' WHERE id_frequencia IN (' || string_agg(f.id_frequencia::TEXT, ',') || ');' AS backup
from ensino.turma t 
join ensino.frequencia_aluno fa on fa.id_turma = t.id_turma 
where true
and fa.id_discente = 990426
and fa.id_registro_atualizacao = 6105693
and t.ano = 2026;

SELECT 
COUNT(fa.id_frequencia) AS total_frequencias, 
'UPDATE ensino.frequencia_aluno SET id_turma = 717715 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::TEXT, ', ') || ');' AS solucao, 
'UPDATE ensino.frequencia_aluno SET id_turma = ' || t.id_turma || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::TEXT, ', ') || ');' AS backup
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON fa.id_turma = t.id_turma
WHERE fa.id_discente = 990426
AND fa.id_registro_atualizacao = 6105693
AND t.ano = 2026
GROUP BY t.id_turma;


SELECT t.* FROM ensino.turma AS t
WHERE id_turma = 717715;

SELECT 
    'UPDATE ensino.frequencia_aluno SET ativo = TRUE WHERE id_frequencia IN (' || string_agg(f.id_frequencia::TEXT, ',') || ');' AS solucao,
    'UPDATE ensino.frequencia_aluno SET ativo = FALSE WHERE id_frequencia IN (' || string_agg(f.id_frequencia::TEXT, ',') || ');' AS backup
FROM registros_filtrados f
WHERE f.row_num = 1
AND NOT EXISTS ( 
    SELECT 1
    FROM ensino.frequencia_aluno fa2 
    WHERE fa2.id_frequencia <> f.id_frequencia 
      AND fa2.id_discente = f.id_discente 
      AND fa2."data" = f."data" 
      AND fa2.id_turma = f.id_turma 
      AND fa2.ativo
);