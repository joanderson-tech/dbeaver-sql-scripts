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
		select mes.id_estudante,
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
			and mes.id_estudante= 973472
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mc.id_situacao_matricula in ( 5, 6, 4, 3, 7 )
		group by
		mes.id_estudante,
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
 
 select * from ensino.matricula_componente mc where mc.id_discente = 973472 and mc.id_componente_curricular = 229;
 
 
 select mes.id_estudante,
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
			and mc.ano = 2025
			and mes.id_estudante= 973472
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mc.id_situacao_matricula in ( 2, 3, 4, 5, 6, 7 )
		group by
		mes.id_estudante,
			cc.id_componente_curricular,
			cc.nome,
			es.id_etapa_ensino,
			es.denominacao;
 
 SELECT sm.* FROM ensino.situacao_matricula AS sm;
 
 [{total = 7,
faltas = 740.6,
id = 220,
disciplina = Atividade Polivalente,
tfaltas = 105.799995,
tmedia = 0.0,
media = 0.0 },
{total = 1,
faltas = 100.0,
id = 293,
disciplina = ATIVIDADE POLIVALENTE B,
tfaltas = 100.0,
tmedia = 0.0,
media = 0.0 },
{total = 1,
faltas = 0.2,
id = 507,
disciplina = CORPO,
GESTOS E MOVIMENTOS,
tfaltas = 0.2,
tmedia = 0.0,
media = 0.0 },
{total = 1,
faltas = 0.2,
id = 509,
disciplina = ESCUTA,
FALA,
PENSAMENTO E IMAGINAÇÃO,
tfaltas = 0.2,
tmedia = 0.0,
media = 0.0 },
{total = 1,
faltas = 0.2,
id = 510,
disciplina = ESPAÇOS,
TEMPOS,
QUANTIDADES,
RELAÇÕES E TRANSFORMAÇÕES,
tfaltas = 0.2,
tmedia = 0.0,
media = 0.0 },
{total = 1,
faltas = 0.2,
id = 506,
disciplina = O EU,
O OUTRO E O NÓS,
tfaltas = 0.2,
tmedia = 0.0,
media = 0.0 },
{total = 1,
faltas = 0.2,
id = 508,
disciplina = TRAÇOS,
SONS,
CORES E FORMAS,
tfaltas = 0.2,
tmedia = 0.0,
media = 0.0 },
{total = 4,
faltas = 385.0,
id = 229,
disciplina = Arte,
tfaltas = 96.25,
tmedia = 6.85,
media = 27.4 },
{total = 4,
faltas = 385.2,
id = 223,
disciplina = Ciências,
tfaltas = 96.3,
tmedia = 6.425,
media = 25.7 },
{total = 4,
faltas = 386.69998,
id = 225,
disciplina = Geografia,
tfaltas = 96.674995,
tmedia = 6.4750004,
media = 25.900002 },
{total = 4,
faltas = 394.50003,
id = 224,
disciplina = História,
tfaltas = 98.62501,
tmedia = 6.575,
media = 26.3 },
{total = 4,
faltas = 405.80002,
id = 221,
disciplina = Língua Portuguesa,
tfaltas = 101.450005,
tmedia = 6.5,
media = 26.0 },
{total = 4,
faltas = 385.19998,
id = 222,
disciplina = Matemática,
tfaltas = 96.299995,
tmedia = 6.175,
media = 24.7 },
{total = 4,
faltas = 394.7,
id = 238,
disciplina = Educação Física,
tfaltas = 98.675,
tmedia = 4.9,
media = 19.6 },
{total = 2,
faltas = 202.9,
id = 227,
disciplina = Língua Inglesa,
tfaltas = 101.45,
tmedia = 7.2000003,
media = 14.400001 },
{total = 1,
faltas = 63.2,
id = 514,
disciplina = PROJETO COMPLEMENTAR EJA,
tfaltas = 63.2,
tmedia = 2.2,
media = 2.2 },
{total = 1,
faltas = 0.6,
id = 239,
disciplina = Ensino da Língua Portuguesa,
tfaltas = 0.6,
tmedia = 0.0,
media = 0.0 }]