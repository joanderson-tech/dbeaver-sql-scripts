select
	pe.id as id_permissao,
	pe.data_expiracao,
	pe.data_atribuicao,
	pe.id_unidade_papel as id_unidade_papel,
	pa.id as id_papel,
	pa.ativo as ativo,
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
	unpa.sigla as sigla_unidade_papel,
	unpa.tipo as tipo_unidade_papel
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
	and pa.ativo
	and u.id_unidade = un.id_unidade;
	

select * from  comum.papel p where p.descricao = 'RECURSOS HUMANOS RELATORIOS' --7002

INSERT INTO comum.papel
(id, id_sistema, id_subsistema, descricao, restrito, exige_unidade, nome, tipo_autorizacao, tempo_alteracao_senha, sql_filtro_unidades, ativo)
VALUES(nextval('comum.papel'), 2, 35, 'RECURSOS HUMANOS RELATORIOS - ESCOLA', false, false, 'RECURSOS HUMANOS RELATORIOS', 1, NULL, NULL, true);

DELETE FROM comum.papel
WHERE id=7002;


select *
from
	comum.papel pa
	where pa.id = 7002;

begin;

rollback;
