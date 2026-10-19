--##SOLIÇÃO TURMA: 6º Ano - EFAFINT6A / INTEGRAL
--MUDA O HORARIO DA TURMA 
BEGIN;

ROLLBACK;

SELECT *
--INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 700577;
/*
AND ht.ativo = FALSE
AND ht.dia IN ('4', '3', '5', '2')
AND ht.data_alteracao <= '2025-07-31 10:44:08.000';


*/

SELECT * FROM basico.calendario_escolar ce ;

COMMIT;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h
where h.ativo = FALSE ;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-03-02', data_fim = '2026-12-22' --2026-03-18
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo = FALSE ;


-- CONSULTA PARA VALIDAR AS MUDANÇAS E VERIFICAR CONFLITOS DAS FREQUENCIAS
WITH calculo_datas AS (
    SELECT 
        fa.id_frequencia,
        fa.id_discente,
        fa.data AS data_original,
        CASE 
            -- REGRA 1: Até 14/05 (Quarta -> Terça) : -1 dia
            WHEN fa.data <= '2025-05-14' AND EXTRACT(ISODOW FROM fa.data) = 3 
                THEN fa.data - INTERVAL '1 day'
            -- REGRA 2: 19/05 a 29/07 (Segunda -> Terça ou Quarta -> Quinta) : +1 dia
            WHEN fa.data BETWEEN '2025-05-19' AND '2025-07-29' AND EXTRACT(ISODOW FROM fa.data) IN (1, 3)
                THEN fa.data + INTERVAL '1 day'
            ELSE fa.data
        END::date AS data_nova
    FROM ensino.frequencia_aluno fa
    WHERE fa.id_turma = 684340
)
SELECT 
    c.*,
    (SELECT TRUE FROM ensino.frequencia_aluno fa2 
     WHERE fa2.id_discente = c.id_discente 
       AND fa2.data = c.data_nova 
       AND fa2.id_turma = 684340 
       AND fa2.id_frequencia != c.id_frequencia) AS existe_conflito
       INTO TEMP mudarDiaFrequencia
FROM calculo_datas c
WHERE c.data_original != c.data_nova;

