 BEGIN;
 
SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 690516
AND ht.ativo = FALSE;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    'dia = ' || COALESCE('''' || h.dia || '''', 'NULL') || ', ' ||
    'data_alteracao = ' || COALESCE('''' || h.data_alteracao || '''', 'NULL') ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET
    dia = CASE
				WHEN dh.dia = '2' THEN '5'
				WHEN dh.dia = '3' THEN '5'
				WHEN dh.dia = '5' THEN dh.dia
ELSE ht.dia
    END, data_inicio = '2025-02-10', data_fim = '2025-05-27', data_alteracao = '2025-05-28 00:00:00.000'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;


COMMIT;



UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL, dia = '3', data_alteracao = NULL WHERE id_horario_turma = 1420016;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-10-06', dia = '2', data_alteracao = '2025-10-06 09:25:20' WHERE id_horario_turma = 1420020;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54' WHERE id_horario_turma = 1418565;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL WHERE id_horario_turma = 1418635;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54' WHERE id_horario_turma = 1418570;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL WHERE id_horario_turma = 1418640;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54' WHERE id_horario_turma = 1418575;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54' WHERE id_horario_turma = 1418580;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL WHERE id_horario_turma = 1418645;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL WHERE id_horario_turma = 1418650;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL, dia = '3', data_alteracao = NULL WHERE id_horario_turma = 1420011;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-10-06', dia = '2', data_alteracao = '2025-10-06 09:25:20' WHERE id_horario_turma = 1420025;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-10-06', dia = '2', data_alteracao = '2025-10-06 11:07:40' WHERE id_horario_turma = 1420115;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-10-06', dia = '3', data_alteracao = '2025-10-06 11:07:40' WHERE id_horario_turma = 1420116;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-10-06', dia = '2', data_alteracao = '2025-10-06 11:07:40' WHERE id_horario_turma = 1420110;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-10-06', dia = '3', data_alteracao = '2025-10-06 11:07:40' WHERE id_horario_turma = 1420111;