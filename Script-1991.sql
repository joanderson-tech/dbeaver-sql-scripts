BEGIN;


SELECT * FROM ensino.frequencia_aluno fa WHERE fa.id_turma = 804105 AND fa."data" = '2026-02-05'

-- ## 01 SOLUÇÃO DO PROFESSOR horarioDesativado -- josivaneo1gomes@hotmail.com
SELECT  ht.*
--INTO TEMP dataHorario
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84520999
AND ht.ativo;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || 
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
WHERE t.id_turma_serie  = 84520999
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

BEGIN;

-- ## 02 SOLUÇÃO DO PROFESSOR horarioDesativado -- j.nilor@hotmail.com
SELECT  ht.*
INTO TEMP dataHorario1
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84521015
AND ht.ativo;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || ', ' ||
    'data_fim = ' || COALESCE('''' || h.data_fim || '''', 'NULL') || ', ' ||
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM dataHorario1 h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04', data_fim = '2026-12-17'
FROM dataHorario1 dh
WHERE ht.id_horario_turma = dh.id_horario_turma;

---#### horario Desativado
SELECT  ht.*
INTO TEMP horarioDesativado1
FROM ensino.turma t 
JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma 
WHERE t.id_turma_serie  = 84521015
AND ht.ativo = false;

-- Backup Matrícula Componente
SELECT 'UPDATE ensino.horario_turma SET ' ||
    'data_inicio = ' || COALESCE('''' || h.data_inicio || '''', 'NULL') || 
    ' WHERE id_horario_turma = ' || h.id_horario_turma || ';' AS backup_script
FROM horarioDesativado1 h;

--ATUALIZA 
UPDATE ensino.horario_turma AS ht
SET data_inicio = '2026-02-04'
FROM horarioDesativado1 dh
WHERE ht.id_horario_turma = dh.id_horario_turma;


COMMIT;

---backup p1
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743811;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743812;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743838;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743813;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743814;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743815;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743816;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743817;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743818;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743819;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743820;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743821;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743822;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743823;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743824;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743825;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743826;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743827;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743828;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743829;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743830;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743831;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743832;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743833;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743834;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743835;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743836;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743837;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743839;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743840;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743841;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743842;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743843;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743844;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743845;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743846;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743847;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743848;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743849;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL WHERE id_horario_turma = 1743850;


UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743611;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743612;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743613;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743628;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743629;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743614;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743615;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743630;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743631;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743632;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743616;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743617;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743648;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743649;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743650;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743618;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743619;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743633;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743634;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743635;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743620;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743621;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743636;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743637;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743638;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743622;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743623;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743639;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743640;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743641;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743624;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743625;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743642;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743643;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743644;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743626;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-04' WHERE id_horario_turma = 1743627;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743645;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743646;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-10' WHERE id_horario_turma = 1743647;

---######################################################################################---

UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761820;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761823;
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
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761824;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761825;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761826;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761827;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761828;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761829;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761830;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761831;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761832;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761822;
UPDATE ensino.horario_turma SET data_inicio = NULL, data_fim = NULL,  WHERE id_horario_turma = 1761819;



UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759367;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759368;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759369;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759370;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759371;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759372;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759373;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759374;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759375;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759376;
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
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759394;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759377;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759378;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759379;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759380;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1759393;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759381;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1759396;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 85554925;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 85554924;
UPDATE ensino.horario_turma SET data_inicio = '2026-02-23' WHERE id_horario_turma = 1759395;
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
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1750374;
UPDATE ensino.horario_turma SET data_inicio = NULL WHERE id_horario_turma = 1750373;