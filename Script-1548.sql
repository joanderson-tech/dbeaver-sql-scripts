BEGIN;

----##	PASSO 01
SELECT *
INTO TEMP dataHorario
FROM ensino.horario_turma ht
WHERE ht.id_turma = 685427
AND ht.ativo = FALSE;

----##	PASSO 02 Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

----##	PASSO 03 ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2025-01-21', data_fim = '2025-04-23'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

----##	PASSO 04
SELECT 'UPDATE ensino.frequencia_aluno 	SET ativo=false	WHERE id_frequencia IN ( ' || string_agg(fa.id_frequencia::TEXT,',') || ');' AS solução, 
			 'UPDATE ensino.frequencia_aluno 	SET ativo=true WHERE id_frequencia IN ( ' || string_agg(fa.id_frequencia::TEXT,',') || ');' AS backup
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma = 685427
AND fa.DATA IN ('2025-02-13', '2025-02-14', '2025-06-30')
AND fa.ativo;

COMMIT;