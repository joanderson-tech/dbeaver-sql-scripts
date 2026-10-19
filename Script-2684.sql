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