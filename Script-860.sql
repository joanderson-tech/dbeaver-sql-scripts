select 
        distinct dt.id_docente ,u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;


select distinct p.id_pessoa, 
        p.nome AS NomeEstudante,
        t.codigo AS Turma, t.id_turma , mes.id_matricula_discente_serie, --1317641  1317542
        e.nome AS Unidade,
        tn.descricao AS Turno,
        dt.id_docente
    FROM
        educacao_especial.atendimento_educacao_especial_estudante aee
    JOIN educacao_especial.atendimento_educacao_especial_horario aeeh ON
        aee.id_atendimento_educacao_especial_horario = aeeh.id_atendimento_educacao_especial_horario
    JOIN educacao_especial.atendimento_educacao_especial_turma aeet ON
        aeeh.id_atendimento_educacao_especial_turma = aeet.id_atendimento_educacao_especial_turma
    JOIN ensino.turma t ON
        aeet.id_turma = t.id_turma
    JOIN ensino.docente_turma dt ON
        t.id_turma = dt.id_turma
    JOIN basico.turma_serie ts ON
        t.id_turma_serie = ts.id_turma_serie
    JOIN discente d ON
        aee.id_estudante = d.id_discente
    JOIN basico.matricula_estudante_serie mes ON
        d.id_discente = mes.id_estudante
    JOIN comum.pessoa p ON
        d.id_pessoa = p.id_pessoa
    JOIN escola.escola e ON
        ts.id_escola = e.id_escola
    JOIN ensino.turno tn on 
        ts.id_turno = tn.id_turno
    WHERE
        aee.ativo
        AND aeet.ativo
        AND t.id_situacao_turma <> 4
        AND mes.ano_calendario = 2025
        AND t.ano = 2025
        AND mes.id_situacao_matricula_serie = 1;

select * from basico.matricula_estudante_serie mes where mes.id_matricula_discente_serie in (1317641,  1317542)

51928698
51925061

select * from ensino.turma_ t where t.id_turma_serie in (51928698,51925061);
select * from basico.turma_serie  t where t.id_turma_serie in (51930409);

select
		count(*)
	from
		basico.matricula_estudante_serie MES
	where
		MES.id_turma_serie  in (51928698,51925061)
		and (MES.id_situacao_matricula_serie in (2, 3, 1, 7, 8, 10, -1))
		and MES.ano_calendario = 2025;
		

select * from ensino.docente_turma dt  where dt.id_docente = 45 and dt.id_turma = 686395;


select
		(
	select
		count(*)
	from
		basico.matricula_estudante_serie mes
	where
		mes.id_turma_serie = t.id_turma_serie
		and (mes.id_situacao_matricula_serie in (2, 3, 1, 7, 8, 10, -1))
		and mes.ano_calendario =2025) as QUANTIDADE
from
	ensino.docente_turma dtt
inner join ensino.turma t on
	dtt.id_turma = t.id_turma
left outer join basico.modulo modulo2_ on
	t.id_modulo = modulo2_.id_modulo
left outer join basico.turma_serie ts on
	t.id_turma_serie = ts.id_turma_serie
left outer join basico.curriculo_basico curriculob4_ on
	ts.id_curriculo_medio = curriculob4_.id_curriculo_basico,
	escola.escola escola18_,
	basico.serie serie21_,
	basico.etapa_ensino etapaensin29_,
	ensino.turno turno32_,
	ensino.componente_curricular componente8_,
	ensino.tipo_componente_curricular tipocompon12_,
	ensino.situacao_turma situacaotu13_
where
	ts.id_escola = escola18_.id_escola
	and ts.id_serie = serie21_.id_serie
	and serie21_.id_etapa_ensino = etapaensin29_.id_etapa_ensino
	and ts.id_turno = turno32_.id_turno
	and t.id_disciplina = componente8_.id_componente_curricular
	and componente8_.id_tipo_componente = tipocompon12_.id_tipo_disciplina
	and t.id_situacao_turma = situacaotu13_.id_situacao_turma
	and dtt.ativo = true
	and dtt.id_docente = 45
	and dtt.finalizada = false
	and ts.ano =2025
	and t.id_situacao_turma <> 4
	and dtt.data_inicio <= current_date
order by
	etapaensin29_.denominacao,
	serie21_.descricao,
	t.periodo










 select
	e.id_escola as id,
	e.nome
from
	ensino.docente_turma dt
join ensino.turma t on
	t.id_turma = dt.id_turma
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join escola.escola e on
	e.id_escola = ts.id_escola
where
	dt.id_docente = 45;
 
 select
	case
		when count(dt.id_docente_turma) > 0 then true
		else false
	end
from
	ensino.docente_turma dt
join ensino.turma t on
	t.id_turma = dt.id_turma
where
	dt.ativo
	and dt.id_docente = 45
	and (t.id_disciplina in (370, 372));
 
