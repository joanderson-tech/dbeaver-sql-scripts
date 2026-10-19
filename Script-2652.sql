SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'IV6E7';

SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 52565313;

SELECT * FROM basico.etapa_ensino ee ; --52646232

SELECT s.* FROM basico.serie AS s WHERE s.id_etapa_ensino  = 52646232;

SELECT * FROM basico.turma_serie ts WHERE ts.id_serie = 52565311;

52646232



-- Auto-generated SQL script #202609081436
UPDATE basico.serie
    SET id_etapa_ensino=52646232
    WHERE id_serie=52565311;


-- Auto-generated SQL script #202609081436
UPDATE basico.serie
    SET id_etapa_ensino=10
    WHERE id_serie=52565311;
