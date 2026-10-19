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
	join comum.pessoa p
			using (id_pessoa)
	join ensino.docente_turma dt on
		dt.id_docente = s.id_servidor
		and dt.ativo
	join ensino.turma t on
		t.id_turma = dt.id_turma
	join basico.turma_serie ts on
		ts.id_turma_serie = t.id_turma_serie
	join escola.escola e on
		e.id_escola = ts.id_escola
	where
		1 = 1
		and s.siape ilike 'Thiago Evangelista'
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
	join comum.pessoa p
			using (id_pessoa)
	join ensino.docente_turma dt on
		dt.id_docente = s.id_servidor
		and dt.ativo
	join ensino.turma t on
		t.id_turma = dt.id_turma
	join basico.turma_serie ts on
		ts.id_turma_serie = t.id_turma_serie
	join escola.escola e on
		e.id_escola = ts.id_escola
	where
		1 = 1
		and upper(p.nome_ascii) ilike '%THIAGO EVANGELISTA DE SOUZA%' ) as foo
order by
	nome
limit 50;

select  * from rh.servidor s join comum.pessoa p using (id_pessoa) 
where p.nome = 'THIAGO EVANGELISTA DE SOUZA';


SELECT DISTINCT  s.id_servidor, s.siape, s.digito_siape, s.data_transferencia,
			p.id_pessoa, p.cpf_cnpj, p.nome, p.email, p.sexo, 
			u.id_unidade, u.codigo_unidade, u.nome as unidade,  
			c.id_categoria, c.descricao as categoria, 
			ss.id_situacao, ss.descricao as situacao, 
			esc.id_escolaridade, esc.descricao as escolaridade,
			f.id_formacao, f.denominacao as formacao , cargo.denominacao as denominacaoCargo, s.tipo_vinculo  
FROM rh.servidor s  
LEFT JOIN comum.unidade u ON s.id_unidade = u.id_unidade 
LEFT JOIN pessoas.vaga_administrativa va ON va.id_servidor = s.id_servidor 
LEFT JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor 
LEFT JOIN ensino.turma t ON t.id_turma = dt.id_turma
LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
LEFT JOIN escola.escola e ON e.id_escola = ts.id_escola 
LEFT join comum.pessoa p on p.id_pessoa = s.id_pessoa 
LEFT JOIN rh.categoria c USING (id_categoria)  
LEFT JOIN rh.cargo cargo on cargo.id_cargo = s.id_cargo 
LEFT JOIN rh.situacao_servidor ss USING (id_situacao) 
LEFT JOIN rh.escolaridade esc on esc.id_escolaridade = p.id_escolaridade 
LEFT JOIN rh.formacao f USING (id_formacao) 
WHERE s.id_ativo <>4 
AND (s.id_unidade = %1$s  OR  (e.id_unidade_escola = %1$s AND dt.data_fim>current_date AND NOT dt.finalizada AND dt.ativo)  OR  (va.id_unidade = %1$s AND va.ativo) );





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
	and (s.id_unidade = 27224059 or (e.id_unidade_escola = 27224059 and dt.data_fim>current_date and not dt.finalizada and dt.ativo) or (va.id_unidade = 27224059 and va.ativo) )
	and upper(p.nome)like upper('%%%')
	--and s.id_unidade = 27224059
order by
	p.nome asc
limit 100 offset 0;