--BACKUP DAS DATAS
SELECT 'UPDATE ensino.frequencia_aluno	SET ' || '"data" = ' || COALESCE('''' || h.data_original || '''', 'NULL') || ' WHERE id_frequencia = ' || h.id_frequencia || ';' AS backup
FROM mudarDiaFrequencia h
where h.existe_conflito IS NOT true;

--ATUALIZA PARA AS NOVAS DATAS. 
UPDATE ensino.frequencia_aluno AS fa SET "data" = m.data_nova
FROM mudarDiaFrequencia m
WHERE fa.id_frequencia = m.id_frequencia
AND m.existe_conflito IS NOT TRUE;

COMMIT;


--##SOLIÇÃO TURMA: 6º Ano - EFAFINT6B / INTEGRAL
--MUDA O HORARIO DA TURMA 

DROP TABLE IF EXISTS dataHorario;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 684959
AND ht.ativo = FALSE
AND ht.dia IN ('4', '3', '5', '6')
AND ht.data_alteracao <= '2025-07-30 16:22:19.000';

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
       	WHEN dh.dia = '3' THEN '5'
				WHEN dh.dia = '4' THEN '6'
				WHEN dh.dia = '5' THEN dh.dia
				WHEN dh.dia = '6' THEN dh.dia
ELSE ht.dia
    END, data_inicio = '2025-03-23', data_fim = '2025-07-31', data_alteracao = CURRENT_DATE
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

DROP TABLE IF EXISTS mudarDiaFrequencia;

-- CONSULTA PARA VALIDAR AS MUDANÇAS E VERIFICAR CONFLITOS JOGA NA TABELA TEMPORARIA 
WITH calculo_datas AS (
    SELECT 
        fa.id_frequencia,
        fa.id_discente,
        fa.data AS data_original,
        CASE 
            -- REGRA: De 09/05 a 31/07
            -- Somente Quarta (3) vira Sexta (5): Soma-se 2 dias.
            WHEN fa.data BETWEEN '2025-05-09' AND '2025-07-31' 
                 AND EXTRACT(ISODOW FROM fa.data) = 3 
                THEN (fa.data + INTERVAL '2 days')::date
            ELSE fa.data
        END::date AS data_nova
    FROM ensino.frequencia_aluno fa
    WHERE fa.id_turma = 684959
)
SELECT 
    c.*,
    (SELECT TRUE FROM ensino.frequencia_aluno fa2 
     WHERE fa2.id_discente = c.id_discente 
       AND fa2.data = c.data_nova 
       AND fa2.id_turma = 684959 
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


--##SOLIÇÃO TURMA: 7º Ano - EFAFINT7A / INTEGRAL  ALGUNS DIAS ESTÃO SEM FREQUENCIA.
--MUDA O HORARIO DA TURMA 

DROP TABLE IF EXISTS dataHorario;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 684811
AND ht.ativo = FALSE
AND ht.data_alteracao <= '2025-07-30 16:48:49.000';


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
       	WHEN dh.dia = '3' THEN '5'
				WHEN dh.dia = '4' THEN '2'
				WHEN dh.dia = '2' THEN dh.dia
				WHEN dh.dia = '5' THEN dh.dia
				WHEN dh.dia = '6' THEN dh.dia
ELSE ht.dia
    END, data_inicio = '2025-03-10', data_fim = '2025-07-30', data_alteracao = CURRENT_DATE
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

DROP TABLE IF EXISTS mudarDiaFrequencia;

-- CONSULTA PARA VALIDAR AS MUDANÇAS E VERIFICAR CONFLITOS
WITH calculo_datas AS (
    SELECT 
        fa.id_frequencia,
        fa.id_discente,
        fa.data AS data_original,
        CASE 
 	 					-- REGRA 1: 12/03 a 15/05 (Quarta vira Segunda)
            -- Quarta (3) - 2 dias = Segunda (2)
            WHEN fa.data BETWEEN '2025-03-12' AND '2025-05-15' 
                 AND EXTRACT(ISODOW FROM fa.data) = 3 
                THEN (fa.data - INTERVAL '2 days')::date
            -- REGRA 2: 20/05 a 30/07 (Terça vira Quinta)
            -- Terça (2) + 2 dias = Quinta (4)
            WHEN fa.data BETWEEN '2025-05-20' AND '2025-07-30' 
                 AND EXTRACT(ISODOW FROM fa.data) = 2 
                THEN (fa.data + INTERVAL '2 days')::date
            ELSE fa.data
        END::date AS data_nova
    FROM ensino.frequencia_aluno fa
    WHERE fa.id_turma = 684811
)
SELECT 
    c.*,
    (SELECT TRUE FROM ensino.frequencia_aluno fa2 
     WHERE fa2.id_discente = c.id_discente 
       AND fa2.data = c.data_nova 
       AND fa2.id_turma = 684811 
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


--##SOLIÇÃO TURMA: 7º Ano - EFAFINT7B / INTEGRAL  ALGUNS DIAS ESTÃO SEM FREQUENCIA.
--MUDA O HORARIO DA TURMA 

DROP TABLE IF EXISTS dataHorario;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 684987
AND ht.ativo = FALSE
AND ht.data_alteracao <= '2025-07-31 10:48:08.000';

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
        WHEN dh.dia = '4' THEN '3'
				WHEN dh.dia = '2' THEN dh.dia
				WHEN dh.dia = '3' THEN dh.dia
				WHEN dh.dia = '6' THEN dh.dia
ELSE ht.dia
    END, data_inicio = '2025-03-10', data_fim = '2025-07-31', data_alteracao = CURRENT_DATE
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

DROP TABLE IF EXISTS mudarDiaFrequencia;

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