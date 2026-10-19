   with faltas as (
select
	fa.id_discente,
	ts1.id_turma_serie,
	coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end)::INTEGER,
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
	0) as faltas
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
left join matricula.movimentacao_estudante_escola mee on
	mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
left join faltas f on
	f.id_discente = d.id_discente
	and f.id_turma_serie = ts.id_turma_serie
where
	mes.ano_calendario = 2024
	and e.id_escola = 52232930
	and s.id_serie = 1005223
	and es.id_etapa_ensino = 4
	and est.participa_bolsa_familia = true
	and extract(month
from
	mes.data_cadastro) <= 6
	and (mee.data is null
		or extract(month
	from
		mee.data) >= 6 )
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
	p.nome,
	s.descricao,
	ts.nome;

   with faltas as (
select
	fa.id_discente,
	ts1.id_turma_serie,
	coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end)::INTEGER,
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
	0) as faltas
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
left join matricula.movimentacao_estudante_escola mee on
	mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
left join faltas f on
	f.id_discente = d.id_discente
	and f.id_turma_serie = ts.id_turma_serie
where
	mes.ano_calendario = 2024
	and e.id_escola = 52232930
	AND s.id_serie = 1005223
	and ts.nome ilike '%EFAFT6B%'
	and extract(month
from
	mes.data_cadastro) <= 6
	and (mee.data is null
		or extract(month
	from
		mee.data) >= 6 )
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
	p.nome,
	s.descricao,
	ts.nome;
	

