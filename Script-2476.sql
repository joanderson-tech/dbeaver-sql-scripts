begin;

SELECT  ht.*
INTO TEMP dataHorario
FROM ensino.horario_turma ht
JOIN ensino.turma t ON t.id_turma = ht.id_turma
WHERE t.id_turma in  (715684)
AND ht.ativo = false;

-- Backup 
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_alteracao = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA data_inicio e data_fim 
UPDATE ensino.horario_turma AS ht
SET data_alteracao = null
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

commit;
rollback;


UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499599;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499600;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499601;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499602;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499603;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499604;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499605;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499606;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499607;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499608;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499609;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499610;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499586;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499587;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499588;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499589;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499590;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499591;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499592;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499593;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499594;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499595;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499596;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499597;
UPDATE ensino.horario_turma SET data_alteracao = '2026-02-12' WHERE id_horario_turma = 1499598;