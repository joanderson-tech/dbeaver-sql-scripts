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
ORDER BY u.nome, h.ano_entrada_vigor DESC, ee.denominacao, t.descricao, h.ordem



-- Auto-generated SQL script #202510071551
UPDATE ensino.horario
SET
fim = '07:30:00'
WHERE id_horario = 51905313;

UPDATE ensino.horario
SET
inicio = '07:30:00', fim = '08:10:00'
WHERE id_horario = 51908368;

UPDATE ensino.horario
SET
inicio = '08:10:00', fim = '08:50:00'
WHERE id_horario = 51908369;

UPDATE ensino.horario
SET
inicio = '08:50:00', fim = '09:30:00'
WHERE id_horario = 51908370;

UPDATE ensino.horario
SET
inicio = '09:30:00', fim = '10:10:00'
WHERE id_horario = 51908494;
