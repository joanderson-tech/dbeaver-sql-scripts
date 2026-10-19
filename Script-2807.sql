SELECT 
    ta.id_topico_aula,
    t.id_turma,
    ts.id_turma_serie,
    t.id_disciplina ,
    ta.data AS data_topico_atual,
    -- Dia da semana atual do tópico (2 = Segunda, 3 = Terça, etc.)
    (EXTRACT(ISODOW FROM ta.data) + 1)::integer AS dia_semana_atual,
    -- Dia da semana correto definido no horário da turma
    ht.dia::integer AS dia_semana_esperado,
    -- CALCULA A PRÓXIMA DATA CORRETA COM BASE NO HORÁRIO DA TURMA
    (
        ta.data + (
            MOD(
                (ht.dia::integer - 1) - EXTRACT(ISODOW FROM ta.data)::integer + 7, 
                7
            ) * INTERVAL '1 day'
        )
    )::date AS data_sugerida_ajuste,
    ht.hora_inicio,
    ht.hora_fim
FROM ensino.turma t 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
JOIN ensino.horario_turma ht ON t.id_turma = ht.id_turma 
JOIN ava.topico_aula ta ON ta.id_turma = t.id_turma 
WHERE t.id_turma_serie IN (51896905, 51896919 ,51896929, 51896941)
  -- Seleciona apenas os registos em que o dia do tópico é DIFERENTE do dia do horário
  AND (EXTRACT(ISODOW FROM ta.data) + 1)::text <> ht.dia
  --AND t.id_disciplina = 238
  --AND t.id_turma = 683459
ORDER BY t.id_disciplina , ta.id_topico_aula, ht.hora_inicio;


