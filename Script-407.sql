select * from comum.recurso_avaliacao_nee ran;

select * from comum.pessoa p where p.nome = 'LAUANY JULLY BATISTA FERREIRA DA SILVA'

select * from comum.pessoa_recurso_avaliacao_nee pran where id_recurso_avaliacao_nee  = 96598903 and id_pessoa = 751707; 

select * from comum.pessoa_necessidade_especial pne where id_pessoa = 751707;

select * from comum.tipo_necessidade_especial tne; where id_tipo_necessidade_especial = 8;

select
*
from
	matricula.calendario_matricula this_
where
	this_.ativo =true
order by
	this_.ano asc
	
	 [LazyInitializationException] failed to lazily initialize a collection of role: br.ufrn.sigaa.pessoa.dominio.Pessoa.pessoaRecursoAvaliacaoNecessidadesEspeciais, no session or session was closed
org.hibernate.LazyInitializationException: failed to lazily initialize a collection of role: br.ufrn.sigaa.pessoa.dominio.Pessoa.pessoaRecursoAvaliacaoNecessidadesEspeciais, no session or session was closed
	at org.hibernate.collection.AbstractPersistentCollection.throwLazyInitializationException(AbstractPersistentCollection.java:358)
	at org.hibernate.collection.AbstractPersistentCollection.throwLazyInitializationExceptionIfNotConnected(AbstractPersistentCollection.java:350)
	
	
	select
	distinct ran.id_recurso_avaliacao_nee,
	ran.descricao,
	ran.ativo
from
	comum.recurso_avaliacao_nee ran
join comum.recurso_avaliacao_tipo_necessidade_especial ratne on
	ran.id_recurso_avaliacao_nee = ratne.id_recurso_avaliacao_nee
join comum.tipo_necessidade_especial tne on
	tne.id_tipo_necessidade_especial = ratne.id_tipo_necessidade_especial
where
	ran.ativo
	and tne.ativo
	and ran.removido = false; 



select
	id_pessoa,
	p.nome,
	p.cpf_cnpj,
	p.nome_mae,
	p.data_nascimento,
	p.nome_pai ,
	m.nome as nome_municipio
from
	comum.pessoa p
left join comum.municipio m on
	p.id_municipio_naturalidade = m.id_municipio

