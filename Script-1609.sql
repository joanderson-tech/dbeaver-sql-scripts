SELECT *
--INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 746394;
--746339

SELECT *
FROM ensino.horario_turma ht
WHERE id_horario_turma IN (1632758, 1632763, 1647427, 1647432);