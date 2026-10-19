select * from comum.pessoa p where p.nome ilike '%RENEE%'


select * from basico.calendario_escolar ce ;

begin;

--DROP TABLE IF EXISTS dataHorario;

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




select distinct p.nome,
        u.login, t.id_turma, t.codigo 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.id_pessoa  =746898;