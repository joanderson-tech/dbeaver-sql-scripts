select
	ts.id_turma_serie as idTurmaSerie,
	mes.id_situacao_matricula_serie,
	ts.nome as nomeTurmaSerie,
	ts.tipo_diario as tipoDiario,
	ts.ano as ano,
	ts.periodo as periodo,
	ts.id_curriculo_medio as idCurriculoMedio,
	curriculob3_.multisseriado as multisseriado,
	ts.id_tipo_turma_serie as idTipoTurmaSerie,
	tts.descricao as descricaoTipoTurmaSerie,
	case
		when coalesce(ts.capacidade_aluno,
		0) > 0 then ts.capacidade_aluno
		when coalesce(serie9_.capacidade_maxima,
		0) > 0 then (serie9_.capacidade_maxima + coalesce(serie9_.capacidade_excesso,
		0))
		else (eens.capacidade_maxima + coalesce(eens.capacidade_excesso,
		0))
	end as capacidade,
	ts.regra_nao as regraNao,
	ts.justificativa_regra_nao as justificativaRegraNao,
	ts.id_turno as idTurno,
	turno5_.descricao as descricaoTurno,
	turno5_.hora_inicio as horaInicio,
	turno5_.hora_fim as horaFim,
	ts.id_escola as idEscola,
	escola8_.nome as nomeEscola,
	ts.id_serie as idSerie,
	serie9_.descricao as descricaoSerie,
	serie9_.multisseriada as multisseriada,
	serie9_.id_etapa_ensino as idEtapaEnsino,
	eens.denominacao as denominacao,
	eens.periodicidade_etapa as periodicidadeEtapa,
	case
		when eens.id_etapa_ensino <> 14 then (
		select
			count(*)
		from
			basico.matricula_estudante_serie
		where
			id_turma_serie = ts.id_turma_serie
			and id_situacao_matricula_serie not in ( 5, 12 ) )
		else (
		select
			count(distinct(eea.id_estudante))
		from
			educacao_especial.atendimento_educacao_especial_horario eeh
		inner join educacao_especial.atendimento_educacao_especial_turma eet on
			eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
		inner join educacao_especial.atendimento_educacao_especial_estudante eea on
			eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
		inner join ensino.turma t on
			t.id_turma = eet.id_turma
		where
			id_turma_serie = ts.id_turma_serie
			and eea.ativo = true )
	end as qtdMatriculados,
	case
		when eens.id_etapa_ensino <> 14 then (
		select
			count(distinct id_discente)
		from
			basico.matricula_estudante_serie mes
		join discente d on
			d.id_discente = mes.id_estudante
		join comum.pessoa_necessidade_especial pne on
			d.id_pessoa = pne.id_pessoa
		where
			id_turma_serie = ts.id_turma_serie
			and id_situacao_matricula_serie not in ( 5, 12 ))
		else (
		select
			count(distinct(eea.id_estudante))
		from
			educacao_especial.atendimento_educacao_especial_horario eeh
		inner join educacao_especial.atendimento_educacao_especial_turma eet on
			eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
		inner join educacao_especial.atendimento_educacao_especial_estudante eea on
			eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
		inner join ensino.turma t on
			t.id_turma = eet.id_turma
		where
			id_turma_serie = ts.id_turma_serie
			and eea.ativo = true )
	end as qtdMatriculadosNEE,
	(
	select
		count(*)
	from
		ensino.docente_turma dt
	join ensino.turma t
			using (id_turma)
	join basico.turma_serie ts
			using (id_turma_serie)
	where
		t.id_turma_serie = ts.id_turma_serie
		and dt.ativo = true ) as qtdProfessores,
	escola8_.id_unidade_escola
from
	ensino.turma tc
inner join basico.turma_serie ts on
	tc.id_turma_serie = ts.id_turma_serie
join basico.matricula_estudante_serie mes on
	mes.id_turma_serie = ts.id_turma_serie
left outer join basico.tipo_turma_serie tts on
	ts.id_tipo_turma_serie = tts.id_tipo_turma_serie,
	basico.curriculo_basico curriculob3_,
	ensino.turno turno5_,
	escola.escola escola8_,
	basico.serie serie9_,
	basico.etapa_ensino eens
where
	ts.id_curriculo_medio = curriculob3_.id_curriculo_basico
	and ts.id_turno = turno5_.id_turno
	and ts.id_escola = escola8_.id_escola
	and ts.id_serie = serie9_.id_serie
	and serie9_.id_etapa_ensino = eens.id_etapa_ensino
	and ts.ativo = true
	and (tts.id_tipo_turma_serie in ( 1, 3, 5, 4, 4 ))
	and (tc.tipo not in ( 10, 5, 8, 15, 11 ))
	and mes.id_situacao_matricula_serie not in ( 5, 12 )
	and ts.id_escola = 2454
	and ts.ano = 2024
group by
	ts.id_turma_serie,
	ts.nome,
	ts.tipo_diario,
	ts.ano,
	ts.periodo,
	ts.id_curriculo_medio,
	curriculob3_.multisseriado,
	ts.id_tipo_turma_serie,
	tts.descricao,
	ts.capacidade_aluno,
	ts.regra_nao,
	ts.justificativa_regra_nao,
	ts.id_turno,
	turno5_.descricao,
	turno5_.hora_inicio,
	turno5_.hora_fim,
	ts.id_escola,
	escola8_.nome,
	ts.id_serie,
	serie9_.descricao,
	serie9_.multisseriada,
	serie9_.id_etapa_ensino,
	serie9_.capacidade_maxima,
	serie9_.capacidade_excesso,
	eens.denominacao,
	eens.periodicidade_etapa,
	eens.id_etapa_ensino,
	eens.capacidade_maxima,
	eens.capacidade_excesso,
	escola8_.id_unidade_escola,
	mes.id_situacao_matricula_serie
order by
	serie9_.descricao ;
	

select * from escola.escola e
