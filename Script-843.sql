UPDATE basico.curriculo_basico SET tipo_diario = 1 WHERE id_curriculo_basico in (52224881,52224887);

UPDATE basico.turma_serie SET tipo_diario = 31 WHERE id_turma_serie  in (51891716, 51891719, 51891754, 51892566);



select * from basico.turma_serie;

select * from basico.matricula_estudante_serie mes ;




basico.turma_serie

--solução
UPDATE basico.curriculo_basico SET tipo_diario=31 WHERE id_curriculo_basico=51881110;


--backup
UPDATE basico.curriculo_basico SET tipo_diario=34 WHERE id_curriculo_basico=51881110;