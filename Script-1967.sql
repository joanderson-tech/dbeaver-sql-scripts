SELECT t.id_turma_serie, * FROM ensino.turma t WHERE t.id_turma_ = 804121;

BEGIN;

SELECT  ht.*
INTO TEMP dataHorario
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84521015
AND ht.ativo;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04', data_fim = '2026-12-17'
FROM dataHorario dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

---#### horario Desativado

SELECT  ht.*
INTO TEMP horarioDesativado
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84521015
AND ht.ativo = false;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM horarioDesativado h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04'
FROM horarioDesativado dh
WHERE ht.id_horario_turma = dh.id_horario_turma;


COMMIT;


UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759368;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759367;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759369;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759370;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759371;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759372;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759373;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759374;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759375;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759376;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759377;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759378;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759379;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759380;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759381;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759382;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759383;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759384;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759385;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759386;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759387;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759388;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759389;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759390;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759391;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759392;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1759393;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759394;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759395;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1759396;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759397;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759398;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759399;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759400;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759401;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759402;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759403;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759404;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759405;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759406;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1750373;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1750374;

--##

UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761820;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761794;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761793;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761795;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761796;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761797;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761798;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761799;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761800;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761801;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761802;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761803;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761804;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761805;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761806;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761807;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761808;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761809;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761810;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761811;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761812;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761813;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761814;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761815;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761816;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761817;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761818;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761821;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761823;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761824;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761825;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761826;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761827;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761828;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761829;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761830;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761831;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761832;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761819;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761822;