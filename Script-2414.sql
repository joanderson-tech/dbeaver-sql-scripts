SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 51877790
AND ts.ano = 2026
AND ts.nome = 'EFAFV9G'


SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%EMEF SEVERINO MARINHEIRO%'



SELECT p.nome, u.login
FROM comum.usuario u
JOIN comum.pessoa p ON p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor
JOIN ensino.turma t ON t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.id_turma_serie = 52576525

BEGIN;

ROLLBACK ;

DROP TABLE dataHorario;

SELECT ht.*
INTO TEMP dataHorario
FROM ensino.horario_turma ht
JOIN ensino.turma t ON t.id_turma = ht.id_turma
WHERE t.id_turma_serie = 52576525
AND ht.ativo = FALSE;


-- Backup 
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;


--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-18', data_fim = '2026-12-15'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;



SELECT * FROM basico.calendario_escolar ce ;


2026-02-18 2026-12-23 2026-12-15




UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410877;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410880;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410885;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410867;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410872;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410873;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410883;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410865;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410869;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410870;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410874;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410879;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410884;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410881;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410886;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410888;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410860;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410875;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410878;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410889;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410890;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410859;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410861;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410864;
UPDATE ensino.horario_turma SET data_inicio = '2026-03-23', data_fim = '2026-12-15' WHERE id_horario_turma = 1410866;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410882;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410887;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410862;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410863;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410868;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410871;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1410876;

