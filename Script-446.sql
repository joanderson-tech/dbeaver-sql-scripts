select nu from ensino.nota_unidade nu
join ensino.matricula_componente mc on mc.id_matricula_componente = nu.id_matricula_componente 
join ensino.turma t on t.id_turma = mc.id_turma 
where t.id_turma_serie = 55493953
and mc.id_matricula_componente = 18008023;


select * from ensino.matricula_componente mc where id_componente_curricular = 238;

select * from basico.serie s where id_serie = 1005220;

select id_turma_agrupadora, * from ensino.turma t where id_turma = 727297 and ano=2025;

select * from basico.turma_serie ts where id_turma_serie_agrupadora  = 727288;

SELECT x.* FROM ensino.tipo_componente_curricular x;


--id_matricula_componente 18008023 id_turma 727297  id_componente_curricular  604

-- Auto-generated SQL script #202504171004
UPDATE basico.turma_serie
	SET id_turma_serie_agrupadora=727288
	WHERE id_turma_serie=55493953;

Error synchronizing data with database

Razão:
 Erro SQL [23503]: ERROR: insert or update on table "turma_serie" violates foreign key constraint "turma_serie_agrupadora_fk"
  Detalhe: Key (id_turma_serie_agrupadora)=(727288) is not present in table "turma_serie"

 select
	g.id_serie,
	g.id_grupo_serie,
	g.ordem,
	g.agrupador,
	e.id_etapa_ensino
from
	basico.grupo_serie g
join basico.serie s on
	s.id_serie = g.id_serie
join basico.etapa_ensino e on
	e.id_etapa_ensino = s.id_etapa_ensino
where
	g.agrupador in (
	select
		agrupador
	from
		basico.grupo_serie
	where
		id_serie = 1005220)
order by
	g.ordem desc;
	
select * from basico.grupo_serie g;



 select
	distinct t.id_turma ,
	t.tipo,
	cc.id_componente_curricular,
	cc.nome ,
	case
		when p.nome is null then 'NÃO INFORMADO'
		else (case
			when t.id_situacao_turma = 3 then p.nome || ' (Consolidada)'
			else p.nome
		end)
	end,
	e.nome,
	ee.id_etapa_ensino,
	ee.denominacao,
	serie.id_serie,
	serie.descricao,
	ts.id_turma_serie,
	ts.nome,
	ts.id_tipo_turma_serie,
	turno.descricao,
	t.agrupadora,
	modulo.denominacao,
	t.grupo,
	foe.gerencia_turmas_individuais,
	t.id_turma_agrupadora,
	serie.tipo_diario,
	dt.data_fim,
	t.id_situacao_turma
from
	ensino.turma t
join ensino.componente_curricular cc on
	(t.id_disciplina = cc.id_componente_curricular)
left join ensino.docente_turma dt on
	(t.id_turma = dt.id_turma
		and dt.ativo = trueValue())
left join rh.servidor s on
	(dt.id_docente = s.id_servidor)
left join comum.pessoa p on
	(s.id_pessoa = p.id_pessoa)
join basico.turma_serie ts on
	(t.id_turma_serie = ts.id_turma_serie)
join basico.serie serie on
	(ts.id_serie = serie.id_serie)
join basico.etapa_ensino ee on
	(serie.id_etapa_ensino = ee.id_etapa_ensino)
join basico.forma_organizacao_etapa foe on
	(foe.id_forma_organizacao_etapa = ee.id_forma_organizacao_etapa)
join ensino.turno turno on
	(ts.id_turno = turno.id_turno )
join escola.escola e on
	(ts.id_escola = e.id_escola)
left join basico.modulo modulo on
	(t.id_modulo = modulo.id_modulo)
where
	t.id_situacao_turma <> 4
	and ts.ano = 2025
	and ts.id_turma_serie = 55493953
order by
	t.grupo,
	modulo.denominacao,
	cc.nome,
	dt.data_fim ;