select
	distinct t1_0.id_turma,
	t1_0.ano,
	t1_0.periodo,
	t1_0.descricao_horario,
	t1_0.codigo,
	t1_0.agrupadora,
	t1_0.capacidade_aluno,
	t1_0.total_matriculados,
	t1_0.id_situacao_turma,
	t1_0.id_disciplina,
	d1_0.nome,
	ts1_0.id_turma_serie,
	ts1_0.ano,
	ts1_0.nome,
	ts1_0.capacidade_aluno,
	ts1_0.tipo_diario,
	ts1_0.descricao_horario,
	ts1_0.id_escola,
	e1_0.nome,
	ts1_0.id_turno,
	t2_0.descricao,
	t2_0.hora_inicio,
	t2_0.hora_fim,
	ts1_0.id_serie,
	s1_0.descricao,
	s1_0.multisseriada,
	s1_0.id_etapa_ensino,
	ee1_0.denominacao,
	ee1_0.periodicidade_etapa,
	ee1_0.id_nivel_etapa,
	ne1_0.denominacao,
	ts1_0.id_curriculo_medio,
	c1_0.possui_parte_diversificada,
	c1_0.tipo_diario,
	c1_0.tipo_diario_diversificado,
	c1_0.multisseriado,
	c1_0.tipo_diario ,
	t1_0.tipo,
	(
	select
		count(*)
	from
		basico.matricula_estudante_serie mes1_0
	where
		mes1_0.id_turma_serie = t1_0.id_turma_serie
		and mes1_0.ano_calendario =2025
		and mes1_0.id_situacao_matricula_serie in (1)) as TESTE,
	(
	select
		count(*)
	from
		ensino.matricula_componente mc1_0
	where
		mc1_0.id_turma = t1_0.id_turma
		and mc1_0.id_situacao_matricula in (1))
from
	ensino.docente_turma dt1_0
join ensino.turma t1_0 on
	t1_0.id_turma = dt1_0.id_turma
join basico.turma_serie ts1_0 on
	ts1_0.id_turma_serie = t1_0.id_turma_serie
join escola.escola e1_0 on
	e1_0.id_escola = ts1_0.id_escola
join ensino.turno t2_0 on
	t2_0.id_turno = ts1_0.id_turno
join basico.serie s1_0 on
	s1_0.id_serie = ts1_0.id_serie
join basico.etapa_ensino ee1_0 on
	ee1_0.id_etapa_ensino = s1_0.id_etapa_ensino
join basico.nivel_etapa_ensino ne1_0 on
	ne1_0.id_nivel_etapa_ensino = ee1_0.id_nivel_etapa
join basico.curriculo_basico c1_0 on
	c1_0.id_curriculo_basico = ts1_0.id_curriculo_medio
join ensino.componente_curricular d1_0 on
	d1_0.id_componente_curricular = t1_0.id_disciplina
where
	dt1_0.id_docente =45
	and dt1_0.ativo = true
	and dt1_0.finalizada = false
	and dt1_0.data_inicio <= current_date
	and t1_0.ano = 2025
	and t1_0.id_situacao_turma <> 4
	and ts1_0.ativo = true
order by
	ee1_0.denominacao,
	s1_0.descricao,
	t1_0.periodo
	
	select
	distinct t1_0.id_turma,
	t1_0.ano,
	t1_0.periodo,
	t1_0.descricao_horario,
	t1_0.codigo,
	t1_0.agrupadora,
	t1_0.capacidade_aluno,
	t1_0.total_matriculados,
	t1_0.id_situacao_turma,
	t1_0.id_disciplina,
	d1_0.nome,
	ts1_0.id_turma_serie,
	ts1_0.ano,
	ts1_0.nome,
	ts1_0.capacidade_aluno,
	ts1_0.tipo_diario,
	ts1_0.descricao_horario,
	ts1_0.id_escola,
	e1_0.nome,
	ts1_0.id_turno,
	t2_0.descricao,
	t2_0.hora_inicio,
	t2_0.hora_fim,
	ts1_0.id_serie,
	s1_0.descricao,
	s1_0.multisseriada,
	s1_0.id_etapa_ensino,
	ee1_0.denominacao,
	ee1_0.periodicidade_etapa,
	ee1_0.id_nivel_etapa,
	ne1_0.denominacao,
	ts1_0.id_curriculo_medio,
	c1_0.possui_parte_diversificada,
	c1_0.tipo_diario,
	c1_0.tipo_diario_diversificado,
	c1_0.multisseriado,
	(
	select
		count(*)
	from
		basico.matricula_estudante_serie mes1_0
	where
		mes1_0.id_turma_serie = t1_0.id_turma_serie
		and mes1_0.ano_calendario =?
		and mes1_0.id_situacao_matricula_serie in (?,?,?,?,?,?,?)),
	(
	select
		count(*)
	from
		ensino.matricula_componente mc1_0
	where
		mc1_0.id_turma = t1_0.id_turma
		and mc1_0.id_situacao_matricula in (?,?,?,?))
from
	ensino.docente_turma dt1_0
join ensino.turma t1_0 on
	t1_0.id_turma = dt1_0.id_turma
