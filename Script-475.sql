 select
	*
from
	(
	select
		distinct p.cpf_cnpj,
		p.nome,
		p.id_pessoa,
		s.id_servidor,
		s.siape,
		s.digito_siape,
		s.tipo_vinculo
	from
		rh.servidor s
	left join comum.unidade u on
		s.id_unidade = u.id_unidade
	left join pessoas.vaga_administrativa va on
		va.id_servidor = s.id_servidor
	left join ensino.docente_turma dt on
		dt.id_docente = s.id_servidor
	left join ensino.turma t on
		t.id_turma = dt.id_turma
	left join basico.turma_serie ts on
		ts.id_turma_serie = t.id_turma_serie
	left join escola.escola e on
		e.id_escola = ts.id_escola
	left join comum.pessoa p on
		p.id_pessoa = s.id_pessoa
	where
		1 = 1
		and s.siape ilike 'ADRIANA LUCIA OLIVEIRA RAMOS'
		and s.id_ativo <> 4
union
	select
		distinct p.cpf_cnpj,
		p.nome,
		p.id_pessoa,
		s.id_servidor,
		s.siape,
		s.digito_siape,
		s.tipo_vinculo
	from
		rh.servidor s
	left join comum.unidade u on
		s.id_unidade = u.id_unidade
	left join pessoas.vaga_administrativa va on
		va.id_servidor = s.id_servidor
	left join ensino.docente_turma dt on
		dt.id_docente = s.id_servidor
	left join ensino.turma t on
		t.id_turma = dt.id_turma
	left join basico.turma_serie ts on
		ts.id_turma_serie = t.id_turma_serie
	left join escola.escola e on
		e.id_escola = ts.id_escola
	left join comum.pessoa p on
		p.id_pessoa = s.id_pessoa
	where
		1 = 1
		and s.id_ativo <> 4
		and upper(p.nome_ascii) ilike 'ADRIANA LUCIA OLIVEIRA RAMOS'
		and dt.ativo
		and e.id_escola = 52232930 ) as foo
order by
	nome
limit 50;


select s.id_ativo, * from rh.servidor s;		where s.id_ativo;