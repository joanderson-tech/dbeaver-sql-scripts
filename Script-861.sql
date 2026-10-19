select
	distinct t.id_turma a,
	t.ano ,
	t.periodo ,
	t.descricao_horario ,
	t.local ,
	t.codigo ,
	t.data_inicio ,
	t.data_fim ,
	t.agrupadora,
	t.grupo ,
	t.tipo,
	(
	select
		count(*)
	from
		basico.matricula_estudante_serie mes
	where
		mes.id_turma_serie = t.id_turma_serie
		and (mes.id_situacao_matricula_serie in (2, 3, 1, 7, 8, 10, -1))
		and mes.ano_calendario =2025) as QUANTIDADE,
	(
	select
		count(*)
	from
		ensino.matricula_componente mc
	where
		mc.id_turma = t.id_turma
		and (mc.id_situacao_matricula in (5, 6, 2, 8))) ,
	(
	select
		case
			when count(*)>0 then true
			else false
		end
	from
		ensino.docente_turma dt
	where
		dt.id_turma = dtt.id_turma
		and dt.ativo = true
		and dt.id_docente_turma>dtt.id_docente_turma
	group by
		dt.id_turma) as col_13_0_,
	t.total_matriculados as col_14_0_,
	t.id_disciplina as col_15_0_,
	componente8_.nome as col_16_0_,
	componente8_.codigo as col_17_0_,
	componente8_.id_tipo_componente as col_18_0_,
	tipocompon12_.descricao as col_19_0_,
	t.id_situacao_turma as col_20_0_,
	situacaotu13_.descricao as col_21_0_,
	t.id_turma_serie as col_22_0_,
	ts.nome as col_23_0_,
	ts.ano as col_24_0_,
	ts.id_escola as col_25_0_,
	escola18_.nome as col_26_0_,
	ts.id_serie as col_27_0_,
	serie21_.descricao as col_28_0_,
	serie21_.multisseriada as col_29_0_,
	ts.tipo_diario as col_30_0_,
	serie21_.id_etapa_ensino as col_31_0_,
	etapaensin29_.denominacao as col_32_0_,
	ts.id_turno as col_33_0_,
	turno32_.descricao as col_34_0_,
	modulo2_.sigla as col_35_0_,
	t.periodo as col_36_0_,
	etapaensin29_.periodicidade_etapa as col_37_0_,
	etapaensin29_.id_forma_organizacao_Etapa as col_38_0_,
	ts.id_tipo_turma_serie as col_39_0_,
	t.id_categoria_componente as col_40_0_,
	curriculob4_.possui_parte_diversificada as col_41_0_,
	curriculob4_.tipo_diario_diversificado as col_42_0_,
	curriculob4_.tipo_diario as col_43_0_,
	curriculob4_.multisseriado as col_44_0_
from
	ensino.docente_turma dtt
inner join ensino.turma t on
	dtt.id_turma = t.id_turma
left outer join basico.modulo modulo2_ on
	t.id_modulo = modulo2_.id_modulo
left outer join basico.turma_serie ts on
	t.id_turma_serie = ts.id_turma_serie
left outer join basico.curriculo_basico curriculob4_ on
	ts.id_curriculo_medio = curriculob4_.id_curriculo_basico,
	escola.escola escola18_,
	basico.serie serie21_,
	basico.etapa_ensino etapaensin29_,
	ensino.turno turno32_,
	ensino.componente_curricular componente8_,
	ensino.tipo_componente_curricular tipocompon12_,
	ensino.situacao_turma situacaotu13_
where
	ts.id_escola = escola18_.id_escola
	and ts.id_serie = serie21_.id_serie
	and serie21_.id_etapa_ensino = etapaensin29_.id_etapa_ensino
	and ts.id_turno = turno32_.id_turno
	and t.id_disciplina = componente8_.id_componente_curricular
	and componente8_.id_tipo_componente = tipocompon12_.id_tipo_disciplina
	and t.id_situacao_turma = situacaotu13_.id_situacao_turma
	and dtt.ativo = true
	and dtt.id_docente = 45
	and dtt.finalizada = false
	and ts.ano =2025
	and t.id_situacao_turma <> 4
	and dtt.data_inicio <= current_date
order by
	etapaensin29_.denominacao,
	serie21_.descricao,
	t.periodo
