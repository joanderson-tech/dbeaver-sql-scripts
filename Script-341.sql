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
	and ts.id_escola = 52232958 ),
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
alocacoes_ativas as (
select
	dt.id_turma,
	dt.id_docente,
	dt.id_docente_turma,
	p.nome as professor
from
	ensino.docente_turma dt
join rh.servidor s on
	s.id_servidor = dt.id_docente
join comum.pessoa p on
	p.id_pessoa = s.id_pessoa
where
	dt.ativo
	and not dt.finalizada
	and dt.data_inicio <= current_date
	and current_date <= dt.data_fim ),
professor_turma as (
select
	t.id_turma,
	dt.id_turma as turma,
	dt.id_docente_turma as alocacao,
	dt_polivalente.id_turma as turma_polivalente,
	dt_polivalente.id_docente_turma as alocacao_polivalente,
	dt_multi.id_docente_turma as alocacao_multi,
	dt_multi.id_turma as turma_multi,
	dt_multi_polivalente.id_docente_turma as alocacao_multi_polivalente,
	dt_multi_polivalente.id_turma as turma_multi_polivalente,
	coalesce(dt.professor,
	dt_polivalente.professor,
	dt_multi.professor,
	dt_multi_polivalente.professor) as professor
from
	ensino.turma t
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
left join ensino.turma t_multi on
	t_multi.id_turma_serie = ts.id_turma_serie_agrupadora
	and t_multi.id_disciplina = t.id_disciplina
left join alocacoes_ativas dt on
	dt.id_turma = t.id_turma
left join alocacoes_ativas dt_polivalente on
	dt_polivalente.id_turma = t.id_turma_agrupadora
left join alocacoes_ativas dt_multi on
	dt_multi.id_turma = t_multi.id_turma
left join alocacoes_ativas dt_multi_polivalente on
	dt_multi_polivalente.id_turma = t_multi.id_turma_agrupadora
where
	t.id_situacao_turma <> 4
	and t.ano = 2024 ),
notas as (
select
	mc.id_turma as turma,
	nu.nota as nota
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
		and nu.unidade = 1
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
		and sdeu.unidade = 1
		and sdeu.ativo
	where
		true
		and mc.ano = 2024
		and mc.id_situacao_matricula not in ( 7, 3, 9, 4, 11 )
			and t.id_disciplina <> 220
			and t.ano = 2024
			and t.id_situacao_turma <> 4
			and mes.ano_calendario = 2024
			and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
				and coalesce(mes.data_matricula_turma,
				mes.data_cadastro) <= (
				select
					distinct fim_bim
				from
					datas_calendario
				where
					bimestre = 1)
				and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
					and (sde.id_solicitacao_dispensa_estudante is null
						or sdec.id_solicitacao_dispensa_estudante_componente is null
						or sdeu.id_solicitacao_dispensa_estudante_unidade is null)),
relatorios_avaliativos as (
select
	mc.id_turma as turma,
	rahr.id_opcao_grupo_avaliacao_relatorio as resposta
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
left join ensino_infantil.relatorio_avaliativo_habilidade rah on
	rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
left join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on
	rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
		and rahr.periodo = 1
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
		and sdeu.unidade = 1
		and sdeu.ativo
	where
		true
		and mc.ano = 2024
		and ra.ativo
		and mc.id_situacao_matricula not in ( 7, 3, 9, 4, 11 )
			and t.id_disciplina <> 220
			and t.ano = 2024
			and t.id_situacao_turma <> 4
			and mes.ano_calendario = 2024
			and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
				and coalesce(mes.data_matricula_turma,
				mes.data_cadastro) <= (
				select
					distinct fim_bim
				from
					datas_calendario
				where
					bimestre = 1)
				and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
					and (sde.id_solicitacao_dispensa_estudante is null
						or sdec.id_solicitacao_dispensa_estudante_componente is null
						or sdeu.id_solicitacao_dispensa_estudante_unidade is null)),
levantamento_turmas as (
select
	e.codigo_inep as codigo,
	e.nome as escola,
	ee.denominacao as curso,
	s.descricao as serie,
	ts.nome as turma,
	pt.professor,
	case
		when (1 = 1
			and 2024 = 2023
			and e.id_escola in (53279324, 52927029))
			or ee.id_etapa_ensino in (51876105, 51876110, 51876139) then 'concluído'
			when ts.tipo_diario = 11
				or turma.id_disciplina = 220 then 'turma agrupadora'
				when (case
					when cbc.id_categoria_componente = 2
						and cb.possui_parte_diversificada then cb.tipo_diario_diversificado
						else cb.tipo_diario
					end) in (51, 52, 53) then (
				select
					case
						when coalesce(every(nota is not null),
						true) then 'concluído'
						else 'pendente'
					end as situacao
				from
					notas n
				where
					n.turma = turma.id_turma )
				when (case
					when cbc.id_categoria_componente = 2
						and cb.possui_parte_diversificada then cb.tipo_diario_diversificado
						else cb.tipo_diario
					end) in (54) then (
				select
					case
						when coalesce(every(resposta is not null),
						true) then 'concluído'
						else 'pendente'
					end as situacao
				from
					relatorios_avaliativos r
				where
					r.turma = turma.id_turma )
			end as apontamento_desempenho_concluido,
			ts.id_turno,
			turma.id_disciplina,
			ts.id_turma_serie,
			e.id_escola
		from
			escola.escola e
		join basico.turma_serie ts on
			ts.id_escola = e.id_escola
		join ensino.turma turma on
			turma.id_turma_serie = ts.id_turma_serie
		join professor_turma pt on
			pt.id_turma = turma.id_turma
			and pt.professor is not null
		join basico.serie s on
			s.id_serie = ts.id_serie
		join basico.etapa_ensino ee on
			ee.id_etapa_ensino = s.id_etapa_ensino
		join basico.curriculo_basico cb on
			cb.id_curriculo_basico = ts.id_curriculo_medio
		join basico.curriculo_basico_componente cbc on
			cbc.id_curriculo_basico = cb.id_curriculo_basico
			and cbc.id_componente_curricular = turma.id_disciplina
		where
			ts.ativo
			and ts.id_tipo_turma_serie <> 3
			and ts.ano = 2024
			and turma.id_situacao_turma <> 4
			and turma.id_disciplina <> 220 )
select
	distinct lt.codigo,
	lt.escola,
	lt.curso,
	lt.serie,
	lt.turma,
	t.descricao as turno,
	cc.nome as componente_curricular,
	lt.professor,
	1 || ' bim' as apontamento,
	lt.apontamento_desempenho_concluido,
	'' as monitoramento_conteudos,
	'' as situacao_didatica,
	'' as aprovacao_professor,
	'' as aprovacao_coordenador,
	'' as aprovacao_gestor
from
	levantamento_turmas lt
join ensino.turno t on
	t.id_turno = lt.id_turno
join ensino.componente_curricular cc on
	cc.id_componente_curricular = lt.id_disciplina
where true 
	AND lt.apontamento_desempenho_concluido <> 'concluído'
	AND EXISTS (
	SELECT 1 FROM basico.matricula_estudante_serie mes
	WHERE (mes.id_turma_serie = lt.id_turma_serie
	OR mes.id_turma_serie_multisseriado = lt.id_turma_serie)
	AND mes.ano_calendario = 2024
	AND mes.id_situacao_matricula_serie NOT in (4,5,6,9,12))
	AND lt.id_escola = 52232958
	ORDER BY lt.escola, lt.turma, lt.curso, lt.serie, cc.nome;
	


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	