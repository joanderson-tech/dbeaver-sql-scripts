select
	servidor0_.id_servidor as id_servi1_71_,
	servidor0_.id_atividade as id_ativi5_71_,
	servidor0_.id_cargo as id_cargo6_71_,
	servidor0_.id_categoria as id_categ7_71_,
	servidor0_.id_classe_servidor as id_class8_71_,
	servidor0_.lotacao as lotacao2_71_,
	servidor0_.id_pessoa as id_pesso9_71_,
	servidor0_.id_ativo as id_ativ10_71_,
	servidor0_.siape as siape3_71_,
	servidor0_.id_situacao as id_situ11_71_,
	servidor0_.tipo_vinculo as tipo_vin4_71_,
	servidor0_.id_unidade as id_unid12_71_
from
	rh.servidor servidor0_
/*inner join rh.cargo cargo1_ on	servidor0_.id_cargo = cargo1_.id_cargo
inner join rh.categoria categoria2_ on cargo1_.id_categoria = categoria2_.id_categoria*/
where
	servidor0_.id_pessoa =1 ;
	and categoria2_.id_categoria =?
	
	select * from rh.servidor servidor0_
	
	select * from comum.pessoa;
	
	
	select
	usuario0_
from
	comum.usuario usuario0_
left outer join comum.pessoa pessoa1_ on
	usuario0_.id_pessoa = pessoa1_.id_pessoa
where
	usuario0_.id_usuario =1;
	
	
	select
	ssohash0_
from
	sync.sso_hash ssohash0_
where
	ssohash0_.hash ='f32168db0994c549c41836dc97b21aa434b095bfd205ef3f0a8874db64023cf2';
	
	
	
	
	
select * from provas.prova;
	
	
	
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
			and pe.data_expiracao >= now()))