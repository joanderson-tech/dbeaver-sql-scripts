BEGIN;

SELECT ht.*
INTO TEMP dataHorario
FROM ensino.horario_turma ht
JOIN ensino.turma t ON t.id_turma = ht.id_turma
WHERE t.id_turma_serie = 52576525
AND ht.ativo;

-- Backup 
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA data_inicio e data_fim 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-18', data_fim = '2026-12-15'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

--backup
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
JOIN ensino.turma t ON t.id_turma = h.id_turma
WHERE t.id_turma_serie = 52576525
  AND h.ativo = FALSE;

-- solução 
DELETE FROM ensino.horario_turma 
WHERE id_horario_turma IN (
    SELECT h.id_horario_turma
    FROM ensino.horario_turma h
    JOIN ensino.turma t ON t.id_turma = h.id_turma
    WHERE t.id_turma_serie = 52576525
      AND h.ativo = FALSE
);


COMMIT;



UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410877;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410880;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410885;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410867;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410872;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410873;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410883;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410865;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410869;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410870;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410874;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410879;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410884;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410881;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410886;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410888;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410860;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410875;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410878;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410889;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410890;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410859;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410861;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410864;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410866;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410882;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410887;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410862;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410863;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410868;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410871;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410876;



INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410467, 687271, 1, 51881764, '5', '15:15:00', '15:55:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410470, 687271, 1, 51881765, '3', '15:55:00', '16:35:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410475, 687271, 1, 51881766, '3', '16:35:00', '17:15:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410462, 687272, 1, 51881763, '5', '14:20:00', '15:00:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410457, 687272, 1, 51881762, '5', '13:40:00', '14:20:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410463, 687272, 1, 51881763, '6', '14:20:00', '15:00:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410473, 687272, 1, 51881765, '6', '15:55:00', '16:35:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410455, 687273, 1, 51881762, '3', '13:40:00', '14:20:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410459, 687273, 1, 51881763, '2', '14:20:00', '15:00:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410460, 687273, 1, 51881763, '3', '14:20:00', '15:00:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410464, 687273, 1, 51881764, '2', '15:15:00', '15:55:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410469, 687274, 1, 51881765, '2', '15:55:00', '16:35:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410474, 687274, 1, 51881766, '2', '16:35:00', '17:15:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410471, 687275, 1, 51881765, '4', '15:55:00', '16:35:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410476, 687276, 1, 51881766, '4', '16:35:00', '17:15:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410478, 687276, 1, 51881766, '6', '16:35:00', '17:15:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410456, 687277, 1, 51881762, '4', '13:40:00', '14:20:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410465, 687279, 1, 51881764, '3', '15:15:00', '15:55:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410468, 687278, 1, 51881764, '6', '15:15:00', '15:55:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410479, 687278, 1, 51881759, '6', '09:55:00', '10:35:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410480, 687278, 1, 51881760, '6', '10:35:00', '11:15:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410450, 687269, 1, 51881761, '3', NULL, NULL, NULL, NULL, false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410449, 687269, 1, 51881761, '2', '13:00:00', '13:40:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410451, 687269, 1, 51881761, '4', '13:00:00', '13:40:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410454, 687269, 1, 51881762, '2', '13:40:00', '14:20:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410472, 687269, 1, 51881765, '5', '15:55:00', '16:35:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410477, 687269, 1, 51881766, '5', '16:35:00', '17:15:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410452, 687270, 1, 51881761, '5', '13:00:00', '13:40:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410453, 687270, 1, 51881761, '6', '13:00:00', '13:40:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410458, 687270, 1, 51881762, '6', '13:40:00', '14:20:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410461, 687270, 1, 51881763, '4', '14:20:00', '15:00:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, ativo, id_registro_entrada, id_registro_atualizacao) VALUES (1410466, 687270, 1, 51881764, '4', '15:15:00', '15:55:00', '2026-03-17', '2026-03-23', false, 5800079, NULL);

