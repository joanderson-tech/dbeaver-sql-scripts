WITH frequencias AS (SELECT fa.id_frequencia, fa.id_turma, fa."data", fa.atual, fa.frequencia, fa.horarios,(fa.abonada
AND count(af.*) > 0) AS abonada
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
LEFT JOIN ensino.item_abono_frequencia iaf ON
iaf.id_frequencia = fa.id_frequencia
LEFT JOIN ensino.abono_frequencia af ON
af.ativo
AND af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE fa.ativo
AND fa.id_discente = 976301
AND t.id_turma_serie = 51885408
GROUP BY fa.id_frequencia, fa.id_turma, fa."data", fa.atual, fa.frequencia, fa.horarios, fa.abonada ) SELECT fa.id_turma, CAST(fa."data" AS TEXT) AS data_aula, LEAST (COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0), COALESCE(ae.numero_aulas, fa.horarios)) AS faltas, COALESCE(ae.numero_aulas, fa.horarios) AS horarios
FROM frequencias fa
LEFT JOIN ava.aula_extra ae ON
ae.id_turma = fa.id_turma
AND ae.data_aula = fa."data"
GROUP BY fa.id_turma, fa."data", fa.frequencia, fa.horarios, ae.numero_aulas
ORDER BY data_aula;


SELECT * FROM discente WHERE matricula = '202630028844';


SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante = 976301;