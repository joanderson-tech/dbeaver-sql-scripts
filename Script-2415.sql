
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





