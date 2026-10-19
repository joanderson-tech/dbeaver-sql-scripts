with faltas as (
select
	fa.id_discente,
	ts1.id_turma_serie,
	coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end),
	0) as faltas
from
	ensino.frequencia_aluno fa
inner join ensino.turma t on
	t.id_turma = fa.id_turma
inner join basico.turma_serie ts1 on
	ts1.id_turma_serie = t.id_turma_serie
where
	fa.frequencia > 0
	and extract(month
from
	fa.data) = 6
group by
	fa.id_discente,
	ts1.id_turma_serie )
select
	e.nome as nome_escola,
	ts.nome as nome_turma,
	ts.id_turma_serie as id_turma_serie,
	s.descricao as nome_serie,
	d.matricula as matricula_estudante,
	p.nome as nome_estudante,
	est.participa_bolsa_familia as participa_bolsa_familia,
	coalesce(f.faltas,
	0) as faltas,
	-- Nova coluna "transferido" que indica se o aluno foi transferido
    CASE 
        WHEN mes.id_situacao_matricula_serie IN (6) THEN 'Sim' 
        ELSE 'Não' 
    END AS transferido,
    mee."data" 
from
	basico.matricula_estudante_serie mes
join public.discente d on
	d.id_discente = mes.id_estudante
join basico.estudante est on
	est.id_estudante = d.id_discente
join comum.pessoa p on
	p.id_pessoa = d.id_pessoa
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
	and eees.ativo
left join basico.turma_serie ts on
	ts.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
	mes.id_turma_serie)
left join escola.escola e on
	e.id_escola = coalesce(ts.id_escola,
	eees.id_escola)
left join basico.serie s on
	s.id_serie = coalesce(ts.id_serie,
	eees.id_serie)
left join basico.etapa_ensino es on
	es.id_etapa_ensino = s.id_etapa_ensino
left join matricula.movimentacao_estudante_escola mee on mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
left join faltas f on
	f.id_discente = d.id_discente
	and f.id_turma_serie = ts.id_turma_serie
where
	 mes.ano_calendario = 2024
	and e.id_escola = 52232930
	and s.id_serie = 1005223
	and est.participa_bolsa_familia = true
	AND EXTRACT(MONTH FROM mes.data_cadastro) <= 6
	AND (mee."data" IS NULL OR EXTRACT(MONTH FROM mee."data") >= 6)
	and exists (
	select
		1
	from
		ensino.frequencia_aluno fa
	inner join ensino.turma t on
		t.id_turma = fa.id_turma
	inner join basico.turma_serie ts1 on
		ts1.id_turma_serie = t.id_turma_serie
	where
		fa.id_discente = d.id_discente
		and fa.frequencia > 0
		and ts1.id_turma_serie = ts.id_turma_serie )
	and ts.id_turma_serie is not null
order by
	e.nome,
	ts.nome,
	p.nome;
	
-- CTE para alunos que possuem frequência registrada, otimizando EXISTS
WITH alunos_com_frequencia AS (
    SELECT DISTINCT fa.id_discente
    FROM ensino.frequencia_aluno fa
    WHERE fa.frequencia > 0
),
-- CTE para cálculo de faltas
faltas AS (
    SELECT
        fa.id_discente,
        ts1.id_turma_serie,
        COALESCE(SUM(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END)::INTEGER, 0) AS faltas
    FROM ensino.frequencia_aluno fa
    INNER JOIN ensino.turma t ON t.id_turma = fa.id_turma
    INNER JOIN basico.turma_serie ts1 ON ts1.id_turma_serie = t.id_turma_serie
    WHERE fa.frequencia > 0
    AND EXTRACT(MONTH FROM fa.data) = 6
    GROUP BY fa.id_discente, ts1.id_turma_serie
)
-- Consulta principal
SELECT
    e.nome AS nome_escola,
    ts.nome AS nome_turma,
    ts.id_turma_serie AS id_turma_serie,
    s.descricao AS nome_serie,
    d.matricula AS matricula_estudante,
    p.nome AS nome_estudante,
    est.participa_bolsa_familia AS participa_bolsa_familia,
    COALESCE(f.faltas, 0) AS faltas
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON d.id_discente = mes.id_estudante
JOIN basico.estudante est ON est.id_estudante = d.id_discente
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
JOIN escola.escola_etapa_ensino_serie eees 
    ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
    AND eees.ativo
LEFT JOIN basico.turma_serie ts 
    ON ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
LEFT JOIN escola.escola e ON e.id_escola = COALESCE(ts.id_escola, eees.id_escola)
LEFT JOIN basico.serie s ON s.id_serie = COALESCE(ts.id_serie, eees.id_serie)
LEFT JOIN basico.etapa_ensino es ON es.id_etapa_ensino = s.id_etapa_ensino
LEFT JOIN matricula.movimentacao_estudante_escola mee 
    ON mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
LEFT JOIN faltas f 
    ON f.id_discente = d.id_discente
    AND f.id_turma_serie = ts.id_turma_serie
WHERE
    mes.ano_calendario = 2024
    AND e.id_escola = 52232930
    AND s.id_serie = 1005223
    and ts.nome ilike '%EFAFT6B%'
    AND es.id_etapa_ensino = 4
    AND est.participa_bolsa_familia = TRUE
    AND EXTRACT(MONTH FROM mes.data_cadastro) <= 6
    AND (mee.data IS NULL OR EXTRACT(MONTH FROM mee.data) >= 6)
    -- Substituí o EXISTS por um filtro direto usando a CTE
    AND d.id_discente IN (SELECT id_discente FROM alunos_com_frequencia)
    AND ts.id_turma_serie IS NOT NULL
ORDER BY
    e.nome,
    p.nome,
    s.descricao,
    ts.nome;
