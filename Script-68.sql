 with notas as (
select
	nu.nota,
	cc.nome as componente,
	mc.id_discente,
	t.id_turma_serie
from
	ensino.nota_unidade nu
join ensino.matricula_componente mc on
	mc.id_matricula_componente = nu.id_matricula_componente
join ensino.turma t on
	t.id_turma = mc.id_turma
join ensino.componente_curricular cc on
	cc.id_componente_curricular = mc.id_componente_curricular
	and cc.id_componente_curricular <> 220
where
	nu.unidade = 4
	and nu.ativo
	and (nu.id_descricao_nota in (4, 6, 21)
		or nu.id_descricao_nota is null)
	and mc.ano = 2023
	and mc.id_situacao_matricula in ( 5, 6, 2, 8 ) ),
levantamento as (
select
	e.nome as unidade,
	ee.denominacao as etapa_Ensino,
	s.descricao as serie,
	t.descricao as turno,
	n.id_turma_serie,
	n.componente as componente_Curricular,
	count(distinct n.id_discente) filter (
	where n.nota >= 7.0 ) as total_alunos_acima_media,
	count(distinct mes.id_matricula_discente_serie) as total_alunos
from
	escola.escola e
join basico.turma_serie ts on
	ts.id_escola = e.id_escola
join basico.serie s on
	s.id_serie = ts.id_serie
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno t on
	t.id_turno = ts.id_turno
join basico.matricula_estudante_serie mes on
	coalesce(mes.id_turma_serie_multisseriado,
	mes.id_turma_serie) = ts.id_turma_serie
left join notas n on
	n.id_discente = mes.id_estudante
		and n.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
		mes.id_turma_serie)
	where
		ts.ano = 2023
		and ts.ativo
		and ts.tipo_diario in ( 0, 2, 3, 4, 5, 10, 11, 12, 13, 15, 17, 28, 29, 30, 32, 33, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 55, 56, 57, 58, 59, 60 )
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
				and e.id_escola = 51870576
				and (case
					when ts.tipo_diario = 11 then mes.id_turma_serie_multisseriado is not null
					else true
				end)
			group by
				e.nome,
				ee.denominacao,
				s.descricao,
				t.descricao,
				n.id_turma_serie,
				n.componente
			order by
				e.nome )
select
	*,
	ROUND((cast(total_alunos_acima_media as numeric) * 100 / total_alunos),
	2) as percent_alunos_acima_media
from
	levantamento