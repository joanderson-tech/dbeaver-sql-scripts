select * from ensino.turma t where t.id_turma = 682651;

select * from basico.turma_serie ts where ts.id_turma_serie   = 682651;

select * from ensino.turma t where t.id_turma  = 51930223;

select * from basico.curriculo_basico cb  where cb.id_serie = 51959499 ;

select * from ensino.matricula_componente mc where mc.id_turma = 682651;

--UPDATE basico.turma_serie SET tipo_diario = 1 WHERE id_turma_serie IN (51975276, 519752--77, 51975280);

select * from ensino.componente_curricular cc where cc.tur;

select * from basico.turma_serie ts where ts.id_turma_serie = 51930223;



rollback;

select * from 

-- Auto-generated SQL script #202505091114
UPDATE basico.curriculo_basico
	SET tipo_diario_diversificado=10
	WHERE id_curriculo_basico=51959499;

UPDATE basico.curriculo_basico
	SET tipo_diario_diversificado=20
	WHERE id_curriculo_basico=51959499;

begin;
commit;

/*-- Auto-generated SQL script #202505091050
UPDATE basico.curriculo_basico
	SET tipo_diario=20
	WHERE id_curriculo_basico=51959499;


UPDATE basico.turma_serie
	SET tipo_diario=20
	WHERE id_turma_serie=51930223;

--backup 

UPDATE basico.curriculo_basico
	SET tipo_diario=10
	WHERE id_curriculo_basico=51959499;

-- Auto-generated SQL script #202505091046
UPDATE basico.turma_serie
	SET tipo_diario=10
	WHERE id_turma_serie=51930223;*/




