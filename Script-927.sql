select * from  basico.curriculo_basico  WHERE id_curriculo_basico in (51880803,51881158,35497185,51880539)

UPDATE basico.curriculo_basico	SET possui_parte_diversificada=false WHERE id_curriculo_basico in (51880803,51881158);

UPDATE basico.turma_serie SET tipo_diario=31 WHERE id_turma_serie in (51882083, 51881578, 51881579, 51882829, 51882085, 51882086, 51889641, 51889642);

UPDATE basico.curriculo_basico SET tipo_diario=31 WHERE id_curriculo_basico in (51880803,51881158,35497185,51880539);

