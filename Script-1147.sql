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
			mc.id_discente,
			cc.id_componente_curricular,
			cc.nome as disciplina,
			es.id_etapa_ensino,
			es.denominacao,
			sum(coalesce(mc.media_final, 0)) as media,
			sum(mc.frequencia) as frequencia,
			count(distinct mc.id_discente) as total
		from
			ensino.matricula_componente mc
		inner join basico.matricula_estudante_serie mes on			mes.id_estudante = mc.id_discente
		inner join ensino.turma t on			t.id_turma = mc.id_turma
		inner join basico.turma_serie ts on			ts.id_turma_serie = t.id_turma_serie
		inner join escola.escola e on			e.id_escola = ts.id_escola
		inner join basico.serie s on			s.id_serie = ts.id_serie
		inner join basico.etapa_ensino es on			es.id_etapa_ensino = s.id_etapa_ensino
		inner join ensino.componente_curricular cc on			cc.id_componente_curricular = t.id_disciplina
		inner join comum.unidade u on			u.id_unidade = e.id_regional_ensino
		inner join comum.municipio m on			m.id_municipio = e.id_municipio
		inner join comum.unidade_federativa uf on			uf.id_unidade_federativa = m.id_unidade_federativa
		where
			mes.ano_calendario = 2025
			--and es.id_etapa_ensino in (9)
			--and mes.id_estudante = 973649
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mc.ano = 2025
			and mc.id_situacao_matricula in ( 2, 5, 6, 8 )
		group by
			cc.id_componente_curricular,
			cc.nome,
			es.id_etapa_ensino,
			es.denominacao,
			mc.id_discente) a
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
			ts.id_turma_serie,
			sum(coalesce(mc.media_final, 0)) as media,
			sum(case when ts.id_tipo_turma_serie = 3 then mc.frequencia else 0 end ) as frequencia,
			count(distinct mc.id_discente) as total
		from basico.matricula_estudante_serie mes 
		join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie or ts.id_turma_serie = mes.id_turma_serie_multisseriado 
		join basico.serie s on s.id_serie = ts.id_serie 
		join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
		join ensino.matricula_componente mc on mc.id_turma = t.id_turma and mc.id_discente = mes.id_estudante 
		join basico.etapa_ensino es on es.id_etapa_ensino = s.id_etapa_ensino
		join ensino.componente_curricular cc on	cc.id_componente_curricular = t.id_disciplina
		join escola.escola e on	e.id_escola = ts.id_escola
		where
			mes.ano_calendario = 2025
			and mes.id_estudante = 976758
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
			and mc.ano = 2025
			and mc.id_situacao_matricula in ( 2, 5, 6, 8 )
		group by
			cc.id_componente_curricular,
			cc.nome,
			ts.id_turma_serie,
			es.id_etapa_ensino,
			es.denominacao,
			mc.id_discente;


WITH DetalhesAlunoComponente AS (
    SELECT
      -- mc.id_discente,
			cc.id_componente_curricular,
			cc.nome as disciplina,
			es.id_etapa_ensino,
			es.denominacao,
			sum(coalesce(mc.media_final, 0)) as media,
			sum(mc.frequencia) as frequencia,
			count(distinct mc.id_discente) as total -- Contagem de discentes por linha da subconsulta
    FROM basico.matricula_estudante_serie mes
    JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie OR ts.id_turma_serie = mes.id_turma_serie_multisseriado
    JOIN basico.serie s ON s.id_serie = ts.id_serie
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
    JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma AND mc.id_discente = mes.id_estudante
    JOIN basico.etapa_ensino es ON es.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    inner join comum.unidade u on u.id_unidade = e.id_regional_ensino
	inner join comum.municipio m on m.id_municipio = e.id_municipio
	inner join comum.unidade_federativa uf on uf.id_unidade_federativa = m.id_unidade_federativa
    WHERE
        mes.ano_calendario = 2025
        AND mes.id_estudante = 973649 -- Se quiser a média geral para todos os alunos, remova esta linha. 973649 --976758
        AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
        AND mc.ano = 2025
        AND mc.id_situacao_matricula IN (2, 5, 6, 8)
    GROUP BY
        mc.id_discente,
        cc.id_componente_curricular,
        cc.nome,
        es.id_etapa_ensino,
        es.denominacao,
        ts.id_turma_serie
)
select
--id_discente,
    id_componente_curricular,
    disciplina,
    id_etapa_ensino,
    denominacao,
    coalesce(cast(sum(media) / sum(total) AS NUMERIC(16, 1)), 0) AS media,
    coalesce(cast(sum(frequencia) / sum(total) AS NUMERIC(16, 1)), 0) AS faltas,
    sum(total) AS total_discentes_componente -- Total de discentes únicos que tiveram registro neste componente
FROM DetalhesAlunoComponente
GROUP by
--id_discente,
    id_componente_curricular,
    disciplina,
    id_etapa_ensino,
    denominacao
