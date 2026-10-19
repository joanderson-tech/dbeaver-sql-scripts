select COALESCE(SUM(falta.faltas), 0) AS faltas,
COALESCE(SUM(falta.horarios), 0) AS HORARIO from ( select
	fa.id_turma,
	cast(fa."data" as text) as data_aula,
	least (coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end),
	0),
	coalesce(ae.numero_aulas,
	fa.horarios)) as faltas,
	coalesce(ae.numero_aulas,
	fa.horarios) as horarios
from
	ensino.frequencia_aluno fa
join ensino.turma t on
	t.id_turma = fa.id_turma
left join ava.aula_extra ae on
	ae.id_turma = t.id_turma
	and ae.data_aula = fa."data"
where
	fa.ativo
	and fa.id_discente = 1400729
	and t.id_turma_serie = 61548847
	and t.id_turma = 730259
	and extract(month
from
	fa.data) = 3
group by
	fa.id_turma,
	fa."data",
	fa.frequencia,
	fa.horarios,
	ae.numero_aulas
order by
	data_aula) as falta;

select * from discente d where matricula = '202430061567'; 1400729


select * from ensino.turma t where id_turma_serie = 61548847;

    select
	e.nome as nome_escola,
	ts.nome as nome_turma,
	ts.id_turma_serie as id_turma_serie,
	s.descricao as nome_serie,
	d.matricula as matricula_estudante,
	p.nome as nome_estudante,
	mes.id_estudante as idEstudante,
	est.participa_bolsa_familia as participa_bolsa_familia
from
	basico.matricula_estudante_serie mes
JOIN (
  SELECT DISTINCT id_discente
  FROM ensino.matricula_componente
) mc ON mc.id_discente = mes.id_estudante
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
where
	mes.ano_calendario = 2024
	and e.id_escola = 52232930
	and ts.nome ilike '%EFAFM7A%'
	and extract(month
from
	mes.data_cadastro) <= 12
	and (mee.data is null
		or extract(month
	from
		mee.data) >= 12 )
	and ts.id_turma_serie is not null
order by
	e.nome,
	ts.nome,
	p.nome,
	s.descricao; 
select * 
from
	ensino.matricula_componente mc;



select distinct 'ALOCAÇÃO EM TURMA' as descricao, p.nome as nome, mc.data_cadastro as data ,	t.codigo as turma
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
left join comum.registro_entrada re on
	re.id_entrada = mc.id_registro_cadastro
left join comum.usuario u on
	u.id_usuario = re.id_usuario
left join comum.pessoa p on
	p.id_pessoa = u.id_pessoa
where
	mc.id_discente = 1400729
order by
	mc.data_cadastro;
			    
			    
			    
			    
			    
			    