-- Script Solução

BEGIN;

UPDATE basico.curriculo_basico SET tipo_diario=31 WHERE id_curriculo_basico in (52371538,52371552);

UPDATE basico.curriculo_basico SET possui_parte_diversificada=false, tipo_diario_diversificado=null WHERE id_curriculo_basico in (52371538,52371552);

UPDATE basico.turma_serie SET tipo_diario=31 WHERE id_turma_serie in (52371680, 52371681, 52371684, 52371685, 52371687, 52371688, 52371690, 52371691, 52371693, 52371694, 52403101, 52403382, 52404128);


COMMIT;

