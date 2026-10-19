select * from basico.curriculo_basico cb where CB.codigo   = '5PN8';

select * from basico.turma_serie ts where ts.id_turma_serie = 35559167;

--solução
UPDATE basico.curriculo_basico SET tipo_diario=15 WHERE id_curriculo_basico=35559167;

--backup
UPDATE basico.curriculo_basico SET tipo_diario=5 WHERE id_curriculo_basico=35559167;


