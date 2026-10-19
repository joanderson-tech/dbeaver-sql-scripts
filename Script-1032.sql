select * from basico.curriculo_basico cb where cb.codigo in ('4PN', '5PN');

select * from basico.turma_serie ts where ts.id_curriculo_medio in (35558311, 35559167) and ativo;

35559167
35558311

-- solução -- 4PN
UPDATE basico.curriculo_basico SET tipo_diario=15 WHERE id_curriculo_basico=35558311;
UPDATE basico.turma_serie SET tipo_diario=15 WHERE id_turma_serie=51883946;
-- solução -- 5PN
UPDATE basico.curriculo_basico SET tipo_diario=5 WHERE id_curriculo_basico=35559167;
UPDATE basico.turma_serie SET tipo_diario=5 WHERE id_turma_serie=51883947;





-- backup --4PN
UPDATE basico.curriculo_basico SET tipo_diario=10 WHERE id_curriculo_basico=35558311;
UPDATE basico.turma_serie SET tipo_diario=10 WHERE id_turma_serie=51883946;
-- backup --5PN
UPDATE basico.curriculo_basico SET tipo_diario=0 WHERE id_curriculo_basico=35559167;
UPDATE basico.turma_serie SET tipo_diario=0 WHERE id_turma_serie=51883947;
