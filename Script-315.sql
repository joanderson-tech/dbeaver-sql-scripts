 select
	distinct p.nome,
	p.codigo_inep,
	e.nome as nome_escola,
	case
		when p.possui_laudo is true then 'SIM'
		else 'NÃO'
	end as possui_laudo_descricao,
	ee.denominacao as denominacao_etapa_enisno,
	s.descricao as descrico_serie,
	tr.descricao as descricao_turno,
	ts.nome as nome_turma,
	p.data_nascimento,
	p.nome_mae
from
	comum.pessoa p
join comum.pessoa_necessidade_especial pne on
	pne.id_pessoa = p.id_pessoa
join public.discente d on
	d.id_pessoa = p.id_pessoa
join basico.matricula_estudante_serie mes on
	mes.id_estudante = d.id_discente
join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
join basico.serie s on
	s.id_serie = ts.id_serie
join escola.escola e on
	e.id_escola = ts.id_escola
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno tr on
	tr.id_turno = ts.id_turno
where
	mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
	and mes.ano_calendario = 2024
	and ts.id_escola = 2323
order by
	possui_laudo_descricao desc,
	p.nome;