BEGIN;

--EFAFV8D
UPDATE ensino.horario_turma
SET dia            = '5',  
    hora_inicio    = '16:35:00',
    hora_fim       = '17:15:00',
    data_fim       = '2026-03-24',
    data_alteracao = '2026-03-24 14:14:41.000'
WHERE id_horario_turma = 1410156;

UPDATE ensino.horario_turma
SET dia            = '4',  
    hora_inicio    = '16:35:00',
    hora_fim       = '17:15:00',
    data_fim       = '2026-03-24',
    data_alteracao = '2026-03-24 14:14:41.000'
WHERE id_horario_turma = 1410157; 

--EFAFV8E
UPDATE ensino.horario_turma
SET dia            = '5',
    hora_inicio    = '15:55:00',
    hora_fim       = '16:35:00',
    data_fim       = '2026-03-24',
    data_alteracao = '2026-03-24 14:22:57.000'
WHERE id_horario_turma = 1410183; 

UPDATE ensino.horario_turma
SET dia            = '4', 
    hora_inicio    = '15:55:00',
    hora_fim       = '16:35:00',
    data_fim       = '2026-03-24',
    data_alteracao = '2026-03-24 14:22:57.000'
WHERE id_horario_turma = 1410184; 


COMMIT;