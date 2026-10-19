BEGIN;

SELECT  ht.*
INTO TEMP dataHorario
FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE ts.id_turma_serie IN (52572059)
AND ht.ativo;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    'data_alteracao = ' || COALESCE('''' || h.data_alteracao || '''', 'NULL') ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

ROLLBACK;