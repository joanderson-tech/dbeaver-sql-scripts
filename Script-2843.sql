SELECT fa.*
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON fa.id_turma = t.id_turma
WHERE fa.id_discente IN (1442248)
AND t.ano = 2026
and t.id_turma =853602; 





SELECT COUNT(fa.id_frequencia) AS total_registos_afetados,
	   'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia IN (' || string_agg(fa.id_frequencia::TEXT, ',') || ');' AS solução,
	   'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia IN (' || string_agg(fa.id_frequencia::TEXT, ',') || ');' AS backup
FROM ensino.frequencia_aluno fa
INNER JOIN ensino.turma t ON t.id_turma = fa.id_turma
WHERE fa.id_turma = 830012
  AND t.id_turma_serie = 95789029
  AND t.ano = 2026
  group by fa.id_turma ;




select * from basico.registro_transferencia_entre_turmas where id_matricula_estudante_serie in (1648356, 1643669, 1607328, 1603772, 1603902, 1609317, 1593882, 1606692, 1594104, 1588273, 1642669, 1649469)

select * from basico.registro_transferencia_entre_turmas where id_matricula_estudante_serie in (1593882, 1643669, 1588273,1594104);


MPAMG3G4G5A, UNFMM2PA



830012,853602


95789029, 97008002

select * from basico.turma_serie where id_turma_serie in (95789029, 97008002) or id_turma_serie_agrupadora in (95789029, 97008002);


SELECT ht.*
FROM ensino.turma t
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
WHERE  true 
--and ht.id_turma 
AND t.ano = 2026;

turma antiga, turma nova 
830012,853602

select * from basico.matricula_estudante_serie mes where mes.id_turma_serie in (95789029, 97008002);


select * 
from basico.curriculo_basico_componente cbc 
where cbc.id_componente_curricular = 220;



WITH horarios_turma_1 AS (
    -- Busca todos os horários da turma 830012
    SELECT dia, hora_inicio, hora_fim 
    FROM ensino.horario_turma 
    WHERE id_turma = 830012
),
horarios_turma_2 AS (
    -- Busca todos os horários da turma 853602
    SELECT dia, hora_inicio, hora_fim 
    FROM ensino.horario_turma 
    WHERE id_turma = 853602
)
SELECT 
    (SELECT COUNT(*) FROM horarios_turma_1) AS qtd_horarios_turma_830012,
    (SELECT COUNT(*) FROM horarios_turma_2) AS qtd_horarios_turma_853602,
    COUNT(h1.*) AS qtd_horarios_coincidentes,
    CASE 
        WHEN COUNT(h1.*) = (SELECT COUNT(*) FROM horarios_turma_1) 
         AND COUNT(h1.*) = (SELECT COUNT(*) FROM horarios_turma_2) 
        THEN 'SÃO IDENTICAS (Mesmo Horário)'
        ELSE 'SÃO DIFERENTES (Existem Horários Distintos)'
    END AS resultado_comparacao
FROM horarios_turma_1 h1
INNER JOIN horarios_turma_2 h2 
    ON h1.dia = h2.dia 
   AND h1.hora_inicio = h2.hora_inicio 
   AND h1.hora_fim = h2.hora_fim;


SELECT 
    COALESCE(h1.dia, h2.dia) AS dia_semana,
    h1.hora_inicio AS inicio_turma_830012,
    h1.hora_fim    AS fim_turma_830012,
    h2.hora_inicio AS inicio_turma_853602,
    h2.hora_fim    AS fim_turma_853602,
    CASE 
        WHEN h1.id_horario_turma IS NOT NULL AND h2.id_horario_turma IS NOT NULL 
            THEN 'Horário Coincidente'
        WHEN h1.id_horario_turma IS NOT NULL AND h2.id_horario_turma IS NULL 
            THEN 'Apenas na Turma 830012'
        ELSE 'Apenas na Turma 853602'
    END AS status_horario
FROM (
    SELECT * FROM ensino.horario_turma WHERE id_turma = 830012
) h1
FULL OUTER JOIN (
    SELECT * FROM ensino.horario_turma WHERE id_turma = 853602
) h2 
    ON h1.dia = h2.dia 
   AND h1.hora_inicio = h2.hora_inicio 
   AND h1.hora_fim = h2.hora_fim
ORDER BY dia_semana, COALESCE(h1.hora_inicio, h2.hora_inicio);

