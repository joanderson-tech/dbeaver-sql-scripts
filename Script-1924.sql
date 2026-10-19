SELECT *
--cb.codigo, cb.tipo_diario_diversificado 
FROM basico.curriculo_basico cb
WHERE id_curriculo_basico IN (52030949, 52030965);

SELECT *
--cb.codigo, cb.tipo_diario_diversificado 
FROM basico.curriculo_basico_componente cbc
WHERE id_curriculo_basico IN (52030949, 52030965);

BEGIN;



SELECT *
FROM basico.turma_serie ts
--JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio IN (52030949)
AND ts.ativo ;

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE id_curriculo_basico IN (52030949);

SELECT DISTINCT  t.id_disciplina
FROM ensino.turma t
--JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina 
WHERE t.id_turma_serie IN (51899431);
AND t.id_situacao_turma = 1;



UPDATE basico.curriculo_basico_componente
SET
permite_contraturno = NULL
WHERE id_curriculo_basico_componente = 52030954;



SELECT t.id_situacao_turma, t.id_disciplina, t.codigo
FROM ensino.turma t
WHERE t.id_turma_serie = 51899432
