 with datas_calendario as (
select
	1 as bimestre,
	ce.inicio_bim_1 as inicio_bim,
	ce.fim_bim_1 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2024
	and ativo
union
select
	2 as bimestre,
	ce.inicio_bim_2 as inicio_bim,
	ce.fim_bim_2 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2024
	and ativo
union
select
	3 as bimestre,
	ce.inicio_bim_3 as inicio_bim,
	ce.fim_bim_3 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2024
	and ativo
union
select
	4 as bimestre,
	ce.inicio_bim_4 as inicio_bim,
	ce.fim_bim_4 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2024
	and ativo ),
levantamento_mes as (
select
	mes.id_matricula_discente_serie,
	mes.id_estudante,
	coalesce(ts.nome,
	'NÃO ALOCADO EM TURMA') as turma,
	lfts.id_componente,
	coalesce(ts.id_escola,
	eees.id_escola) as id_escola,
	s.descricao as serie,
	case
		when 2 = 1
			and 2024 = 2023
			and ts.id_escola in (53279324, 52927029) then 100
			else coalesce(round(((cast(lfts.aulas_com_frequencia as numeric)* 100)/ lfts.aulas),
			2),
			0)
		end as frequencia_concluida,
		case
			when 2 = 1
				and 2024 = 2023
				and ts.id_escola in (53279324, 52927029) then 'completo'
				else coalesce(lfts.frequencias,
				'NA')
			end as situacao_frequencia_turma
		from
			basico.matricula_estudante_serie mes
		left join basico.turma_serie ts on
			ts.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
			mes.id_turma_serie)
		left join levantamento_frequencia_turma_serie_temp lfts on
			lfts.id_turma_serie = mes.id_turma_serie
		join escola.escola_etapa_ensino_serie eees on
			eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
		left join basico.serie s on
			s.id_serie = coalesce(ts.id_serie,
			eees.id_serie)
		where
			mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
				and mes.ano_calendario = 2024
				and coalesce(mes.data_matricula_turma,
				mes.data_cadastro) <= (
				select
					distinct fim_bim
				from
					datas_calendario
				where
					bimestre = 2)
				and ts.id_escola = 52232984 )
select
	distinct e.codigo_inep as codigo_inep,
	e.nome as escola,
	mes.turma,
	cc.nome as componente,
	d.matricula as matricula,
	p.nome as nome,
	p.codigo_inep as inep_aluno,
	mes.serie,
	2 || ' bim' as apontamento,
	mes.frequencia_concluida,
	mes.situacao_frequencia_turma
from
	levantamento_mes mes
join public.discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
left join escola.escola e on
	e.id_escola = mes.id_escola
left join ensino.componente_curricular cc on
	cc.id_componente_curricular = mes.id_componente
left join ensino.solicitacao_dispensa_estudante sde on
	sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
	and sde.id_status_solicitacao_dispensa_estudante = 2
	and sde.ativo
left join ensino.solicitacao_dispensa_estudante_componente sdec on
	sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
	and sdec.id_componente_curricular = cc.id_componente_curricular
	and sdec.ativo
left join ensino.solicitacao_dispensa_estudante_unidade sdeu on
	sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
	and sdeu.unidade = 2
	and sdeu.ativo
where
	true
	and mes.frequencia_concluida < 100
	and e.id_escola = 52232984
	and (sde.id_solicitacao_dispensa_estudante is null
		or sdec.id_solicitacao_dispensa_estudante_componente is null
		or sdeu.id_solicitacao_dispensa_estudante_unidade is null)
order by
	e.nome,
	mes.serie,
	p.nome; 