UPDATE comum.sistema SET url='http://localhost:8087/provas'WHERE id=16;


https://educ21-provas.portalsigeduc.com.br

select * from comum.sistema where id = 16;

select * from infra.passaporte_logon pl where pl.chave = '6d43585349f19a37fe92681fdbb590e1eb9c61508ccf5c64239b09acdc418333'

select
	pe.id as id_permissao,
	pe.id_papel,
	pe.id_usuario,
	pa.nome,
	pa.descricao,
	pa.ativo
from
	comum.permissao pe
join comum.papel pa on
	pa.id = pe.id_papel
join comum.usuario u on
	u.id_usuario = pe.id_usuario
where
	u.id_usuario = 1
	and (pe.data_expiracao is null
		or (pe.data_expiracao is not null
			and pe.data_expiracao >= now()));


