SELECT DISTINCT  p.cpf_cnpj, e.nome, p.nome, p.id_pessoa, s.id_servidor, s.siape, s.digito_siape,s.tipo_vinculo
FROM rh.servidor s 
JOIN comum.pessoa p USING (id_pessoa) 
JOIN ensino.docente_turma dt  ON dt.id_docente = s.id_servidor  AND dt.ativo
JOIN ensino.turma t on t.id_turma = dt.id_turma 
JOIN basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie 
JOIN escola.escola e on e.id_escola = ts.id_escola 
WHERE 1 = 1 
and e.id_escola = 52232930
and s.id_ativo <> 4;



select
	distinct s.id_servidor,
	s.siape,
	s.digito_siape,
	s.data_transferencia,
	p.id_pessoa,
	p.cpf_cnpj,
	p.nome,
	p.email,
	p.sexo,
	u.id_unidade,
	u.codigo_unidade,
	u.nome as unidade,
	c.id_categoria,
	c.descricao as categoria,
	ss.id_situacao,
	ss.descricao as situacao,
	esc.id_escolaridade,
	esc.descricao as escolaridade,
	f.id_formacao,
	f.denominacao as formacao ,
	cargo.denominacao as denominacaoCargo,
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
left join rh.categoria c
		using (id_categoria)
left join rh.cargo cargo on
	cargo.id_cargo = s.id_cargo
left join rh.situacao_servidor ss
		using (id_situacao)
left join rh.escolaridade esc on
	esc.id_escolaridade = p.id_escolaridade
left join rh.formacao f
		using (id_formacao)
where
	s.id_ativo <> 4
	and (s.id_unidade = 27224059
		or (e.id_unidade_escola = 27224059
			and dt.data_fim>current_date
			and not dt.finalizada
			and dt.ativo)
		or (va.id_unidade = 27224059
			and va.ativo) )
	and upper(p.nome)like upper('%%%')
order by
	p.nome asc
limit 100 offset 0;