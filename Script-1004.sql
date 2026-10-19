 
from ensino.matricula_componente mc
inner join basico.matricula_estudante_serie mes on
mes.id_estudante = mc.id_discente
inner join ensino.turma t on
t.id_turma = mc.id_turma
inner join basico.turma_serie ts on
ts.id_turma_serie = t.id_turma_serie
inner join escola.escola e on
e.id_escola = ts.id_escola
inner join basico.serie s on
s.id_serie = ts.id_serie
inner join basico.etapa_ensino es on
es.id_etapa_ensino = s.id_etapa_ensino
inner join ensino.componente_curricular cc on
cc.id_componente_curricular = t.id_disciplina
inner join comum.unidade u on
u.id_unidade = e.id_regional_ensino
inner join comum.municipio m on
m.id_municipio = e.id_municipio
inner join comum.unidade_federativa uf on
uf.id_unidade_federativa = m.id_unidade_federativa
where
mes.ano_calendario = :ano
and mes.id_situacao_matricula_serie in :situacoes

 select
	*
from
	(
	select
		id_componente_curricular,
		disciplina,
		id_etapa_ensino,
		denominacao,
		coalesce(cast(sum(media)/ sum(total) as numeric(16, 1)), 0) as media,
		coalesce(cast(sum(frequencia)/ sum(total) as numeric(16, 1)), 0) as faltas,
		sum(total) as total
	from
		(
		select
			cc.id_componente_curricular,
			cc.nome as disciplina,
			es.id_etapa_ensino,
			es.denominacao,
			sum(coalesce(mc.media_final, 0)) as media,
			sum(mc.frequencia) as frequencia,
			count(distinct mc.id_discente) as total
		from
			ensino.matricula_componente mc
		inner join basico.matricula_estudante_serie mes on
			mes.id_estudante = mc.id_discente
		inner join ensino.turma t on
			t.id_turma = mc.id_turma
		inner join basico.turma_serie ts on
			ts.id_turma_serie = t.id_turma_serie
		inner join escola.escola e on
			e.id_escola = ts.id_escola
		inner join basico.serie s on
			s.id_serie = ts.id_serie
		inner join basico.etapa_ensino es on
			es.id_etapa_ensino = s.id_etapa_ensino
		inner join ensino.componente_curricular cc on
			cc.id_componente_curricular = t.id_disciplina
		inner join comum.unidade u on
			u.id_unidade = e.id_regional_ensino
		inner join comum.municipio m on
			m.id_municipio = e.id_municipio
		inner join comum.unidade_federativa uf on
			uf.id_unidade_federativa = m.id_unidade_federativa
		where
			mes.ano_calendario = 2025
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mc.ano = 2025
			and mc.id_situacao_matricula in ( 2, 5, 6, 8 )
		group by
			cc.id_componente_curricular,
			cc.nome,
			es.id_etapa_ensino,
			es.denominacao ) a
	group by
		1,
		2,
		3,
		4 ) b
where
	faltas > 0
order by
	denominacao,
	disciplina;
 
 select
    mc.id_discente,
    cc.id_componente_curricular,
    cc.nome as disciplina,
    es.id_etapa_ensino,
    es.denominacao,
    sum(coalesce(mc.media_final, 0)) as media,
    SUM(mc.frequencia) as frequencia,
    count(distinct mc.id_discente) as total
from
    ensino.matricula_componente mc
inner join basico.matricula_estudante_serie mes on mes.id_estudante = mc.id_discente
inner join ensino.turma t on t.id_turma = mc.id_turma
inner join basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie
inner join escola.escola e on
    e.id_escola = ts.id_escola
inner join basico.serie s on
    s.id_serie = ts.id_serie
inner join basico.etapa_ensino es on
    es.id_etapa_ensino = s.id_etapa_ensino
inner join ensino.componente_curricular cc on
    cc.id_componente_curricular = t.id_disciplina
inner join comum.unidade u on
    u.id_unidade = e.id_regional_ensino
inner join comum.municipio m on
    m.id_municipio = e.id_municipio
inner join comum.unidade_federativa uf on
    uf.id_unidade_federativa = m.id_unidade_federativa
where
    mes.ano_calendario = 2025
    --and es.id_etapa_ensino in (9)
    and mes.id_estudante = 976758
    and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
    and mc.ano = 2025
    and mc.id_situacao_matricula in ( 2, 5, 6, 8 )
group by
    cc.id_componente_curricular,
    cc.nome,
    es.id_etapa_ensino,
    es.denominacao,
    mc.id_discente;