ORDER BY
    denominacao;


 WITH DetalhesAlunoComponente AS (
    SELECT
        mc.id_discente,
        cc.id_componente_curricular,
        cc.nome AS disciplina,
        es.id_etapa_ensino,
        es.denominacao,
        ts.id_turma_serie,
        SUM(coalesce(mc.media_final, 0)) AS media_soma,
        SUM(mc.frequencia) AS frequencia_soma,
        COUNT(DISTINCT mc.id_discente) AS total_discentes_unicos
    FROM basico.matricula_estudante_serie mes
    JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie OR ts.id_turma_serie = mes.id_turma_serie_multisseriado
    JOIN basico.serie s ON s.id_serie = ts.id_serie
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
    JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma AND mc.id_discente = mes.id_estudante
    JOIN basico.etapa_ensino es ON es.id_etapa_ensino = s.id_etapa_ensino
    JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    INNER JOIN comum.unidade u ON u.id_unidade = e.id_regional_ensino
    INNER JOIN comum.municipio m ON m.id_municipio = e.id_municipio
    INNER JOIN comum.unidade_federativa uf ON uf.id_unidade_federativa = m.id_unidade_federativa
    WHERE
        mes.ano_calendario = 2025
        AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
        --AND mc.ano = 2025
        AND mc.id_situacao_matricula IN (2, 5, 6, 8)
    GROUP BY
        mc.id_discente,
        cc.id_componente_curricular,
        cc.nome,
        es.id_etapa_ensino,
        es.denominacao,
        ts.id_turma_serie
),
AgregacaoComponente AS (
    SELECT
        id_componente_curricular,
        disciplina,
        id_etapa_ensino,
        denominacao,
        COALESCE(CAST(SUM(media_soma) / SUM(total_discentes_unicos) AS NUMERIC(16, 1)), 0) AS media_componente,
        COALESCE(CAST(SUM(frequencia_soma) / SUM(total_discentes_unicos) AS NUMERIC(16, 1)), 0) AS frequencia_componente,
        SUM(total_discentes_unicos) AS total_ocorrencias_componente
    FROM DetalhesAlunoComponente
    GROUP BY
        id_componente_curricular,
        disciplina,
        id_etapa_ensino,
        denominacao
)
SELECT
    id_componente_curricular,
    disciplina,
    id_etapa_ensino,
    denominacao,
    media_componente as media,
    frequencia_componente as faltas,
    total_ocorrencias_componente  as total
FROM AgregacaoComponente
WHERE frequencia_componente > 0 
ORDER BY
    denominacao, disciplina;
 
 
 
with DetalhesAlunoComponente as (
select
	mc.id_discente,
	cc.id_componente_curricular,
	cc.nome as disciplina,
	es.id_etapa_ensino,
	es.denominacao,
	ts.id_turma_serie,
	SUM(coalesce(mc.media_final, 0)) as media_soma,
	SUM(mc.frequencia) as frequencia_soma,
	COUNT(distinct mc.id_discente) as total_discentes_unicos
from
	basico.matricula_estudante_serie mes
join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
	or ts.id_turma_serie = mes.id_turma_serie_multisseriado
join basico.serie s on
	s.id_serie = ts.id_serie
join ensino.turma t on
	t.id_turma_serie = ts.id_turma_serie
join ensino.matricula_componente mc on
	mc.id_turma = t.id_turma
	and mc.id_discente = mes.id_estudante
join basico.etapa_ensino es on
	es.id_etapa_ensino = s.id_etapa_ensino
join ensino.componente_curricular cc on
	cc.id_componente_curricular = t.id_disciplina
join escola.escola e on
	e.id_escola = ts.id_escola
inner join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
inner join comum.municipio m on
	m.id_municipio = e.id_municipio
inner join comum.unidade_federativa uf on
	uf.id_unidade_federativa = m.id_unidade_federativa
where
	mes.ano_calendario = 2025
	and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
	and mc.id_situacao_matricula in ( 2, 5, 6, 8 )
group by
	mc.id_discente,
	cc.id_componente_curricular,
	cc.nome,
	es.id_etapa_ensino,
	es.denominacao,
	ts.id_turma_serie ) ,
AgregacaoComponente as (
select
	id_componente_curricular,
	disciplina,
	id_etapa_ensino,
	denominacao,
	coalesce(cast(SUM(media_soma) / SUM(total_discentes_unicos) as numeric(16, 1)), 0) as media_componente,
	coalesce(cast(SUM(frequencia_soma) / SUM(total_discentes_unicos) as numeric(16, 1)), 0) as frequencia_componente,
	SUM(total_discentes_unicos) as total_ocorrencias_componente
from
	DetalhesAlunoComponente
group by
	id_componente_curricular,
	disciplina,
	id_etapa_ensino,
	denominacao )
select
	id_componente_curricular,
	disciplina,
	id_etapa_ensino,
	denominacao,
	media_componente as media,
	frequencia_componente as faltas,
	total_ocorrencias_componente as total
from
	AgregacaoComponente
where
	frequencia_componente > 0
order by
	denominacao,
	disciplina; 