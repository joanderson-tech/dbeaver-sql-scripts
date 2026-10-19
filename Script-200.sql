 select
	u.nome as dired,
	mun.nome as municipio,
	esc.id_escola,
	esc.nome as escola,
	tr.id_turno ,
	tr.descricao as turno,
	e.id_etapa_ensino,
	e.denominacao as etapa,
	s.id_serie,
	s.descricao as serie,
	mod.denominacao as modalidade,
	n.denominacao as nivel,
	count( distinct ts.nome) as Turmas,
	(
	select
		count (mes.id_estudante)
	from
		basico.matricula_estudante_serie mes
	join escola.escola_etapa_ensino_serie eees on
		eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
	join basico.serie ser on
		ser.id_serie = eees.id_serie
	join basico.etapa_ensino et on
		et.id_etapa_ensino = ser.id_etapa_ensino
	where
		mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
		and mes.ano_calendario = 2024
		and mes.id_turma_serie is not null
		and et.id_etapa_ensino = e.id_etapa_ensino
		and esc.id_escola = eees.id_escola
		and ser.id_serie = s.id_serie
		and mes.id_turno = tr.id_turno ) as Enturmados,
	(
	select
		count (mes.id_estudante)
	from
		basico.matricula_estudante_serie mes
	join escola.escola_etapa_ensino_serie eees on
		eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
	join basico.serie ser on
		ser.id_serie = eees.id_serie
	join basico.etapa_ensino et on
		et.id_etapa_ensino = ser.id_etapa_ensino
	where
		mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mes.ano_calendario = 2024
			and et.id_etapa_ensino = e.id_etapa_ensino
			and esc.id_escola = eees.id_escola
			and ser.id_serie = s.id_serie
			and mes.id_turno = tr.id_turno ) as Matriculados;