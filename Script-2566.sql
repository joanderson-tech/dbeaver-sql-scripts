BEGIN;

UPDATE ensino.horario_turma SET hora_fim='07:40:00',id_horario=51879752 WHERE id_horario_turma in (1405538, 1405539, 1405540, 1405541, 1405542);
UPDATE ensino.horario_turma SET hora_inicio='07:40:00', hora_fim='08:20:00',id_horario=51879753 WHERE id_horario_turma in (1405543, 1405544, 1405545, 1405546, 1405547);
UPDATE ensino.horario_turma SET hora_inicio='08:20:00', hora_fim='09:00:00',id_horario=51879754 WHERE id_horario_turma in (1405548, 1405549, 1405550, 1405551, 1405552);
UPDATE ensino.horario_turma SET hora_inicio='09:15:00', hora_fim='09:55:00',id_horario=51879755 WHERE id_horario_turma in (1405553, 1405554, 1405555, 1405556, 1405557);
UPDATE ensino.horario_turma SET hora_inicio='09:55:00', hora_fim='10:35:00',id_horario=51879756 WHERE id_horario_turma in (1405558, 1405559, 1405560, 1405561, 1405562);
-- Insert Horários e Backup

WITH inseridos AS (
    INSERT INTO ensino.horario_turma (
        id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, 
        data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, 
        data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, 
        id_registro_atualizacao, data_atualizacao, tipo_alteracao
    )
    VALUES
        (nextval('ensino.horario_turma_seq'), 682169, 1, 51879757, '2', '10:35:00', '11:20:00', '2026-02-06', '2026-12-24', NULL, NULL, NULL, false, NULL, NOW(), NULL, (SELECT re.id_entrada FROM comum.registro_entrada re WHERE id_usuario = 1 ORDER BY 1 DESC LIMIT 1), NULL, NULL, 1),
        (nextval('ensino.horario_turma_seq'), 682173, 1, 51879757, '3', '10:35:00', '11:20:00', '2026-02-06', '2026-12-24', NULL, NULL, NULL, false, NULL, NOW(), NULL, (SELECT re.id_entrada FROM comum.registro_entrada re WHERE id_usuario = 1 ORDER BY 1 DESC LIMIT 1), NULL, NULL, 1),
        (nextval('ensino.horario_turma_seq'), 682168, 1, 51879757, '4', '10:35:00', '11:20:00', '2026-02-06', '2026-12-24', NULL, NULL, NULL, false, NULL, NOW(), NULL, (SELECT re.id_entrada FROM comum.registro_entrada re WHERE id_usuario = 1 ORDER BY 1 DESC LIMIT 1), NULL, NULL, 1),
        (nextval('ensino.horario_turma_seq'), 682176, 1, 51879757, '5', '10:35:00', '11:20:00', '2026-02-06', '2026-12-24', NULL, NULL, NULL, false, NULL, NOW(), NULL, (SELECT re.id_entrada FROM comum.registro_entrada re WHERE id_usuario = 1 ORDER BY 1 DESC LIMIT 1), NULL, NULL, 1),
        (nextval('ensino.horario_turma_seq'), 682174, 1, 51879757, '6', '10:35:00', '11:20:00', '2026-02-06', '2026-12-24', NULL, NULL, NULL, false, NULL, NOW(), NULL, (SELECT re.id_entrada FROM comum.registro_entrada re WHERE id_usuario = 1 ORDER BY 1 DESC LIMIT 1), NULL, NULL, 1)
    RETURNING id_horario_turma
)
SELECT 'DELETE FROM ensino.horario_turma WHERE id_horario_turma IN (' || string_agg(id_horario_turma::text, ', ') || ');' AS script_de_rollback
FROM inseridos;


COMMIT;

DELETE FROM ensino.horario_turma WHERE id_horario_turma IN (1405564, 1405565, 1405566, 1405567, 1405568);