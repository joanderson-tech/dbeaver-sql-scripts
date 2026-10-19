
SELECT 
    t.id_turma_serie, t.id_turma, t.etapa, t.descricao, t.turno, t.codigo, t.nome, t.id_turno
FROM 
    (SELECT 
        ts.id_turma_serie,t.id_turma, et.denominacao AS etapa,s.descricao, tr.descricao AS turno,t.codigo,cc.nome,tr.id_turno,
        ROW_NUMBER() OVER(PARTITION BY ts.id_turma_serie ORDER BY ts.id_turma_serie) AS row_num
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
    INNER JOIN 
        escola.escola esc ON esc.id_escola = eees.id_escola AND ts.id_escola = esc.id_escola
    WHERE 
        ts.id_escola = 51870349
        AND ts.ano = :ano
        AND ts.ativo = :ativo
        AND id_turma_agrupadora IS NULL) AS t
WHERE 
    t.row_num = 1
ORDER BY 
    t.etapa,
    t.id_turno,
    t.descricao,
    t.codigo;
   
   select
	t.id_turma_serie,
	t.id_turma,
	t.etapa,
	t.descricao,
	t.turno,
	t.codigo,
	t.nome,
	t.id_turno
from
	(
	select
		ts.id_turma_serie,
		t.id_turma,
		et.denominacao as etapa,
		s.descricao,
		tr.descricao as turno,
		t.codigo,
		cc.nome,
		tr.id_turno,
		ROW_NUMBER() OVER(PARTITION BY ts.id_turma_serie ORDER BY ts.id_turma_serie) AS row_num
	FROM 
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
	join escola.escola_etapa_ensino_serie eees on
		eees.id_serie = s.id_serie
	join escola.escola esc on
		esc.id_escola = eees.id_escola
		and ts.id_escola = esc.id_escola
	where
		 ts.id_escola = 51870349
        AND ts.ano = :ano
        AND ts.ativo = :ativo
        AND id_turma_agrupadora IS NULL) AS t
where
	t.row_num = 1
order by
	t.etapa,
	t.id_turno,
	t.descricao,
	t.codigo;
select
	t.id_turma_serie,
	t.id_turma,
	t.etapa,
	t.descricao,
	t.turno,
	t.codigo,
	t.nome,
	t.id_turno
from
	(
	select
		ts.id_turma_serie,
		t.id_turma,
		et.denominacao as etapa,
		s.descricao,
		tr.descricao as turno,
		t.codigo,
		cc.nome,
		tr.id_turno,
		row_number() over(partition by ts.id_turma_serie
	order by
		ts.id_turma_serie) as row_num
	from
		ensino.turma t
	join basico.turma_serie ts
			using (id_turma_serie)
	join basico.serie s
			using (id_serie)
	join basico.etapa_ensino et on
		et.id_etapa_ensino = s.id_etapa_ensino
	join ensino.componente_curricular cc on
		cc.id_componente_curricular = t.id_disciplina
	join ensino.turno tr on
		tr.id_turno = ts.id_turno
	join escola.escola_etapa_ensino_serie eees on
		eees.id_serie = s.id_serie
	join escola.escola esc on
		esc.id_escola = eees.id_escola
		and ts.id_escola = esc.id_escola
	where
		ts.id_escola = 51870349
		and ts.ano = 2024
		and ts.ativo = :ativo
		and id_turma_agrupadora is null ) as t
where
	t.row_num = 1
order by
	t.etapa,
	t.id_turno,
	t.descricao,
	t.codigo;
	

select
	t.id_turma_serie,
	t.id_turma,
	t.etapa,
	t.descricao,
	t.turno,
	t.codigo,
	t.nome,
	t.id_turno
from
	(
	select
		ts.id_turma_serie,
		t.id_turma,
		et.denominacao as etapa,
		s.descricao,
		tr.descricao as turno,
		t.codigo,
		cc.nome,
		tr.id_turno,
		row_number() over(partition by ts.id_turma_serie
	order by
		ts.id_turma_serie) as row_num
	from
		ensino.turma t
	join basico.turma_serie ts
			using (id_turma_serie)
	join basico.serie s
			using (id_serie)
	join basico.etapa_ensino et on
		et.id_etapa_ensino = s.id_etapa_ensino
	join ensino.componente_curricular cc on
		cc.id_componente_curricular = t.id_disciplina
	join ensino.turno tr on
		tr.id_turno = ts.id_turno
	join escola.escola_etapa_ensino_serie eees on
		eees.id_serie = s.id_serie
	join escola.escola esc on
		esc.id_escola = eees.id_escola
		and ts.id_escola = esc.id_escola
	where
		ts.id_escola = 51870349
		and ts.ano = 2024
		and id_turma_agrupadora is null ) as t
where
	t.row_num = 1
order by
	t.etapa,
	t.id_turno,
	t.descricao,
	t.codigo;
