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


 select * from ensino.matricula_componente mc where mc.id_discente = 976758 and mc.ano = 2025; and mc.id_situacao_matricula =2;

 select * from ensino.matricula_componente mc where mc.id_turma in (684733,684735,684734,684732,684731,684729,684730)  and mc.ano = 2025 and mc.id_discente = 976758
 
 
 
 select string_agg(id_turma :: varchar , ',') from ensino.turma where id_turma_serie = 52211587;
 
 
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
        -- REMOVA ESTA LINHA PARA VER TODAS AS ETAPAS DE ENSINO
        -- AND es.id_etapa_ensino IN (9)
      --  AND mes.id_estudante = 973649 -- Aluno específico.
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
    media_componente,
    frequencia_componente,
    total_ocorrencias_componente
FROM AgregacaoComponente
WHERE frequencia_componente > 0 -- Filtro para incluir apenas componentes com faltas > 0
ORDER BY
    denominacao, disciplina;