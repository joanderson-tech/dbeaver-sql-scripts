BEGIN;

-- ## 01 SOLUÇÃO DO PROFESSOR horarioDesativado -- josivaneo1gomes@hotmail.com
SELECT  ht.*
INTO TEMP dataHorario
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84520999
AND ht.ativo;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04', data_fim = '2026-12-17'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

---#### horario Desativado

SELECT  ht.*
INTO TEMP horarioDesativado
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84520999
AND ht.ativo = false;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM horarioDesativado h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04'
FROM horarioDesativado dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

-- ## 02 SOLUÇÃO DO PROFESSOR horarioDesativado -- j.nilor@hotmail.com
SELECT  ht.*
INTO TEMP dataHorario1
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84521015
AND ht.ativo;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario1 h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04', data_fim = '2026-12-17'
FROM dataHorario1 dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

---#### horario Desativado
SELECT  ht.*
INTO TEMP horarioDesativado1
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84521015
AND ht.ativo = false;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM horarioDesativado1 h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04'
FROM horarioDesativado1 dh
WHERE ht.id_horario_turma = dh.id_horario_turma;


COMMIT;


