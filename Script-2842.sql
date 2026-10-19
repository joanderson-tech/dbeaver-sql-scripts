SELECT fa.*
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON fa.id_turma = t.id_turma
WHERE fa.id_discente IN (1446511, 1407285, 1363448, 1407259, 1401049, 1407225, 1399905, 1407320, 1407469, 1445954, 1442248)
AND t.ano = 2026
and t.id_turma =830012; 


select * from basico.registro_transferencia_entre_turmas where id_matricula_estudante_serie in (1648356, 1643669, 1607328, 1603772, 1603902, 1609317, 1593882, 1606692, 1594104, 1588273, 1642669, 1649469)



MPAMG3G4G5A, UNFMM2PA



830012,853602


95789029, 97008002

select * from basico.turma_serie where id_turma_serie in (95789029, 97008002);


SELECT fa.*
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON fa.id_turma = t.id_turma
WHERE  t.id_turma_serie  = 97008002
AND t.ano = 2026;


select * from basico.matricula_estudante_serie mes where mes.id_turma_serie in (95789029, 97008002);



MPAMG3G4G5A, UNFMM2PA

830012, 853602


95789029, 95789029

--853602

830012, 853602

SELECT COUNT(fa.id_frequencia) AS total_registos_afetados,
	   'UPDATE ensino.frequencia_aluno SET id_turma = 853602 WHERE id_frequencia IN (' || string_agg(fa.id_frequencia::TEXT, ',') || ');' AS solução,
	   'UPDATE ensino.frequencia_aluno SET id_turma = ' || fa.id_turma || ' WHERE id_frequencia IN (' || string_agg(fa.id_frequencia::TEXT, ',') || ');' AS backup
FROM ensino.frequencia_aluno fa
INNER JOIN ensino.turma t ON t.id_turma = fa.id_turma
WHERE fa.id_turma = 830012
  AND t.id_turma_serie = 95789029
  AND t.ano = 2026
  group by fa.id_turma ;


SELECT  'UPDATE ensino.frequencia_aluno SET id_turma=853602 WHERE id_frequencia=189887364;'
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON fa.id_turma = t.id_turma
WHERE  t.id_turma_serie  = 95789029
AND t.ano = 2026;

SELECT t.*
from ensino.turma t
WHERE  t.id_turma_serie = 95789029;


SELECT t.*
FROM ensino.matricula_componente mc, 
ensino.turma t
WHERE mc.id_turma = t.id_turma
--AND mc.id_discente = 1407259
AND t.id_turma_serie = 95789029;


select * 
from ensino.matricula_componente mc 
where mc.id_turma in (830013, 830014, 830015, 830016, 830017, 830012);