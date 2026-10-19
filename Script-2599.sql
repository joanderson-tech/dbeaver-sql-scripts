
SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_turma = 695861;
AND ht.ativo = false ;

695861

SELECT *
FROM ensino.turma t
WHERE t.id_turma = 695835;

SELECT *
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 695835;

SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_turma = 695835
AND ht.ativo = false ;


-- Auto-generated SQL script #202607291747
UPDATE ensino.horario_turma
    SET data_alteracao=NULL
    WHERE id_horario_turma IN (1428681, 1428689, 1428690, 1428694, 1428698, 1428699);

UPDATE ensino.horario_turma
    SET data_alteracao='2026-04-30 11:27:51.000'
    WHERE id_horario_turma IN (1428681, 1428689, 1428690, 1428694, 1428698, 1428699);



SELECT *
FROM basico.calendario_escolar ce
WHERE ce.ano = 2026;
-- Auto-generated SQL script #202607291726
UPDATE ensino.horario_turma
SET
data_inicio = '2026-02-06'
WHERE id_horario_turma IN (1441463, 1441471, 1441472, 1441476, 1441480, 1441481);

UPDATE ensino.horario_turma
SET
data_inicio = '2026-04-30'
WHERE id_horario_turma IN (1441463, 1441471, 1441472, 1441476, 1441480, 1441481);

