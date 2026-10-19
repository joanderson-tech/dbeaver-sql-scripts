DELETE FROM escola.escola_etapa_ensino_serie WHERE id_escola_etapa_ensino_serie IN (53198261, 53198259);
DELETE FROM matricula.operacao_vaga_serie WHERE id_operacao_vaga_serie IN (53198285, 53198286, 53198292, 53200307);
DELETE FROM matricula.vaga_serie WHERE id_vaga_serie IN (53198275, 53198280, 53198273, 53198278, 53198283, 53198270);
DELETE FROM basico.serie WHERE id_serie=53197796;


COMMIT;

BEGIN;