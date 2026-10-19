BEGIN;

ROLLBACK;

DROP TABLE dataHorario;

SELECT *
--NTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 690516;
AND ht.dia = ('2', '3')
AND ht.ativo = FALSE;
-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    'dia = ' || COALESCE('''' || h.dia || '''', 'NULL') || ', ' ||
    'data_alteracao = ' || COALESCE('''' || h.data_alteracao || '''', 'NULL') ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;
--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET
    dia = CASE
				WHEN dh.dia = '2' THEN '5'
WHEN dh.dia = '3' THEN '5'
WHEN dh.dia = '5' THEN dh.dia
ELSE ht.dia
    END, data_inicio = '2025-05-27', data_fim = '2025-05-27', data_alteracao = '2025-05-28 00:00:00.000'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

COMMIT;

DROP TABLE dataHorario;

SELECT *
--INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 690516;
AND ht.dia IN ('2', '3')
AND ht.ativo = FALSE;
-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    'dia = ' || COALESCE('''' || h.dia || '''', 'NULL') || ', ' ||
    'data_alteracao = ' || COALESCE('''' || h.data_alteracao || '''', 'NULL') ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;
--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET
    dia = CASE
				WHEN dh.dia = '2' THEN dh.dia
WHEN dh.dia = '3' THEN dh.dia
ELSE ht.dia
    END, data_inicio = '2025-05-27', data_fim = '2025-05-27', data_alteracao = '2025-05-28 00:00:00.000'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

COMMIT;

SELECT *
--INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 690516;
AND ht.ativo = FALSE;

UPDATE ensino.horario_turma
SET
data_inicio = '2025-05-27', data_fim = '2025-12-18'
WHERE id_horario_turma IN (1420650, 1420651, 1420655, 1420656);

UPDATE ensino.horario_turma
SET
data_inicio = NULL, data_fim = NULL
WHERE id_horario_turma IN (1420650, 1420651, 1420655, 1420656);
-- Auto-generated SQL script #202601020906


UPDATE ensino.horario_turma
SET
ativo = TRUE
WHERE id_horario_turma IN (1420651, 1420656);

UPDATE ensino.horario_turma
SET
data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54'
WHERE id_horario_turma = 1418565;

UPDATE ensino.horario_turma
SET
data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54'
WHERE id_horario_turma = 1418570;

UPDATE ensino.horario_turma
SET
data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL
WHERE id_horario_turma = 1418635;

UPDATE ensino.horario_turma
SET
data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54'
WHERE id_horario_turma = 1418575;

UPDATE ensino.horario_turma
SET
data_inicio = '2025-05-14', data_fim = '2025-05-26', dia = '5', data_alteracao = '2025-05-26 12:09:54'
WHERE id_horario_turma = 1418580;

UPDATE ensino.horario_turma
SET
data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL
WHERE id_horario_turma = 1418640;

UPDATE ensino.horario_turma
SET
data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL
WHERE id_horario_turma = 1418645;

UPDATE ensino.horario_turma
SET
data_inicio = NULL, data_fim = NULL, dia = '5', data_alteracao = NULL
WHERE id_horario_turma = 1418650;

SELECT to_char(f.data, 'YYYY-MM-DD') AS data_aula
FROM ensino.frequencia_aluno f
JOIN ensino.turma t ON
t.id_turma = f.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
AND mes.id_estudante = f.id_discente
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10, 6 )
WHERE f.ativo = TRUE
AND f.id_turma = 690516
GROUP BY data_aula
ORDER BY data_aula;

SELECT DISTINCT rfs.*
FROM ensino.registro_falta_professor rfs
JOIN ensino.docente_turma dt ON
(dt.id_docente_turma = rfs.id_docente_turma)
WHERE dt.ativo IS TRUE
AND rfs.ativo IS TRUE
AND dt.id_turma IN (690516);


-- Auto-generated SQL script #202601021011
UPDATE ensino.registro_falta_professor
	SET ativo=TRUE
	WHERE id_registro_falta_professor IN (12378,12379,12380);

