select
	e.nome as escola,
	ee.denominacao as etapa_ensino,
	s.descricao as serie,
	sum(case when mes.id_situacao_matricula_serie = 2 then 1 else 0 end) as APROVADO,
	sum(case when mes.id_situacao_matricula_serie = 3 then 1 else 0 end) as REPROVADO,
	sum(case when mes.id_situacao_matricula_serie = 8 then 1 else 0 end) as REPR_FREQUENCIA,
	sum(case when mes.id_situacao_matricula_serie = 4 then 1 else 0 end) as DEIXOU_DE_FREQUENTAR,
	sum(case when mes.id_situacao_matricula_serie = -1 then 1 else 0 end) as SEM_MOVIMENTACAO,
	sum(case when mes.id_situacao_matricula_serie = 7 then 1 else 0 end) as PROGRESSAO_PARCIAL,
	sum(case when mes.id_situacao_matricula_serie = 10 then 1 else 0 end) as APENAS_PROG_PARCIAL,
	count(mes.id_estudante) as total
from
	escola.escola e
join escola.escola_etapa_ensino_serie eees on
	e.id_escola = eees.id_escola
join basico.serie s on
	eees.id_serie = s.id_serie
join basico.etapa_ensino ee on
	s.id_etapa_ensino = ee.id_etapa_ensino
join basico.nivel_etapa_ensino nee on nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
join basico.matricula_estudante_serie mes on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join basico.situacao_matricula_serie sms on
	mes.id_situacao_matricula_serie = sms.id_situacao_matricula_serie
where
	mes.id_situacao_matricula_serie in ( 2, 3, 8, 4,-1, 7, 10 )
	and mes.ano_calendario = 2023
group by
	(e.nome,
	ee.denominacao,
	s.descricao)
order by
	e.nome;
	
WITH test AS (
    SELECT
        e.nome AS escola,
        ee.denominacao AS etapa_ensino,
        s.descricao AS serie,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = 2 THEN 1 ELSE 0 END) AS APROVADO,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = 3 THEN 1 ELSE 0 END) AS REPROVADO,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = 8 THEN 1 ELSE 0 END) AS REPR_FREQUENCIA,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = 4 THEN 1 ELSE 0 END) AS DEIXOU_DE_FREQUENTAR,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = -1 THEN 1 ELSE 0 END) AS SEM_MOVIMENTACAO,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = 7 THEN 1 ELSE 0 END) AS PROGRESSAO_PARCIAL,
        SUM(CASE WHEN mes.id_situacao_matricula_serie = 10 THEN 1 ELSE 0 END) AS APENAS_PROG_PARCIAL,
        COUNT(mes.id_estudante) AS total
    FROM
        escola.escola e
    JOIN escola.escola_etapa_ensino_serie eees ON
        e.id_escola = eees.id_escola
    JOIN basico.serie s ON
        eees.id_serie = s.id_serie
    JOIN basico.etapa_ensino ee ON
        s.id_etapa_ensino = ee.id_etapa_ensino
    JOIN basico.nivel_etapa_ensino nee ON
        nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
    JOIN basico.matricula_estudante_serie mes ON
        eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
    JOIN basico.situacao_matricula_serie sms ON
        mes.id_situacao_matricula_serie = sms.id_situacao_matricula_serie
    WHERE
        mes.id_situacao_matricula_serie IN ( 3)
        AND mes.ano_calendario = 2023
    GROUP BY
        e.nome, ee.denominacao, s.descricao
)
SELECT
    *,
    (SELECT SUM(total) FROM test) AS total_estudantes
FROM
    test;