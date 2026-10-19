SELECT mc.*
FROM ensino.matricula_componente mc, ensino.turma t
WHERE mc.id_turma = t.id_turma
AND mc.id_discente = 1407469;
AND t.id_turma_serie = 95789030;


SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante = 1407469;

SELECT *
FROM ensino.matricula_componente mc, ensino.turma t
WHERE mc.id_turma = t.id_turma
AND mc.id_discente = 1407285
AND t.id_turma_serie = 95789030;


select * from basico.registro_transferencia_entre_turmas where id_matricula_estudante_serie in (1593882, 1643669, 1588273)

