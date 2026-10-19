BEGIN;

-- Gerando backup
SELECT 
    'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (' ||
    COALESCE(ht.id_horario_turma::text, 'NULL') || ', ' || 
    COALESCE(ht.id_turma::text, 'NULL') || ', ' || 
    COALESCE(ht.tipo::text, 'NULL') || ', ' || 
    COALESCE(ht.id_horario::text, 'NULL') || ', ' || 
    COALESCE('''' || ht.dia || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.hora_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.hora_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.data_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.data_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.codmergpa || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.codmergpapos || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.codmerg || '''', 'NULL') || ', ' || 
    COALESCE(ht.ativo::text, 'NULL') || ', ' || 
    COALESCE('''' || ht.data_alteracao || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.data_cadastro || '''', 'NULL') || ', ' || 
    COALESCE('''' || ht.altaracao_horario || '''', 'NULL') || ', ' || 
    COALESCE(ht.id_registro_entrada::text, 'NULL') || ', ' ||
    COALESCE(ht.id_registro_atualizacao::text, 'NULL') || ');' AS backup
FROM ensino.horario_turma ht
WHERE ht.id_turma = 714514 AND ht.ativo = FALSE;

-- Apagando registros inativos
DELETE FROM ensino.horario_turma ht WHERE ht.id_turma = 714514 AND ht.ativo = FALSE;

-- Ajustando data inicial e final da turma
UPDATE ensino.horario_turma ht
SET
    data_inicio = '2026-02-05',
    data_fim = '2026-12-19',
    hora_inicio = h.inicio,
    hora_fim = h.fim
FROM ensino.horario h 
WHERE ht.id_horario = h.id_horario 
  AND ht.id_turma = 714514 
  AND ht.ativo = true;

COMMIT;








INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500121, 714514, 1, 127251, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500111, 714514, 1, 127249, '2', '13:00:00', '13:50:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500112, 714514, 1, 127249, '3', '13:00:00', '13:50:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500113, 714514, 1, 127249, '4', '13:00:00', '13:50:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500114, 714514, 1, 127249, '5', '13:00:00', '13:50:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500115, 714514, 1, 127249, '6', '13:00:00', '13:50:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500116, 714514, 1, 127250, '2', '13:50:00', '14:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500117, 714514, 1, 127250, '3', '13:50:00', '14:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500118, 714514, 1, 127250, '4', '13:50:00', '14:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500119, 714514, 1, 127250, '5', '13:50:00', '14:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500120, 714514, 1, 127250, '6', '13:50:00', '14:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500122, 714514, 1, 127251, '3', '14:40:00', '15:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500123, 714514, 1, 127251, '4', '14:40:00', '15:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500124, 714514, 1, 127251, '5', '14:40:00', '15:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500125, 714514, 1, 127251, '6', '14:40:00', '15:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500126, 714514, 1, 127252, '2', '15:50:00', '16:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500127, 714514, 1, 127252, '3', '15:50:00', '16:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500128, 714514, 1, 127252, '4', '15:50:00', '16:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500129, 714514, 1, 127252, '5', '15:50:00', '16:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500130, 714514, 1, 127252, '6', '15:50:00', '16:40:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500131, 714514, 1, 127253, '2', '16:40:00', '17:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500132, 714514, 1, 127253, '3', '16:40:00', '17:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500133, 714514, 1, 127253, '4', '16:40:00', '17:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500134, 714514, 1, 127253, '5', '16:40:00', '17:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);
INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada, id_registro_atualizacao) VALUES (1500135, 714514, 1, 127253, '6', '16:40:00', '17:30:00', '2026-02-12', '2026-02-23', NULL, NULL, NULL, false, '2026-02-23 14:18:46', NULL, NULL, 6026536, NULL);


