--## ELAINE ALVES PAIXÃO 6º Ano - EFAFM6A / MATUTINO
BEGIN;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 689400;

--BACKUP DOS HORARIO DESATIVADO
SELECT 
    'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES (' ||
    COALESCE(h.id_horario_turma::text, 'NULL') || ', ' || 
    COALESCE(h.id_turma::text, 'NULL') || ', ' || 
    COALESCE(h.tipo::text, 'NULL') || ', ' || 
    COALESCE(h.id_horario::text, 'NULL') || ', ' || 
    COALESCE('''' || h.dia || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpa || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpapos || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmerg || '''', 'NULL') || ', ' || 
    COALESCE(h.ativo::text, 'NULL') || ', ' || 
    COALESCE('''' || h.data_alteracao || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_cadastro || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.altaracao_horario || '''', 'NULL') || ', ' || 
    COALESCE(h.id_registro_entrada::text, 'NULL') || ');' AS backup_insert_script
FROM dataHorario h
WHERE h.ativo = FALSE;

--SOLUÇÃO APAGAR OS HORARIO DESATIVADO. 
DELETE FROM ensino.horario_turma WHERE id_horario_turma IN (SELECT h.id_horario_turma FROM dataHorario h WHERE h.ativo = FALSE);

--BACKUP DA DATA INICIO
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || dh.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || dh.id_horario_turma || ';' AS backup_script
FROM dataHorario dh
WHERE dh.ativo;

--SOLUÇÃO ALTERA A DATA INICIO PARA FICAR PADRÃO
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-19'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo;

COMMIT;