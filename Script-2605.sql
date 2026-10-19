BEGIN;

SELECT ht.*
INTO TEMP dataHorario
FROM ensino.horario_turma ht
JOIN ensino.turma t ON t.id_turma = ht.id_turma
WHERE t.id_turma IN (695861, 695835);

-- Backup da data_inicio e data_fim 
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h
where h.ativo;

--ATUALIZA data_inicio e data_fim 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-06', data_fim = '2026-12-24'
FROM dataHorario h
WHERE ht.id_horario_turma = h.id_horario_turma
AND h.ativo;

-- Backup das data alteração
SELECT 'UPDATE ensino.horario_turma SET ' ||
       ' data_alteracao = ' || COALESCE('''' || h.data_alteracao || '''', 'NULL') ||
       ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h
WHERE h.ativo = FALSE;

--Solução remove a data alteração
UPDATE ensino.horario_turma AS ht
SET data_alteracao = null
FROM dataHorario h
WHERE ht.id_horario_turma = h.id_horario_turma
and h.ativo = FALSE;

--ROLLBACK ;
COMMIT;



UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441463;
UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441471;
UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441472;
UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441476;
UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441480;
UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441481;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1441420;
UPDATE ensino.horario_turma SET data_inicio = '2026-04-30', data_fim = '2026-12-24' WHERE id_horario_turma = 1441421;

UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:27:51' WHERE id_horario_turma = 1428681;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:27:51' WHERE id_horario_turma = 1428689;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:27:51' WHERE id_horario_turma = 1428690;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:27:51' WHERE id_horario_turma = 1428694;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:27:51' WHERE id_horario_turma = 1428698;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:27:51' WHERE id_horario_turma = 1428699;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-02-26 09:41:59' WHERE id_horario_turma = 1428772;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-02-26 11:00:53' WHERE id_horario_turma = 1428849;
UPDATE ensino.horario_turma SET  data_alteracao = '2026-04-30 11:26:56' WHERE id_horario_turma = 1429161;