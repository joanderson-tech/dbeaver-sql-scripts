with turma_serie as (
select
	id_turma_serie
from
	basico.turma_serie ts
join basico.serie s on
	s.id_serie = ts.id_serie
where
	ts.ano = 2024
	and s.id_serie <> 58413194
	and s.id_etapa_ensino <> 14
	and ts.id_escola = 52232930 ),
datas_calendario as (
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
notas as (
select
	mc.id_turma as turma,
	mc.id_matricula_componente,
	mes.id_matricula_discente_serie,
	mc.id_componente_curricular as id_componente,
	cc.nome as componente,
	t.id_categoria_componente as categoria,
	nu.nota as avaliacao
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
join turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join basico.matricula_estudante_serie mes on
	mes.id_estudante = mc.id_discente
	and coalesce(mes.id_turma_serie_multisseriado,
	mes.id_turma_serie) = t.id_turma_serie
left join ensino.nota_unidade nu on
	nu.id_matricula_componente = mc.id_matricula_componente
		and nu.ativo
		and nu.id_descricao_nota = 21
		and nu.unidade = 3
	join ensino.componente_curricular cc on
		cc.id_componente_curricular = mc.id_componente_curricular
	left join ensino.solicitacao_dispensa_estudante sde on
		sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		and sde.id_status_solicitacao_dispensa_estudante = 2
		and sde.ativo
	left join ensino.solicitacao_dispensa_estudante_componente sdec on
		sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
		and sdec.id_componente_curricular = mc.id_componente_curricular
		and sdec.ativo
	left join ensino.solicitacao_dispensa_estudante_unidade sdeu on
		sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
		and sdeu.unidade = 3
		and sdeu.ativo
	where
		mc.ano = 2024
		and mc.id_situacao_matricula not in ( 7, 3, 9, 4, 11 )
			and t.id_disciplina <> 220
			and t.ano = 2024
			and t.id_situacao_turma <> 4
			and mes.ano_calendario = 2024
			and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
				and (sde.id_solicitacao_dispensa_estudante is null
					or sdec.id_solicitacao_dispensa_estudante_componente is null
					or sdeu.id_solicitacao_dispensa_estudante_unidade is null)),
levantamento_notas as (
select
	n.id_matricula_discente_serie,
	n.componente,
	case
		when every(n.avaliacao is not null) then 'concluído'
		else 'pendente'
	end as apontamento
from
	notas n
group by
	n.id_matricula_discente_serie,
	componente ),
relatorios_avaliativos as (
select
	mc.id_turma as turma,
	mc.id_matricula_componente,
	mes.id_matricula_discente_serie,
	mc.id_componente_curricular as id_componente,
	cc.nome as componente,
	t.id_categoria_componente as categoria,
	case
		when crc.id_tipo_avaliacao_componente_relatorio = 2
			and rahr.id_opcao_grupo_avaliacao_relatorio is not null then true
			when crc.id_tipo_avaliacao_componente_relatorio = 1
			and (rac.avaliacao_descritiva <> ''
				and rac.avaliacao_descritiva is not null) then true
			else false
		end as avaliacao
	from
		ensino.matricula_componente mc
	join ensino.turma t on
		t.id_turma = mc.id_turma
	join turma_serie ts on
		ts.id_turma_serie = t.id_turma_serie
	join basico.matricula_estudante_serie mes on
		mes.id_estudante = mc.id_discente
		and coalesce(mes.id_turma_serie_multisseriado,
		mes.id_turma_serie) = t.id_turma_serie
	left join ensino_infantil.relatorio_avaliativo_componente rac on
		rac.id_matricula_componente = mc.id_matricula_componente
	left join ensino_infantil.relatorio_avaliativo ra on
		ra.id_relatorio_avaliativo = rac.id_relatorio_avaliativo
			and ra.ativo
		left join ensino_infantil.relatorio_avaliativo_habilidade rah on
			rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
		left join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on
			rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
			and rahr.periodo = 3
		join ensino.componente_curricular cc on
			cc.id_componente_curricular = mc.id_componente_curricular
		left join ensino_infantil.configuracao_relatorio_componente crc on
			crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
		left join ensino.solicitacao_dispensa_estudante sde on
			sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
			and sde.id_status_solicitacao_dispensa_estudante = 2
			and sde.ativo
		left join ensino.solicitacao_dispensa_estudante_componente sdec on
			sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
			and sdec.id_componente_curricular = mc.id_componente_curricular
			and sdec.ativo
		left join ensino.solicitacao_dispensa_estudante_unidade sdeu on
			sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
			and sdeu.unidade = 3
		where
			mc.ano = 2024
			and mc.id_situacao_matricula not in ( 7, 3, 9, 4, 11 )
				and t.id_disciplina <> 220
				and t.ano = 2024
				and t.id_situacao_turma <> 4
				and mes.ano_calendario = 2024
				and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
					and (sde.id_solicitacao_dispensa_estudante is null
						or sdec.id_solicitacao_dispensa_estudante_componente is null
						or sdeu.id_solicitacao_dispensa_estudante_unidade is null)),
levantamento_relatorios as (
select
	r.id_matricula_discente_serie,
	r.componente,
	case
		when every(r.avaliacao) then 'concluído'
		else 'pendente'
	end as apontamento
from
	relatorios_avaliativos r
group by
	r.id_matricula_discente_serie,
	r.componente ),
levantamento_avaliacao_diversificada as (
select
	id_matricula_discente_serie,
	componente,
	case
		when every(apontamento = 'concluído') then 'concluído'
		else 'pendente'
	end as apontamento
from
	(
	select
		n.id_matricula_discente_serie,
		n.componente,
		case
			when every(n.avaliacao is not null) then 'concluído'
			else 'pendente'
		end as apontamento
	from
		notas n
	where
		n.categoria = 1
	group by
		n.id_matricula_discente_serie,
		n.componente
union all
	select
		r.id_matricula_discente_serie,
		r.componente,
		case
			when every(r.avaliacao) then 'concluído'
			else 'pendente'
		end as apontamento
	from
		relatorios_avaliativos r
	where
		r.categoria = 2
	group by
		r.id_matricula_discente_serie,
		r.componente) as foo
group by
	id_matricula_discente_serie,
	componente ),
levantamento_mes as (
select
	mes.id_estudante,
	coalesce(ts.nome,
	'NÃO ALOCADO EM TURMA') as turma,
	coalesce(ts.id_escola,
	eees.id_escola) as id_escola,
	s.descricao as serie,
	case
		when (3 = 1
			and 2024 = 2023
			and ts.id_escola in (53279324, 52927029))
			or s.id_etapa_ensino in (51876105, 51876110, 51876139) then 'concluído'
			else coalesce( case
				when cb.tipo_diario in (51, 52, 53)
					and cb.tipo_diario_diversificado is null then le.apontamento
					when cb.tipo_diario in (54) then lr.apontamento
					when cb.tipo_diario in (51, 52, 53)
						and cb.tipo_diario_diversificado is not null then lad.apontamento
					end,
					'NA')
		end as apontamento_desempenho_concluido,
		coalesce( case
			when cb.tipo_diario in (51, 52, 53)
				and cb.tipo_diario_diversificado is null then le.componente
				when cb.tipo_diario in (54) then lr.componente
				when cb.tipo_diario in (51, 52, 53)
					and cb.tipo_diario_diversificado is not null then lad.componente
				end,
				'NA') as componente
	from
		basico.matricula_estudante_serie mes
	left join levantamento_notas le on
		le.id_matricula_discente_serie = mes.id_matricula_discente_serie
	left join levantamento_relatorios lr on
		lr.id_matricula_discente_serie = mes.id_matricula_discente_serie
	left join levantamento_avaliacao_diversificada lad on
		lad.id_matricula_discente_serie = mes.id_matricula_discente_serie
	left join basico.turma_serie ts on
		ts.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
		mes.id_turma_serie)
	left join basico.curriculo_basico cb on
		cb.id_curriculo_basico = ts.id_curriculo_medio
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
				bimestre = 3)
			and ts.id_escola = 52232930 )
select
	distinct e.codigo_inep as codigo_inep,
	e.nome as escola,
	mes.turma,
	d.matricula as matricula,
	p.nome as nome,
	p.codigo_inep as inep_aluno,
	mes.serie,
	3 || ' bim' as apontamento,
	mes.apontamento_desempenho_concluido,
	mes.componente
from
	levantamento_mes mes
join public.discente d on
	d.id_discente = mes.id_estudante
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
left join escola.escola e on
	e.id_escola = mes.id_escola
where
	true
	and mes.apontamento_desempenho_concluido <> 'concluído'
	and e.id_escola = 52232930
order by
	e.nome,
	mes.serie,
	p.nome;
	
select matricula , id_pessoa , *  from discente d  where d.matricula = '202352758313';

select * from basico.matricula_estudante_serie mes where id_estudante = 1339505;

select * from basico.turma_serie ts where ts.nome = ''
