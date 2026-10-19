 select
	s.descricao,
	nee.denominacao,
	t.codigo,
	cc.nome as componente,
	coalesce(p.nome, 'Não Informado') as professor,
	t.id_turma,
	serv.id_servidor,
	s.id_serie,
	serv.siape,
	dt.ch_dedicada_periodo,
	t.id_turma_agrupadora,
	serv.digito_siape,
	ts.nome as turmaserie,
	et.denominacao as etapa,
	t.id_disciplina,
	st.descricao as situacaoTurma,
	dt.suplementar,
	dt.finalizada,
	dt.data_inicio,
	dt.data_fim,
	e.id_escola,
	e.nome escola
from
	basico.turma_serie ts
join escola.escola e on
	e.id_escola = ts.id_escola
join basico.serie s
		using (id_serie)
join basico.etapa_ensino et
		using (id_etapa_ensino)
join ensino.turma t
		using (id_turma_serie)
join ensino.componente_curricular cc on
	t.id_disciplina = cc.id_componente_curricular
join basico.etapa_ensino ee
		using (id_etapa_ensino)
join basico.nivel_etapa_ensino nee on
	ee.id_nivel_etapa = nee.id_nivel_etapa_ensino
left join ensino.docente_turma dt on
	dt.id_turma = t.id_turma
	and not dt.finalizada
	and dt.id_docente_turma = (
	select
		sdt.id_docente_turma
	from
		ensino.docente_turma sdt
	where
		sdt.id_turma = t.id_turma
		and sdt.ativo
	order by
		sdt.data_fim desc
	limit 1 )
left join rh.servidor serv on
	( dt.id_docente = serv.id_servidor )
left join comum.pessoa p on
	( serv.id_pessoa = p.id_pessoa )
left join ensino.situacao_turma st on
	( st.id_situacao_turma = t.id_situacao_turma )
where
	ts.id_escola = 52232984
	and ts.ativo = true
	and ts.ano = 2025
	and (t.descricao_horario is not null
		or cc.id_componente_curricular = 437)
	and ts.id_tipo_turma_serie in (1,3,5,4)
	and (serv.data_desligamento is null or serv.data_desligamento > now())
group by
	e.id_escola,
	e.nome,
	t.id_turma,
	serv.id_servidor,
	s.descricao,
	t.codigo,
	t.id_turma_agrupadora,
	cc.nome,
	p.nome,
	nee.denominacao,
	s.id_serie,
	serv.siape,
	dt.ch_dedicada_periodo,
	serv.digito_siape,
	ts.nome,
	et.denominacao,
	t.id_disciplina,
	st.descricao,
	dt.suplementar,
	dt.finalizada,
	dt.data_inicio,
	dt.data_fim
order by
	s.descricao,
	ts.nome,
	t.codigo,
	cc.nome,
	p.nome;
 
  select *
from ensino.docente_turma sdt
where sdt.id_docente_turma  = 72960490;
 
 select sdt.id_docente_turma
from ensino.docente_turma sdt
where sdt.id_turma = 761349 
and sdt.ativo
order by sdt.data_fim desc
limit 1;


select * from rh.servidor s where s.id_servidor = 8702;
and (s.data_desligamento is null or s.data_desligamento > now());