SELECT ht.*
FROM ensino.horario_turma ht
WHERE ht.id_turma IN (
    SELECT t.id_turma 
    FROM ensino.turma t 
    JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma 
    WHERE dt.id_docente = 712 AND t.ano = 2026
);


UPDATE ensino.horario_turma    SET data_fim='2026-12-31' WHERE id_horario_turma IN (1400875, 1400873, 1400874, 1400876, 1400872, 1400877, 1400878, 1400879, 1400880, 1400881, 1400885, 1400884, 1400883, 1400882, 1400886, 1400867, 1400868, 1400869, 1400870, 1400871);