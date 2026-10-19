--##SOLIÇÃO TURMA: EFAFIEF8A, EFAFIEF8B -- Língua Portuguesa
SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma  IN (749995,750021) --EFAFIEF8A, EFAFIEF8B
AND ht.ativo = FALSE;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-05', data_fim = '2026-05-14'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;


--Solução
--750065 EFAFIEF9A
UPDATE ensino.horario_turma	SET dia='2'	WHERE id_horario_turma=1631193;

--Desativar as frequências da quarta-feira onde não há mais horário cadastrado para a quarta-feira.
SELECT 
'UPDATE ensino.frequencia_aluno	SET ativo = FALSE WHERE id_frequencia = ' || fa.id_frequencia || ';' AS BACKUP
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 750065
  AND EXTRACT(DOW FROM fa.data) = 3
  AND fa.ativo;

UPDATE ensino.frequencia_aluno
SET ativo = FALSE
WHERE id_turma = 750065
  AND EXTRACT(DOW FROM data) = 3
  AND ativo = TRUE;

--backup
--750065 EFAFIEF9A
UPDATE ensino.horario_turma	SET dia='4'	WHERE id_horario_turma=1631193;



----OUTRO PROFESSOR 

UPDATE ensino.horario_turma 	SET dia='3'	WHERE id_horario_turma IN (1631008, 1631013);

--Desativar as frequências da quarta-feira onde não há mais horário cadastrado para a quarta-feira.
SELECT 'UPDATE ensino.frequencia_aluno	SET ativo = TRUE WHERE id_frequencia = ' || fa.id_frequencia || ';' AS BACKUP
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 749996
  AND EXTRACT(DOW FROM fa.data) = 3
  AND fa.ativo;

-- 1. EXECUÇÃO DA SOLUÇÃO DIRETA
UPDATE ensino.frequencia_aluno
SET ativo = FALSE
WHERE id_turma = 749996
  AND EXTRACT(DOW FROM data) = 3
  AND ativo = TRUE;

--BACKUP
UPDATE ensino.horario_turma 	SET dia='4'	WHERE id_horario_turma IN (1631008, 1631013);

---
--750066 EFAFIEF9A
UPDATE ensino.horario_turma 	SET dia='5'	WHERE id_horario_turma IN (1631240, 1631205, 1641383);
UPDATE ensino.horario_turma 	SET dia='3'	WHERE id_horario_turma IN (1631198);

SELECT 'UPDATE ensino.frequencia_aluno	SET ativo = TRUE WHERE id_frequencia = ' || fa.id_frequencia || ';' AS BACKUP
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 750066
  AND EXTRACT(DOW FROM fa.data) IN (3,5)
  AND fa.ativo;

-- 1. EXECUÇÃO DA SOLUÇÃO DIRETA
UPDATE ensino.frequencia_aluno
SET ativo = FALSE
WHERE id_turma = 750066
  AND EXTRACT(DOW FROM data)IN (3,5)
  AND ativo = TRUE;


--BACKUP
UPDATE ensino.horario_turma 	SET dia='6'	WHERE id_horario_turma IN (1631240, 1631205, 1641383);
UPDATE ensino.horario_turma 	SET dia='4'	WHERE id_horario_turma IN (1631198);

