SELECT  * FROM basico.curriculo_basico cb WHERE cb.codigo IN ('AL-23N','AL-23') ;



--Código da estrutura atual:  AL-23 -- 52403240
--Código da estrutura para aplicar AL-23N -- 52466099

SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio =52403240;

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie  IN (52403381, 52404127) OR ts.id_turma_serie_agrupadora IN (52403381, 52404127)
ORDER BY ts.nome;


SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico IN (52403240, 52466099);



MULTIINTMULTA     52399222, 52403240, 
MULTIINTMULTA-M0  1005219,  52371552,  --52466085
MULTIINTMULTA-M1  1005220,  52371566,  --52371566



SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie  IN (52403382, 52404128);

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie  IN (52403381, 52404127) OR ts.id_turma_serie_agrupadora IN (52403381, 52404127)
ORDER BY ts.nome;

UPDATE basico.turma_serie
    SET id_curriculo_medio=52466085 , tipo_diario = 1
    WHERE id_turma_serie IN (52403382, 52404128);
--Turma principal
UPDATE basico.turma_serie
    SET id_curriculo_medio=52466099
    WHERE id_turma_serie IN (52403381, 52404127);



SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie  IN (52403382, 52404128);
SELECT  * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico = 52466085;

BEGIN;

--solucao
--Sub-turma
UPDATE basico.turma_serie
    SET id_curriculo_medio=52466085 , tipo_diario = 1
    WHERE id_turma_serie IN (52403382, 52404128);

--Turma principal
UPDATE basico.turma_serie
    SET id_curriculo_medio=52466099
    WHERE id_turma_serie IN (52403381, 52404127);

COMMIT;

--backup
--Sub-turma
UPDATE basico.turma_serie
    SET id_curriculo_medio=52371552, tipo_diario = 31
    WHERE id_turma_serie IN (52403382, 52404128);

--Turma principal
UPDATE basico.turma_serie
    SET id_curriculo_medio=52403240
    WHERE id_turma_serie IN (52403381, 52404127);


SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 52403382;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico IN ( 52371552, 52466085);
