--EFAFINT6A--684340

BEGIN;

ROLLBACK;

DROP TABLE IF EXISTS dataHorario;

SELECT  *
FROM ensino.horario_turma ht
WHERE ht.id_turma = 684987;
AND ht.data_alteracao <= '2025-05-15 22:18:52.000'
AND ht.dia IN ('2');

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 684987
AND ht.ativo = FALSE;
AND ht.dia IN ('2')
AND ht.data_alteracao <= '2025-05-15 22:18:52.000';

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 684987
AND ht.ativo = FALSE
AND ht.data_alteracao <= '2025-07-31 10:48:08.000';

SELECT * FROM dataHorario;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    'dia = ' || COALESCE('''' || h.dia || '''', 'NULL') || ', ' ||
    'data_alteracao = ' || COALESCE('''' || h.data_alteracao || '''', 'NULL') ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

UPDATE ensino.horario_turma AS ht
SET
    dia = CASE
        WHEN dh.dia = '4' THEN '3' -- Se for dia '4', muda para '5'
        WHEN dh.dia = '2' THEN dh.dia -- Se for dia '5', MANTÉM o valor '5' (apenas atualiza as datas abaixo)
        WHEN dh.dia = '3' THEN dh.dia -- Se for dia '6', MANTÉM o valor '6' (apenas atualiza as datas abaixo)
        WHEN dh.dia = '6' THEN dh.dia
        ELSE ht.dia
    END,
    data_inicio = '2025-03-10',
    data_fim = '2025-07-31',
    data_alteracao = CURRENT_DATE
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

COMMIT;

BEGIN;

ROLLBACK;


DROP TABLE mudarDiaFrequencia;

-- CONSULTA PARA VALIDAR AS MUDANÇAS E VERIFICAR CONFLITOS
WITH calculo_datas AS (
    SELECT 
        fa.id_frequencia,
        fa.id_discente,
        fa.data AS data_original,
        CASE 
 	 					-- REGRA: 12/03 a 15/05
            -- Quarta (3) vira Terça (2): Subtrai-se 1 dia.
            WHEN fa.data BETWEEN '2025-03-12' AND '2025-05-15' 
                 AND EXTRACT(ISODOW FROM fa.data) = 3 
                THEN (fa.data - INTERVAL '1 day')::date
            ELSE fa.data
        END::date AS data_nova
    FROM ensino.frequencia_aluno fa
    WHERE fa.id_turma = 684987
)
SELECT 
    c.*,
    (SELECT TRUE FROM ensino.frequencia_aluno fa2 
     WHERE fa2.id_discente = c.id_discente 
       AND fa2.data = c.data_nova 
       AND fa2.id_turma = 684987 
       AND fa2.id_frequencia != c.id_frequencia) AS existe_conflito
       INTO TEMP mudarDiaFrequencia
FROM calculo_datas c
WHERE c.data_original != c.data_nova;

--backup das datas
SELECT 'UPDATE ensino.frequencia_aluno	SET ' || '"data" = ' || COALESCE('''' || h.data_original || '''', 'NULL') || ' WHERE id_frequencia = ' || h.id_frequencia || ';' AS backup
FROM mudarDiaFrequencia h
where h.existe_conflito IS NOT true;

--Update 
UPDATE ensino.frequencia_aluno AS fa SET "data" = m.data_nova
FROM mudarDiaFrequencia m
WHERE fa.id_frequencia = m.id_frequencia
AND m.existe_conflito IS NOT TRUE;


COMMIT;

-- Auto-generated SQL script #202512191510
UPDATE ensino.horario_turma
	SET data_inicio='2025-03-10'
	WHERE id_horario_turma=1435795;

UPDATE ensino.horario_turma
	SET data_inicio='2025-07-31'
	WHERE id_horario_turma=1435795;



SELECT * FROM mudarDiaFrequencia WHERE existe_conflito = TRUE;


UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-16', dia = '3', data_alteracao = '2025-05-16 11:24:21' WHERE id_horario_turma = 1429572;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-16', data_fim = '2025-07-16', dia = '3', data_alteracao = '2025-07-16 13:59:25' WHERE id_horario_turma = 1430967;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-16', data_fim = '2025-07-16', dia = '3', data_alteracao = '2025-07-16 13:59:25' WHERE id_horario_turma = 1430972;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-16', data_fim = '2025-07-16', dia = '6', data_alteracao = '2025-07-16 13:59:25' WHERE id_horario_turma = 1430979;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-16', data_fim = '2025-07-16', dia = '6', data_alteracao = '2025-07-16 13:59:25' WHERE id_horario_turma = 1430984;
UPDATE ensino.horario_turma SET data_inicio = '2025-03-10', data_fim = '2025-03-23', dia = '6', data_alteracao = '2025-03-23 14:50:55' WHERE id_horario_turma = 1423111;
UPDATE ensino.horario_turma SET data_inicio = '2025-03-10', data_fim = '2025-03-23', dia = '6', data_alteracao = '2025-03-23 14:50:55' WHERE id_horario_turma = 1423114;
UPDATE ensino.horario_turma SET data_inicio = '2025-03-10', data_fim = '2025-03-23', dia = '4', data_alteracao = '2025-03-23 14:50:55' WHERE id_horario_turma = 1423115;
UPDATE ensino.horario_turma SET data_inicio = '2025-03-23', data_fim = '2025-05-14', dia = '4', data_alteracao = '2025-05-14 10:41:29' WHERE id_horario_turma = 1423533;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-05-14', dia = '6', data_alteracao = '2025-05-14 10:41:29' WHERE id_horario_turma = 1423534;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-05-14', dia = '6', data_alteracao = '2025-05-14 10:41:29' WHERE id_horario_turma = 1423537;
UPDATE ensino.horario_turma SET data_inicio = '2025-03-10', data_fim = '2025-03-23', dia = '4', data_alteracao = '2025-03-23 14:50:55' WHERE id_horario_turma = 1423133;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = '2025-05-14', dia = '4', data_alteracao = '2025-05-14 10:41:29' WHERE id_horario_turma = 1423555;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '3', data_alteracao = '2025-05-14 12:20:48' WHERE id_horario_turma = 1428889;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '3', data_alteracao = '2025-05-14 12:20:48' WHERE id_horario_turma = 1428894;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '6', data_alteracao = '2025-05-14 12:20:48' WHERE id_horario_turma = 1428902;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '6', data_alteracao = '2025-05-14 12:20:48' WHERE id_horario_turma = 1428907;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '3', data_alteracao = '2025-05-14 12:24:39' WHERE id_horario_turma = 1429527;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '3', data_alteracao = '2025-05-14 12:24:39' WHERE id_horario_turma = 1429532;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-16', dia = '3', data_alteracao = '2025-05-16 11:24:21' WHERE id_horario_turma = 1429567;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '6', data_alteracao = '2025-05-14 12:24:39' WHERE id_horario_turma = 1429540;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-14', dia = '6', data_alteracao = '2025-05-14 12:24:39' WHERE id_horario_turma = 1429545;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-16', dia = '6', data_alteracao = '2025-05-16 11:24:21' WHERE id_horario_turma = 1429580;
UPDATE ensino.horario_turma SET data_inicio = '2025-05-14', data_fim = '2025-05-16', dia = '6', data_alteracao = '2025-05-16 11:24:21' WHERE id_horario_turma = 1429585;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-16', data_fim = '2025-07-22', dia = '3', data_alteracao = '2025-07-22 16:41:41' WHERE id_horario_turma = 1433572;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-16', data_fim = '2025-07-22', dia = '3', data_alteracao = '2025-07-22 16:41:41' WHERE id_horario_turma = 1433577;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-16', data_fim = '2025-07-22', dia = '6', data_alteracao = '2025-07-22 16:41:41' WHERE id_horario_turma = 1433585;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-16', data_fim = '2025-07-22', dia = '6', data_alteracao = '2025-07-22 16:41:41' WHERE id_horario_turma = 1433589;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '3', data_alteracao = '2025-07-22 16:43:54' WHERE id_horario_turma = 1434008;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '3', data_alteracao = '2025-07-22 16:43:54' WHERE id_horario_turma = 1434013;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '6', data_alteracao = '2025-07-22 16:43:54' WHERE id_horario_turma = 1434021;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '6', data_alteracao = '2025-07-22 16:43:54' WHERE id_horario_turma = 1434025;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '3', data_alteracao = '2025-07-22 17:01:04' WHERE id_horario_turma = 1434048;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '3', data_alteracao = '2025-07-22 17:01:04' WHERE id_horario_turma = 1434053;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '6', data_alteracao = '2025-07-22 17:01:04' WHERE id_horario_turma = 1434061;
UPDATE ensino.horario_turma SET data_inicio = '2025-07-22', data_fim = '2025-07-22', dia = '6', data_alteracao = '2025-07-22 17:01:04' WHERE id_horario_turma = 1434065;


