UPDATE ensino.turma
	SET id_turma_agrupadora=NULL
	WHERE id_turma=739884;


/*UPDATE basico.curriculo_basico
	SET tipo_diario_diversificado=31, possui_parte_diversificada=true
	WHERE id_curriculo_basico=55456041;*/


select id_turma_agrupadora, * from ensino.turma t where  id_turma=739884;

select * from ensino.horario_turma ht WHERE ht.id_turma=739884;