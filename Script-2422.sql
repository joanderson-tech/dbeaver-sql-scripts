BEGIN;

UPDATE basico.turma_serie SET id_curriculo_medio = 52228245
WHERE id_turma_serie IN (51899258, 51899595, 51899225, 51899381, 51899299, 51899320, 51899618, 51899365, 51899531, 51899604, 51899341);

-- EFAIV2C --> AI2C
UPDATE basico.turma_serie SET id_curriculo_medio = 52228534
WHERE id_turma_serie IN (51899542, 51899588, 51899355, 51899521, 51899619, 51899467, 51899226 );

-- Sincroniza matrículas
UPDATE basico.matricula_estudante_serie mes
SET id_curriculo_medio = ts.id_curriculo_medio
FROM basico.turma_serie ts
WHERE ts.id_turma_serie = mes.id_turma_serie
AND mes.id_turma_serie IN (51899258, 51899595, 51899225, 51899381, 51899299, 51899320, 51899618, 51899365, 51899531, 51899604,
    51899341, 51899542, 51899588, 51899355, 51899521, 51899619, 51899467, 51899226);


COMMIT;