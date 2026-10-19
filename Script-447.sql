select * from ensino.matricula_componente mc where id_matricula_estudante_serie  = 1424050; 

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
	
-- Auto-generated SQL script #202504171355
UPDATE ensino.turma
	SET id_categoria_componente=2
	WHERE id_turma=727297;


SELECT * FROM ensino.turma where id_turma_agrupadora = 727288;