join basico.turma_serie ts1_0 on
	ts1_0.id_turma_serie = t1_0.id_turma_serie
join escola.escola e1_0 on
	e1_0.id_escola = ts1_0.id_escola
join ensino.turno t2_0 on
	t2_0.id_turno = ts1_0.id_turno
join basico.serie s1_0 on
	s1_0.id_serie = ts1_0.id_serie
join basico.etapa_ensino ee1_0 on
	ee1_0.id_etapa_ensino = s1_0.id_etapa_ensino
join basico.nivel_etapa_ensino ne1_0 on
	ne1_0.id_nivel_etapa_ensino = ee1_0.id_nivel_etapa
join basico.curriculo_basico c1_0 on
	c1_0.id_curriculo_basico = ts1_0.id_curriculo_medio
join ensino.componente_curricular d1_0 on
	d1_0.id_componente_curricular = t1_0.id_disciplina
where
	dt1_0.id_docente =?
	and dt1_0.ativo = true
	and dt1_0.finalizada = false
	and dt1_0.data_inicio <= current_date
	and t1_0.ano =?
	and t1_0.id_situacao_turma <> 4
	and ts1_0.ativo = true
order by
	ee1_0.denominacao,
	s1_0.descricao,
	t1_0.periodo;
	
	
	
	
select
	count(id_atendimento_educacao_especial_estudante)
from
	educacao_especial.atendimento_educacao_especial_horario eeh
inner join educacao_especial.atendimento_educacao_especial_turma eet on
	eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
inner join educacao_especial.atendimento_educacao_especial_estudante eea on
	eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
inner join ensino.turma t on
	t.id_turma = eet.id_turma
where t.id_turma_serie in (51928698, 51925061)
	and eea.ativo = true
	and eeh.ativo;
	
	











select
	distinct t1_0.id_turma,
	t1_0.ano,
	t1_0.periodo,
	t1_0.descricao_horario,
	t1_0.codigo,
	t1_0.agrupadora,
	t1_0.capacidade_aluno,
	t1_0.total_matriculados,
	t1_0.id_situacao_turma,
	t1_0.id_disciplina,
	d1_0.nome,
	ts1_0.id_turma_serie,
	ts1_0.ano,
	ts1_0.nome,
	ts1_0.capacidade_aluno,
	ts1_0.tipo_diario,
	ts1_0.descricao_horario,
	ts1_0.id_escola,
	e1_0.nome,
	ts1_0.id_turno,
	t2_0.descricao,
	t2_0.hora_inicio,
	t2_0.hora_fim,
	ts1_0.id_serie,
	s1_0.descricao,
	s1_0.multisseriada,
	s1_0.id_etapa_ensino,
	ee1_0.denominacao,
	ee1_0.periodicidade_etapa,
	ee1_0.id_nivel_etapa,
	ne1_0.denominacao,
	ts1_0.id_curriculo_medio,
	c1_0.possui_parte_diversificada,
	c1_0.tipo_diario,
	c1_0.tipo_diario_diversificado,
	c1_0.multisseriado,
	(
	select
		count(*)
	from
		basico.matricula_estudante_serie mes1_0
	where
		mes1_0.id_turma_serie = t1_0.id_turma_serie
		and mes1_0.ano_calendario =2025
		and mes1_0.id_situacao_matricula_serie in (2, 3, 1, 7, 8, 10, -1)),
	(
	select
		count(*)
	from
		ensino.matricula_componente mc1_0
	where
		mc1_0.id_turma = t1_0.id_turma
		and mc1_0.id_situacao_matricula in (5, 6, 2, 8))
from
	ensino.docente_turma dt1_0
join ensino.turma t1_0 on
	t1_0.id_turma = dt1_0.id_turma
join basico.turma_serie ts1_0 on
	ts1_0.id_turma_serie = t1_0.id_turma_serie
join escola.escola e1_0 on
	e1_0.id_escola = ts1_0.id_escola
join ensino.turno t2_0 on
	t2_0.id_turno = ts1_0.id_turno
join basico.serie s1_0 on
	s1_0.id_serie = ts1_0.id_serie
join basico.etapa_ensino ee1_0 on
	ee1_0.id_etapa_ensino = s1_0.id_etapa_ensino
join basico.nivel_etapa_ensino ne1_0 on
	ne1_0.id_nivel_etapa_ensino = ee1_0.id_nivel_etapa
join basico.curriculo_basico c1_0 on
	c1_0.id_curriculo_basico = ts1_0.id_curriculo_medio
join ensino.componente_curricular d1_0 on
	d1_0.id_componente_curricular = t1_0.id_disciplina
where
	dt1_0.id_docente =45
	and dt1_0.ativo = true
	and dt1_0.finalizada = false
	and dt1_0.data_inicio <= current_date
	and t1_0.ano =2025
	and t1_0.id_situacao_turma <> 4
	and ts1_0.ativo = true
order by
	ee1_0.denominacao,
	s1_0.descricao,
	t1_0.periodo;
