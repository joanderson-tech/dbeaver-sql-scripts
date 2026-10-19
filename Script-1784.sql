BEGIN;

update basico.curriculo_basico cb set tipo_diario_diversificado = 31 where cb.id_curriculo_basico = 52098035;

COMMIT;

SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 52098035;
