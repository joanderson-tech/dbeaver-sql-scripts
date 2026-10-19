select * from ensino.turma t where t.id_turma = 682659;

select * from basico.turma_serie ts where ts.id_turma_serie   =51930223 ;

select * from ensino.turma t where t. = ;

select * from basico.curriculo_basico cb  where cb.id_curriculo_basico = 51959499;

select * from ensino.matricula_componente mc where mc.id_turma = 682659;

--UPDATE basico.turma_serie SET tipo_diario = 1 WHERE id_turma_serie IN (51975276, 519752--77, 51975280);

select * from ensino.componente_curricular cc where cc.id_componente_curricular = ;

select * from basico.turma_serie ts where ts.id_turma_serie = ;

begin;
commit;

-- Auto-generated SQL script #202505091213
UPDATE ensino.turma
	SET tipo=10
	WHERE id_turma=682651;


-- Auto-generated SQL script #202505091213
UPDATE ensino.turma
	SET tipo=1
	WHERE id_turma=682651;


-- Auto-generated SQL script #202505091357
UPDATE ensino.turma
	SET id_categoria_componente=2
	WHERE id_turma=682651;


