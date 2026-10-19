SELECT 
    'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (' 
    || h.id_horario_turma || ', '
    || h.id_turma || ', '
    || COALESCE(h.tipo::text, 'NULL') || ', '
    || COALESCE(h.id_horario::text, 'NULL') || ', '
    || COALESCE('''' || h.dia || '''', 'NULL') || ', '
    || COALESCE('''' || h.hora_inicio || '''', 'NULL') || ', '
    || COALESCE('''' || h.hora_fim || '''', 'NULL') || ', '
    || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', '
    || COALESCE('''' || h.data_fim || '''', 'NULL') || ', '
    || h.ativo || ', '
    || COALESCE(h.id_registro_entrada::text, 'NULL') || ', '
    || COALESCE(h.id_registro_atualizacao::text, 'NULL') || 
    ');' AS script_insert_backup
FROM ensino.horario_turma h
WHERE h.id_turma IN (749995, 750021, 750065, 749996, 750066) 
AND h.ativo = FALSE;


SELECT 'DELETE FROM ensino.horario_turma WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS script_delete_direto
FROM ensino.horario_turma h
WHERE h.id_turma IN (749995, 750021, 750065, 749996, 750066) 
AND h.ativo = FALSE;



######## EDUC-3600 ########
Erro ao executar: InvalidForeignKey('there is no unique constraint matching given keys for referenced table "turma"\n')

######## EDUC-3601 - Gustavo Barbosa ########
Erro ao executar: InFailedSqlTransaction('current transaction is aborted, commands ignored until end of transaction block\n')

######## EDUC-3607 ########
Erro ao executar: InFailedSqlTransaction('current transaction is aborted, commands ignored until end of transaction block\n')

######## EDUC-3828 ########
Erro ao executar: InFailedSqlTransaction('current transaction is aborted, commands ignored until end of transaction block\n')

######## EDUC-3880 - Eduardo Costa ########
Erro ao executar: InFailedSqlTransaction('current transaction is aborted, commands ignored until end of transaction block\n')

######## EDUC-3881 - Eduardo Costa ########
Erro ao executar: InFailedSqlTransaction('current transaction is aborted, commands ignored until end of transaction block\n')



DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641305;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641308;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641311;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630979;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630983;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630971;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630974;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630976;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641313;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641316;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631078;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631094;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631083;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631086;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631099;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641357;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641360;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641361;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641362;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641366;


DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641271;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630972;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1630977;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631008;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631014;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641265;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641266;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641278;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641283;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631013;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641418;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641423;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641427;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641430;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641432;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631193;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631232;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631224;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631229;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631237;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631186;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631191;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631198;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631240;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1631205;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641383;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641388;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641392;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641405;
DELETE FROM ensino.horario_turma WHERE id_horario_turma = 1641400;


INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641305, 749995, 1, 55507376, '5', '13:50:00', '14:40:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641308, 749995, 1, 55507380, '3', '14:40:00', '15:30:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641311, 749995, 1, 55507380, '6', '14:40:00', '15:30:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630979, 749995, 1, 55507365, '5', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630983, 749995, 1, 55507366, '4', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630971, 749995, 1, 55507363, '2', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630974, 749995, 1, 55507363, '5', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630976, 749995, 1, 55507365, '2', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641313, 749995, 1, 55507420, '3', '15:40:00', '16:30:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641316, 749995, 1, 55507420, '6', '15:40:00', '16:30:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641271, 749996, 1, 55507365, '6', NULL, NULL, NULL, '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630972, 749996, 1, 55507363, '3', '07:00:00', '07:50:00', '2026-02-05', '2026-05-04', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1630977, 749996, 1, 55507365, '3', '07:50:00', '08:40:00', '2026-02-05', '2026-05-04', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631008, 749996, 1, 55507373, '3', '13:00:00', '13:50:00', '2026-02-05', '2026-05-04', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631014, 749996, 1, 55507376, '5', '13:50:00', '14:40:00', '2026-02-05', '2026-05-04', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641265, 749996, 1, 55507363, '5', NULL, NULL, NULL, '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641266, 749996, 1, 55507363, '6', NULL, NULL, NULL, '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641278, 749996, 1, 55507367, '3', '09:40:00', '10:30:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641283, 749996, 1, 55507368, '3', '10:30:00', '11:20:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631013, 749996, 1, 55507376, '3', '13:50:00', '14:40:00', '2026-02-05', '2026-05-04', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631078, 750021, 1, 55507363, '4', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631094, 750021, 1, 55507367, '5', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631083, 750021, 1, 55507365, '4', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631086, 750021, 1, 55507366, '2', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631099, 750021, 1, 55507368, '5', NULL, NULL, '2026-02-05', '2026-05-14', false, 7030451, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641357, 750021, 1, 55507373, '2', '13:00:00', '13:50:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641360, 750021, 1, 55507373, '5', '13:00:00', '13:50:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641361, 750021, 1, 55507373, '6', '13:00:00', '13:50:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641362, 750021, 1, 55507376, '2', '13:50:00', '14:40:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641366, 750021, 1, 55507376, '6', '13:50:00', '14:40:00', '2026-02-05', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641418, 750065, 1, 55507373, '3', '13:00:00', '13:50:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641423, 750065, 1, 55507376, '3', '13:50:00', '14:40:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641427, 750065, 1, 55507380, '2', '14:40:00', '15:30:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641430, 750065, 1, 55507380, '5', '14:40:00', '15:30:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641432, 750065, 1, 55507420, '2', '15:40:00', '16:30:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631193, 750065, 1, 55507365, '2', '07:50:00', '08:40:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631232, 750065, 1, 55507420, '3', '15:40:00', '16:30:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631224, 750065, 1, 55507373, '5', '13:00:00', '13:50:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631229, 750065, 1, 55507376, '5', '13:50:00', '14:40:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631237, 750065, 1, 55507380, '3', '14:40:00', '15:30:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631186, 750066, 1, 55507363, '2', '07:00:00', '07:50:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631191, 750066, 1, 55507365, '2', '07:50:00', '08:40:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631198, 750066, 1, 55507366, '3', '08:40:00', '09:30:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631240, 750066, 1, 55507380, '5', '14:40:00', '15:30:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1631205, 750066, 1, 55507367, '5', '09:40:00', '10:30:00', '2026-02-05', '2026-05-04', false, 7030648, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641383, 750066, 1, 55507363, '5', NULL, NULL, NULL, '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641388, 750066, 1, 55507365, '3', '07:50:00', '08:40:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641392, 750066, 1, 55507366, '2', '08:40:00', '09:30:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641405, 750066, 1, 55507368, '5', '10:30:00', '11:20:00', '2026-05-04', '2026-05-14', false, 7103378, 7117445);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1641400, 750066, 1, 55507367, '5', NULL, NULL, NULL, '2026-05-14', false, 7103378, 7117445);