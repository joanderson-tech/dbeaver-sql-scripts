
SELECT string_agg(fa.id_frequencia::varchar, ', ')
FROM ensino.frequencia_aluno fa
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.frequencia_aluno fa1
    JOIN ensino.turma t ON fa1.id_turma = t.id_turma
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE ts.ano = 2025
    AND fa1.id_turma = fa.id_turma
    AND fa1.id_discente = fa.id_discente
    AND fa1."data" = '2025-05-03'
    and e.id_escola = 52232831
)
AND fa."data" = '2025-05-10';

--Solução para pegar os ids da aula extra do dia 10 das turmas dessa escola
SELECT string_agg(ae.id::varchar, ', ')
FROM ava.aula_extra ae
WHERE ae.data_aula = '2025-05-10';

--Solução para pegar os ids da frequencia das turmas dessa escola
SELECT string_agg(id_frequencia  ::varchar, ', ')
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE e.id_escola = 52232831
)
AND fa."data" = '2025-05-10';


--Solução para pegar os ids da aula extra do dia 10 das turmas dessa escola
SELECT string_agg(ae.id::varchar, ', ')
FROM ava.aula_extra ae
WHERE ae.data_aula = '2025-05-10'
AND ae.id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE e.id_escola = 52232831
);



