BEGIN;

ROLLBACK;

SELECT h.*
FROM ensino.horario h
JOIN comum.unidade u ON
u.id_unidade = h.id_unidade
JOIN ensino.turno t ON
t.id_turno = h.tipo
LEFT JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = h.id_etapa_ensino
WHERE h.ativo
AND h.id_unidade = 5873
ORDER BY u.nome, h.ano_entrada_vigor DESC, ee.denominacao, t.descricao, h.ordem;

--PASSO 01
UPDATE ensino.horario SET inicio = '07:00:00', fim = '07:30:00', ordem = 1, tipo = 2 WHERE id_horario = 51905313;
UPDATE ensino.horario SET inicio = '07:30:00', fim = '08:10:00', ordem = 2, tipo = 2 WHERE id_horario = 51908368;
UPDATE ensino.horario SET inicio = '08:10:00', fim = '08:50:00', ordem = 3, tipo = 2 WHERE id_horario = 51908369;
UPDATE ensino.horario SET inicio = '08:50:00', fim = '09:30:00', ordem = 4, tipo = 2 WHERE id_horario = 51908370;
UPDATE ensino.horario SET inicio = '13:00:00', fim = '13:40:00', ordem = 1, tipo = 4 WHERE id_horario = 51908494;
UPDATE ensino.horario SET inicio = '13:40:00', fim = '14:20:00', ordem = 2, tipo = 4 WHERE id_horario = 51908496;
UPDATE ensino.horario SET inicio = '14:20:00', fim = '15:00:00', ordem = 3, tipo = 4 WHERE id_horario = 51908497;
UPDATE ensino.horario SET inicio = '15:00:00', fim = '15:40:00', ordem = 4, tipo = 4 WHERE id_horario = 51908499;
UPDATE ensino.horario SET inicio = '15:40:00', fim = '16:20:00', ordem = 5, tipo = 4 WHERE id_horario = 51908500;

--PASSO 02 INSERTS FALTANTES (3 horários)
INSERT INTO ensino.horario
(id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES
(nextval('public.hibernate_sequence'), '09:30:00', 5873, '10:10:00', TRUE, 'B', 2, 5, 14, 2025),
(nextval('public.hibernate_sequence'), '10:10:00', 5873, '10:50:00', TRUE, 'B', 2, 6, 14, 2025),
(nextval('public.hibernate_sequence'), '16:20:00', 5873, '17:00:00', TRUE, 'B', 4, 6, 14, 2025);

--PASSO 03 backup dos novos horarios
SELECT 'DELETE FROM ensino.horario WHERE id_horario = ' || id_horario || ';'
FROM ensino.horario
WHERE id_unidade = 5873
AND ano_entrada_vigor = 2025
AND (     (inicio = '09:30:00' AND fim = '10:10:00')
OR        (inicio = '10:10:00' AND fim = '10:50:00')
OR        (inicio = '16:20:00' AND fim = '17:00:00'));



UPDATE ensino.horario SET inicio = '07:00:00', fim = '08:00:00', ordem = 1, tipo = 2 WHERE id_horario = 51905313;
UPDATE ensino.horario SET inicio = '08:00:00', fim = '09:00:00', ordem = 2, tipo = 2 WHERE id_horario = 51908368;
UPDATE ensino.horario SET inicio = '09:00:00', fim = '10:00:00', ordem = 3, tipo = 2 WHERE id_horario = 51908369;
UPDATE ensino.horario SET inicio = '10:00:00', fim = '10:50:00', ordem = 4, tipo = 2 WHERE id_horario = 51908370;
UPDATE ensino.horario SET inicio = '13:00:00', fim = '13:50:00', ordem = 1, tipo = 4 WHERE id_horario = 51908494;
UPDATE ensino.horario SET inicio = '13:50:00', fim = '14:40:00', ordem = 2, tipo = 4 WHERE id_horario = 51908496;
UPDATE ensino.horario SET inicio = '14:40:00', fim = '15:30:00', ordem = 3, tipo = 4 WHERE id_horario = 51908497;
UPDATE ensino.horario SET inicio = '15:30:00', fim = '16:20:00', ordem = 4, tipo = 4 WHERE id_horario = 51908499;
UPDATE ensino.horario SET inicio = '16:20:00', fim = '17:10:00', ordem = 5, tipo = 4 WHERE id_horario = 51908500;





BEGIN;
ROLLBACK;

--PASSO 01
CREATE TABLE ensino.horario_bkp_20251007 AS
SELECT *
FROM ensino.horario
WHERE id_unidade = 5873;

-- PASSO 02 backup os horarios existentes
SELECT 'UPDATE ensino.horario SET '
    || 'inicio = ''' || bk.inicio || ''', '
    || 'fim = ''' || bk.fim || ''', '
    || 'ordem = ' || bk.ordem || ', '
    || 'tipo = ' || bk.tipo || ' '
    || 'WHERE id_horario = ' || bk.id_horario || ';'
FROM ensino.horario_bkp_20251007 bk;

COMMIT;

ROLLBACK ;