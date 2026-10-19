SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE true
AND t.id_turma_serie  IN (52057125)
--AND t.id_turma IN (685720)
ORDER BY fa."data" ,fa.id_discente;



SELECT ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma IN (52057125);


SELECT ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie IN (52057125);

SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE true
--AND t.id_turma_serie  IN (52056838)
AND t.id_turma IN (685722)
ORDER BY fa."data" ,fa.id_discente;


SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE true
--AND t.id_turma_serie  IN (52056838)
AND t.id_turma IN (685749)
ORDER BY fa."data" ,fa.id_discente;


