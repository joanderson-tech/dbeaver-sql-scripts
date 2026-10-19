select * from comum.usuario u where id_usuario = 105128;

select * from comum.papel p where id = 301;
select * from comum.pessoa p where id_pessoa = 748879;

select * from rh.servidor s where id_servidor = 75743;

UPDATE comum.usuario  SET id_unidade=605 WHERE id_usuario=105128;



select
	pe.id as id_permissao,
	pe.data_expiracao,
	pe.data_atribuicao,
	pe.id_unidade_papel as id_unidade_papel,
	pa.id as id_papel,
	pa.descricao,
	pa.nome,
	pa.restrito,
	pa.exige_unidade,
	pa.id_sistema,
	si.id as id_sistema,
	si.descricao as nome_sistema,
	ss.id as id_subsistema,
	ss.nome as nome_subsistema,
	ss.link_entrada as link_subsistema,
	pe.id_atribuidor,
	a.login as login_atribuidor,
	u.id_usuario,
	u.login,
	p.nome as nome_usuario,
	un.codigo_unidade,
	un.nome as nome_unidade,
	un.sigla as sigla_unidade,
	pe.autorizada,
	pe.numero_chamado,
	pe.motivo,
	unpa.codigo_unidade as codigo_unidade_papel,
	unpa.nome as nome_unidade_papel,
	unpa.sigla as sigla_unidade_papel
from
	comum.papel pa,
	comum.permissao pe
left join comum.usuario a on
	(pe.id_atribuidor = a.id_usuario)
left join comum.unidade unpa on
	(pe.id_unidade_papel = unpa.id_unidade ) ,
	comum.subsistema ss,
	comum.usuario u,
	comum.pessoa p,
	comum.unidade un,
	comum.sistema si
where
	pa.id = pe.id_papel
	and pa.id_subsistema = ss.id
	and pe.id_usuario = u.id_usuario
	and pa.id_sistema = si.id
	and u.id_pessoa = p.id_pessoa
	and u.id_unidade = un.id_unidade
	and u.id_usuario = v
	and pe.autorizada = trueValue()
	and (pe.data_expiracao is null
		or (pe.data_expiracao is not null
			and pe.data_expiracao >= ?))