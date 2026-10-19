begin;

update basico.curriculo_basico cb 
	set tipo_diario = 31,
		tipo_diario_diversificado = null,
		possui_parte_diversificada = false
			where cb.id_curriculo_basico in (52454957, 52454972, 52454987);

update basico.turma_serie ts 
	set tipo_diario = 31
		where ts.id_curriculo_medio in (52454957, 52454972, 52454987);

commit;