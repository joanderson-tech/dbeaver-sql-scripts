select COUNT(id_horario_turma) from  ensino.horario_turma WHERE id_horario_turma IN (1567341,1567342,1567339,1567340,1567343,1567344,1567345,1567346,1567347,1567348,1567349,1567351,1567352,1567288,1567333,1567289,1567334,1567290,1567335,1567291,1567336,1567292,1567337,1567293,1567338,1567294,1567295,1567296,1567297,1567298,1567299,1567300,1567301,1567302,1567303,1567304,1567305,1567306,1567307,1567308,1567353,1567309,1567354,1567310,1567311,1567356,1567312,1567357,1567350,1567355);

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
    WHERE t.id_turma_serie = 55493495
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