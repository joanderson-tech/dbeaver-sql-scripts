SELECT t.* --string_agg(mc.id_matricula_componente :: varchar , ',')
FROM ensino.turma t
--JOIN  ensino.matricula_componente mc ON mc.id_turma =  t.id_turma 
WHERE t.id_turma_serie = 52285581;
AND t.id_situacao_turma <> 4;

SELECT t.* --string_agg(mc.id_matricula_componente :: varchar , ',')
FROM ensino.turma t
WHERE t.id_turma_serie = 52285581


UPDATE ensino.turma SET id_situacao_turma = 4 WHERE id_turma IN (686530, 686584, 686582, 686583);

UPDATE ensino.matricula_componente
	SET id_situacao_matricula=7
	WHERE id_matricula_componente IN (17089876,17089880,17089873,17089879,17089872,17089874,17089875,17089877,17089878);



UPDATE ensino.turma SET id_situacao_turma = 1 WHERE id_turma IN (686530, 686584, 686582, 686583);

UPDATE ensino.matricula_componente
	SET id_situacao_matricula=2
	WHERE id_matricula_componente IN (17089876,17089880,17089873,17089879,17089872,17089874,17089875,17089877,17089878);




SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 52234512;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 52234512;

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo = 'multiss';

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 52234512;

-- Auto-generated SQL script #202603021144
UPDATE basico.curriculo_basico
SET
ativo = FALSE
WHERE id_curriculo_basico = 52234512;


SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_turma IN (686530, 686584, 686582, 686583);


SELECT 
FROM ensino.turma t
WHERE t.id_turma_serie = ts.id_turma_serie
AND agrupadora
AND t.id_situacao_turma <> 4 )
ELSE NULL END, 1
FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 52234512;

----###############

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 52234512;

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 52234512;

SELECT t.* --string_agg(mc.id_matricula_componente :: varchar , ',')
FROM ensino.turma t
WHERE t.id_turma_serie = 52285581

