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