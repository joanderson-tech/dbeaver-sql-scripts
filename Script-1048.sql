begin;


WITH registros_filtrados AS (
    SELECT 
        fa.id_turma,
        fa.id_frequencia,
        fa.id_discente,
        fa."data",
        fa.data_cadastro,
        ROW_NUMBER() OVER (
            PARTITION BY fa.id_discente, fa."data", fa.id_turma, fa.ativo
            ORDER BY fa.data_cadastro DESC
        ) AS row_num
    FROM ensino.frequencia_aluno fa
    JOIN ensino.turma t ON t.id_turma = fa.id_turma
    JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = fa.id_discente 
      AND mes.id_turma_serie = t.id_turma_serie
    WHERE t.id_turma_serie IN (53849092, 53848633, 53848634, 53848635, 53849088, 53848639, 54610142, 54610143, 54610141)
      AND mes.id_situacao_matricula_serie <> 5
      AND fa."data" >= COALESCE(mes.data_matricula_turma, mes.data_cadastro)
      AND fa.ativo = FALSE
)
SELECT 
    'UPDATE ensino.frequencia_aluno SET ativo = TRUE WHERE id_frequencia IN (' || 
    string_agg(f.id_frequencia::TEXT, ',') || ');' AS solucao,
    'UPDATE ensino.frequencia_aluno SET ativo = FALSE WHERE id_frequencia IN (' || 
    string_agg(f.id_frequencia::TEXT, ',') || ');' AS backup
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