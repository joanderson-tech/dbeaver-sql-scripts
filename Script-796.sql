select * from basico.curriculo_basico cb where cb.id_curriculo_basico in(72531179, 72759255);


72424364



SELECT e.* FROM escola.escola AS e


--solução
UPDATE basico.curriculo_basico SET id_unidade=605,id_escola=NULL WHERE id_curriculo_basico in (72766316, 72759255);

--backup
UPDATE basico.curriculo_basico SET id_unidade=5905,id_escola=72424364 WHERE id_curriculo_basico in (72766316, 72759255);

select * from ensino_infantil.configuracao_relatorio cr where cr.id_curriculo_basico in (72766316, 72759255);


