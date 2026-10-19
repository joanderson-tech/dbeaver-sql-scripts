 select
	(
	select
		count(mes.id_matricula_discente_serie)
	from
		basico.matricula_estudante_serie mes
	inner join escola.escola_etapa_ensino_serie eees on
		eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
	where
		eees.id_escola = 52232984
		and mes.ano_calendario = 2025
		and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )) as qtdEstudantes,
	(
	select
		count(distinct(dt.id_docente))
	from
		ensino.docente_turma dt
	inner join ensino.turma turma on
		turma.id_turma = dt.id_turma
	inner join basico.turma_serie turma_serie on
		turma_serie.id_turma_serie = turma.id_turma_serie
	where
		turma_serie.id_escola = 52232984
		and turma.ano = 2025
		and dt.ativo = true
		and not dt.finalizada) as qdtDocentes,
	(
	select
		count(turma_serie.id_turma_serie)
	from
		basico.turma_serie turma_serie
	inner join basico.serie s
			using(id_serie)
	where
		nao_contabiliza_turma is false
		and progressao_parcial is false
		and turma_serie.id_escola = 52232984
		and turma_serie.ano = 2025
		and id_turma_serie_agrupadora is null
		and turma_serie.ativo = true) as qtdTurmas,
	(with alunos as (
	select
		id_estudante,
		ano_calendario
	from
		basico.matricula_estudante_serie mes
	join escola.escola_etapa_ensino_serie eees on
		(mes.iD_serie_escola = eees.id_escola_etapa_ensino_serie)
	where
		eees.id_escola = 52232984
		and mes.ano_calendario in (2025, 2024)
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 ))
	select
		count(id_estudante)
		from alunos
	where
		ano_calendario = 2025
		and id_estudante not in (
		select
			id_estudante
		from
			alunos
		where
			ano_calendario = 2024) ) as qtdNovoEstudantes,
	(
	select
		count(mes.id_matricula_discente_serie)
	from
		basico.matricula_estudante_serie mes
	inner join escola.escola_etapa_ensino_serie eees on
		eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
	where
		eees.id_escola = 52232984
		and mes.ano_calendario = 2025
		and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mes.id_turma_serie is null ) as qtdEstudantesNaoAlocados,
	(
	select
		count(rm.id_renovacao_matricula)
	from
		matricula.renovacao_matricula rm
	inner join escola.escola escola on
		escola.id_escola = rm.id_escola
	inner join matricula.calendario_matricula cal on
		cal.id_calendario_matricula = rm.id_calendario_matricula
	join matricula.vaga_serie vs on
		vs.id_vaga_serie = rm.id_vaga_serie
	inner join basico.serie s on
		s.id_serie = vs.id_serie
	inner join basico.etapa_ensino ee on
		ee.id_etapa_ensino = s.id_etapa_ensino
	where
		escola.id_escola = 52232984
		and cal.ano = 2025
		and rm.data_cancelamento is null
		and rm.id_nova_serie is not null ) as qtdEstudantesRenovados
from
	escola.escola
limit 1;


 select
	dt
from
	ensino.docente_turma dt
inner join ensino.turma turma on
	turma.id_turma = dt.id_turma
inner join basico.turma_serie turma_serie on
	turma_serie.id_turma_serie = turma.id_turma_serie
where
	turma_serie.id_escola = 52232984
	and turma.ano = 2025
	and dt.ativo = true
	and not dt.finalizada
	and (dt.data_fim  > now());
 
 