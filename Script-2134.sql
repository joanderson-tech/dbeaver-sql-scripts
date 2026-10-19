BEGIN;

--## ELAINE ALVES PAIXÃO 6º Ano - EFAFM6A / MATUTINO
SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 689384;

--BACKUP DOS HORARIO DESATIVADO
SELECT 
    'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES (' ||
    COALESCE(h.id_horario_turma::text, 'NULL') || ', ' || 
    COALESCE(h.id_turma::text, 'NULL') || ', ' || 
    COALESCE(h.tipo::text, 'NULL') || ', ' || 
    COALESCE(h.id_horario::text, 'NULL') || ', ' || 
    COALESCE('''' || h.dia || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpa || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpapos || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmerg || '''', 'NULL') || ', ' || 
    COALESCE(h.ativo::text, 'NULL') || ', ' || 
    COALESCE('''' || h.data_alteracao || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_cadastro || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.altaracao_horario || '''', 'NULL') || ', ' || 
    COALESCE(h.id_registro_entrada::text, 'NULL') || ');' AS backup_insert_script
FROM dataHorario h
WHERE h.ativo = FALSE;

--SOLUÇÃO APAGAR OS HORARIO DESATIVADO. 
DELETE FROM ensino.horario_turma WHERE id_horario_turma IN (SELECT h.id_horario_turma FROM dataHorario h WHERE h.ativo = FALSE);

--BACKUP DA DATA INICIO
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || dh.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || dh.id_horario_turma || ';' AS backup_script
FROM dataHorario dh
WHERE dh.ativo;

--SOLUÇÃO ALTERA A DATA INICIO PARA FICAR PADRÃO
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-19'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo;

--Altera as datas que tinha lançamento Segunda, vira Terça E Quinta, vira Quarta
WITH calculo_datas AS (
    SELECT 
        fa.id_frequencia,
        fa.id_discente,
        fa.data AS data_original,
        CASE 
            WHEN fa.data BETWEEN '2026-02-01' AND '2026-03-31' 
                 AND EXTRACT(ISODOW FROM fa.data) = 1 
                THEN (fa.data + INTERVAL '1 day')::date
            WHEN fa.data BETWEEN '2026-02-01' AND '2026-03-31' 
                 AND EXTRACT(ISODOW FROM fa.data) = 4 
                THEN (fa.data - INTERVAL '1 day')::date
            ELSE fa.data
        END::date AS data_nova
    FROM ensino.frequencia_aluno fa
    WHERE fa.id_turma = 689384
)
SELECT 
    c.*,
    (SELECT TRUE FROM ensino.frequencia_aluno fa2 
     WHERE fa2.id_discente = c.id_discente 
       AND fa2.data = c.data_nova 
       AND fa2.id_turma = 689384 
       AND fa2.id_frequencia != c.id_frequencia) AS existe_conflito
INTO TEMP mudarDiaFrequencia
FROM calculo_datas c
WHERE c.data_original != c.data_nova;

--BACKUP DO lançamento Segunda, vira Terça E Quinta, vira Quarta
SELECT 'UPDATE ensino.frequencia_aluno	SET ' || '"data" = ' || COALESCE('''' || h.data_original || '''', 'NULL') || ' WHERE id_frequencia = ' || h.id_frequencia || ';' AS backup
FROM mudarDiaFrequencia h
where h.existe_conflito IS NOT true;

--ATUALIZA PARA AS NOVAS DATAS. 
UPDATE ensino.frequencia_aluno AS fa SET "data" = m.data_nova
FROM mudarDiaFrequencia m
WHERE fa.id_frequencia = m.id_frequencia
AND m.existe_conflito IS NOT TRUE;

---####ELAINE ALVES PAIXÃO 6º Ano - EFAFM6B / MATUTINO
DROP TABLE IF EXISTS dataHorario;
DROP TABLE IF EXISTS mudarDiaFrequencia;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 689394;

--BACKUP DOS HORARIO DESATIVADO
SELECT 
    'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES (' ||
    COALESCE(h.id_horario_turma::text, 'NULL') || ', ' || 
    COALESCE(h.id_turma::text, 'NULL') || ', ' || 
    COALESCE(h.tipo::text, 'NULL') || ', ' || 
    COALESCE(h.id_horario::text, 'NULL') || ', ' || 
    COALESCE('''' || h.dia || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpa || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpapos || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmerg || '''', 'NULL') || ', ' || 
    COALESCE(h.ativo::text, 'NULL') || ', ' || 
    COALESCE('''' || h.data_alteracao || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_cadastro || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.altaracao_horario || '''', 'NULL') || ', ' || 
    COALESCE(h.id_registro_entrada::text, 'NULL') || ');' AS backup_insert_script
FROM dataHorario h
WHERE h.ativo = FALSE;

--SOLUÇÃO APAGAR OS HORARIO DESATIVADO. 
DELETE FROM ensino.horario_turma WHERE id_horario_turma IN (SELECT h.id_horario_turma FROM dataHorario h WHERE h.ativo = FALSE);

--BACKUP DA DATA INICIO E DATA FIM
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || dh.data_inicio || '''', 'NULL')  || ', ' || 
    'data_fim = ' || COALESCE('''' || dh.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || dh.id_horario_turma || ';' AS backup_script
FROM dataHorario dh
WHERE dh.ativo;

--SOLUÇÃO ALTERA A DATA INICIO E DATA FIM PARA FICAR PADRÃO
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-19', data_fim = '2026-12-18'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo;

WITH calculo_datas AS (
    SELECT 
        fa.id_frequencia,
        fa.id_discente,
        fa.data AS data_original,
        CASE 
            WHEN fa.data BETWEEN '2026-02-01' AND '2026-03-31' 
                 AND EXTRACT(ISODOW FROM fa.data) = 2 
                THEN (fa.data - INTERVAL '1 day')::date
            WHEN fa.data BETWEEN '2026-02-01' AND '2026-03-31' 
                 AND EXTRACT(ISODOW FROM fa.data) = 3 
                THEN (fa.data + INTERVAL '1 day')::date
            ELSE fa.data
        END::date AS data_nova
    FROM ensino.frequencia_aluno fa
    WHERE fa.id_turma = 689394
)
SELECT 
    c.*,
    (SELECT TRUE FROM ensino.frequencia_aluno fa2 
     WHERE fa2.id_discente = c.id_discente 
       AND fa2.data = c.data_nova 
       AND fa2.id_turma = 689394 
       AND fa2.id_frequencia != c.id_frequencia) AS existe_conflito
INTO TEMP mudarDiaFrequencia
FROM calculo_datas c
WHERE c.data_original != c.data_nova;


--BACKUP DO lançamento TERÇA, vira SEGUNDA E QUARTA, vira QUINTA
SELECT 'UPDATE ensino.frequencia_aluno	SET ' || '"data" = ' || COALESCE('''' || h.data_original || '''', 'NULL') || ' WHERE id_frequencia = ' || h.id_frequencia || ';' AS backup
FROM mudarDiaFrequencia h
where h.existe_conflito IS NOT true;

--ATUALIZA PARA AS NOVAS DATAS. 
UPDATE ensino.frequencia_aluno AS fa SET "data" = m.data_nova
FROM mudarDiaFrequencia m
WHERE fa.id_frequencia = m.id_frequencia
AND m.existe_conflito IS NOT TRUE;


---####JOSÉ CARLOS DA SILVA  6º Ano - EFAFM6B / MATUTINO
DROP TABLE IF EXISTS dataHorario;

SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 689400;

--BACKUP DOS HORARIO DESATIVADO
SELECT 
    'INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada) VALUES (' ||
    COALESCE(h.id_horario_turma::text, 'NULL') || ', ' || 
    COALESCE(h.id_turma::text, 'NULL') || ', ' || 
    COALESCE(h.tipo::text, 'NULL') || ', ' || 
    COALESCE(h.id_horario::text, 'NULL') || ', ' || 
    COALESCE('''' || h.dia || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.hora_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpa || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmergpapos || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.codmerg || '''', 'NULL') || ', ' || 
    COALESCE(h.ativo::text, 'NULL') || ', ' || 
    COALESCE('''' || h.data_alteracao || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.data_cadastro || '''', 'NULL') || ', ' || 
    COALESCE('''' || h.altaracao_horario || '''', 'NULL') || ', ' || 
    COALESCE(h.id_registro_entrada::text, 'NULL') || ');' AS backup_insert_script
FROM dataHorario h
WHERE h.ativo = FALSE;

--SOLUÇÃO APAGAR OS HORARIO DESATIVADO. 
DELETE FROM ensino.horario_turma WHERE id_horario_turma IN (SELECT h.id_horario_turma FROM dataHorario h WHERE h.ativo = FALSE);

--BACKUP DA DATA INICIO
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || dh.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || dh.id_horario_turma || ';' AS backup_script
FROM dataHorario dh
WHERE dh.ativo;

--SOLUÇÃO ALTERA A DATA INICIO PARA FICAR PADRÃO
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-19'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma
AND dh.ativo;


UPDATE ensino.frequencia_aluno 	SET ativo=false	WHERE id_frequencia IN (138143333, 138143334, 138143335, 138143336, 138143337, 138143338, 138143339, 138143340, 138143341, 138143342, 138143343, 138143344, 138143345, 138143346, 138143347, 138143348, 138143349, 138143350, 138143351, 138143352, 138143353, 138143354, 138143355, 138143356, 138143357, 138143358, 138143359, 138143360, 138143361, 138143362, 138143363, 138143364, 138143365, 138143366);


COMMIT;





