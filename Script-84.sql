
select
	distinct ts.id_turma_serie, ts.nome
from basico.turma_serie ts
inner join ensino.turno turno on turno.id_turno = ts.id_turno
inner join basico.serie s on s.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino
inner join basico.nivel_etapa_ensino nee on nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
inner join escola.escola_etapa_ensino_serie eees on eees.id_serie = s.id_serie
inner join escola.escola esc on esc.id_escola = eees.id_escola
	and ts.id_escola = esc.id_escola
where
	ts.id_escola = 2271
	and ts.ano = 2023
	and ts.ativo = true;


select
	distinct ts.id_turma_serie,
	ts.nome,
	s.id_serie
from basico.turma_serie ts
inner join ensino.turno turno on turno.id_turno = ts.id_turno
inner join basico.serie s on s.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino
inner join basico.nivel_etapa_ensino nee on nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
inner join escola.escola_etapa_ensino_serie eees on eees.id_serie = s.id_serie
inner join escola.escola esc on esc.id_escola = eees.id_escola and ts.id_escola = esc.id_escola
where
	ts.id_escola = 2271
	and ts.ano = :ano
	and ts.ativo = :ativo;


select
	distinct ts.id_turma_serie,
	ts.nome
from
	basico.turma_serie ts
inner join ensino.turno turno on
	turno.id_turno = ts.id_turno
inner join basico.serie s on
	s.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
inner join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
inner join escola.escola_etapa_ensino_serie eees on
	eees.id_serie = s.id_serie
inner join escola.escola esc on
	esc.id_escola = eees.id_escola
	and ts.id_escola = esc.id_escola
where
	ts.id_escola = 2271
	and ts.ano = :ano
	and ts.ativo = :ativo;





sql.append("select distinct ts.id_turma_serie, ts.nome"
				+ " from basico.turma_serie ts "
				+ " inner join ensino.turno turno on turno.id_turno = ts.id_turno "
				+ " inner join basico.serie s on s.id_serie = ts.id_serie "
				+ " inner join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino "
				+ " inner join basico.nivel_etapa_ensino nee on nee.id_nivel_etapa_ensino = ee.id_nivel_etapa "
				+ " inner join escola.escola_etapa_ensino_serie eees on eees.id_serie = s.id_serie "
				+ " inner join escola.escola esc on esc.id_escola = eees.id_escola and ts.id_escola = esc.id_escola");


SELECT DISTINCT s.id_serie,ts.nome
FROM basico.serie s
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
JOIN escola.escola_etapa_ensino_serie eees ON eees.id_serie = s.id_serie
JOIN basico.turma_serie ts ON ts.id_serie = s.id_serie AND ts.id_escola = eees.id_escola
WHERE ee.ativo = true
    AND eees.id_escola = 2282;
   
   
   select
	distinct ts.id_turma_serie,
	ts.nome
from
	basico.turma_serie ts
inner join ensino.turno turno on
	turno.id_turno = ts.id_turno
inner join basico.serie s on
	s.id_serie = ts.id_serie
inner join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
inner join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
inner join escola.escola_etapa_ensino_serie eees on
	eees.id_serie = s.id_serie
inner join escola.escola esc on
	esc.id_escola = eees.id_escola
	and ts.id_escola = esc.id_escola
where
	ts.id_escola = 2256
	and ts.ano = :ano
	and ts.ativo = :ativo;

SELECT 
    t.id_turma,
    et.denominacao AS etapa,
    s.descricao,
    tr.descricao AS turno,
    t.codigo,
    cc.nome,
    tr.id_turno
FROM 
    ensino.turma t
JOIN 
    basico.turma_serie ts USING (id_turma_serie)
JOIN 
    basico.serie s USING (id_serie)
JOIN 
    basico.etapa_ensino et ON et.id_etapa_ensino = s.id_etapa_ensino
JOIN 
    ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
JOIN 
    ensino.turno tr ON tr.id_turno = ts.id_turno
INNER JOIN 
    escola.escola_etapa_ensino_serie eees ON eees.id_serie = s.id_serie
INNER JOIN escola.escola esc ON esc.id_escola = eees.id_escola AND ts.id_escola = esc.id_escola
    WHERE 
    ts.id_escola = 2271
    AND ts.ano = :ano
    AND ts.ativo = :ativo
    AND id_turma_agrupadora IS NULL
GROUP BY 
    t.id_turma,
    et.denominacao,
    s.descricao,
    tr.descricao,
    t.codigo,
    cc.nome,
    tr.id_turno
ORDER BY 
    et.denominacao,
    tr.id_turno,
    s.descricao,
    t.codigo;
   
select
	t.id_turma,
	et.denominacao as etapa,
	s.descricao,
	tr.descricao as turno,
	t.codigo,
	cc.nome,
	tr.id_turno
from
	ensino.turma t
join basico.turma_serie ts
		using (id_turma_serie)
join basico.serie s
		using (id_serie)
join basico.etapa_ensino et on
	(et.id_etapa_ensino = s.id_etapa_ensino)
join ensino.componente_curricular cc on
	(cc.id_componente_curricular = t.id_disciplina)
join ensino.turno tr on
	( tr.id_turno = ts.id_turno )
INNER JOIN escola.escola_etapa_ensino_serie eees ON eees.id_serie = s.id_serie
INNER JOIN escola.escola esc ON esc.id_escola = eees.id_escola AND ts.id_escola = esc.id_escola
where
	ts.id_escola = :idEscola
	and ts.ano = :ano
	and ts.ativo = :ativo
	and id_turma_agrupadora is null
group by
	t.id_turma,
	et.denominacao,
	s.descricao,
	tr.descricao,
	t.codigo,
	cc.nome,
	tr.id_turno
order by
	et.denominacao,
	tr.id_turno,
	s.descricao,
	t.codigo;



				