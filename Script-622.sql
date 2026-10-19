--Solução para pegar os ids da frequencia das turmas dessa escola
SELECT *
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE e.id_escola = 52232894
)
AND fa."data" = '2025-05-03';


SELECT *
FROM ava.aula_extra ae
WHERE ae.data_aula = '2025-05-10'
AND ae.id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE e.id_escola = 52232894
);