BEGIN;

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
    WHERE t.id_turma_serie = 52016983
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

UPDATE ensino.frequencia_aluno SET ativo = TRUE WHERE id_frequencia IN (137683340,137683326,137683331,137683324,137683336,137683320,137683348,137683354,137683361,137683364,137683339,137683325,137683365,137683356,137683330,137683360,137683323,137683341,137683353,137683362,137683347,137683352,137683329);


UPDATE ensino.horario_turma ht SET data_fim = '2025-06-09',  data_alteracao = '2025-06-09' WHERE ht.id_horario_turma IN (1403603,1403608,1403620,1403625,1403619,1403624,1403614,1403602,1403604,1403607,1403609,1403615,1403616,1403617,1403622,1403605,1403610,1403612,1403613,1403618,1403623,1403606,1403611,1403621,1403626);
UPDATE ensino.horario_turma ht SET data_alteracao = '2025-09-05' WHERE ht.id_horario_turma IN (1403902,1403904,1403907,1403909,1403903,1403908,1403913,1403900,1403901,1403905,1403906,1403910,1403911,1403917,1403922,1403915,1403916,1403920,1403921,1403912,1403914,1403919,1403924,1403918,1403923);
UPDATE ensino.horario_turma ht SET  data_inicio = '2025-09-06',data_fim = '2025-12-18' WHERE ht.id_horario_turma IN(1404433,1404434,1404435,1404440,1404421,1404426,1404438,1404443,1404423,1404428,1404430,1404431,1404436,1404441,1404437,1404442,1404424,1404429,1404420,1404422,1404425,1404427,1404432,1404439,1404444); 



COMMIT;

UPDATE ensino.frequencia_aluno SET ativo = FALSE WHERE id_frequencia IN (137683340,137683326,137683331,137683324,137683336,137683320,137683348,137683354,137683361,137683364,137683339,137683325,137683365,137683356,137683330,137683360,137683323,137683341,137683353,137683362,137683347,137683352,137683329);
