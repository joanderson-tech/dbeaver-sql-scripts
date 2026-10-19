--EFAFM6A,  EFAFM6B,  EFAFM7A,  EFAFM7B,  EFAFV7I,  EFAFM8A,  EFAFM8B,  EFAFV8D,  EFAFV8F,  EFAFM7C,  EFAFV7F
  52572046, 52572047, 52572054, 52572055, 52572062, 52572063, 52572064, 52572066, 52572068, 52572056, 52572059 

--EFAFM7A 
EFAFM7A 

BEGIN;

SELECT  ht.*
INTO TEMP dataHorario
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE ts.id_turma_serie IN (52572046, 52572047, 52572054, 52572055, 52572062, 52572063, 52572064, 52572066, 52572068, 52572056, 52572059 )
AND ht.ativo;

-- BACKUP
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-18', data_fim = '2026-12-15'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;


COMMIT;



SELECT * FROM basico.calendario_escolar ce 

2026-02-18

2026-12-15


UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409637;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409638;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409642;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409653;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409656;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409661;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409666;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409667;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409668;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409650;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409655;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409644;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409647;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409652;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409643;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409648;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409651;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409660;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409665;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409639;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409641;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409649;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409654;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409657;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409662;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409640;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409645;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409658;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409663;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409646;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409659;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-16', data_fim = '2026-12-15', data_alteracao = NULL WHERE id_horario_turma = 1409664;


