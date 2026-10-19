BEGIN;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 700577;

-- Backup Matrícula Componente
SELECT  'UPDATE ensino.horario_turma SET ' ||
    	'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    	'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    	' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h
where h.ativo = FALSE ;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-03-02', data_fim = '2026-03-18' 
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo = FALSE ;


-- Backup Matrícula Componente
SELECT  'UPDATE ensino.horario_turma SET ' ||
    	'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    	'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    	' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h
where h.ativo ;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-03-02', data_fim = '2026-12-22' 
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo ;

COMMIT;