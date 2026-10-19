with turmas as (
select
	*
from
	ensino.turma t
where
	t.id_turma_agrupadora = 689517
	and t.id_situacao_turma <> 4 )
select
	mc.id_discente,
	sum(coalesce(mc.media_anual, 0.0)) as soma_ma,
	sum(coalesce(mc.media_final, 0.0)) as soma_mf,
	count(mc.id_matricula_componente) as qtd_disciplinas,
	sum(case when mc.media_anual is null then 1 else 0 end) as qtd_nao_finalizada
from
	turmas t
join ensino.matricula_componente mc on
	t.id_turma = mc.id_turma
where
	mc.id_situacao_matricula in ( 5, 6, 2, 8 )
	and mc.id_discente = 975261
group by
	mc.id_discente;