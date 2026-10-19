select c.ano, c.denominacao, e.nome, * from alimentacao.cardapio_item_fichas cif
join alimentacao.cardapio_item ci on ci.id_cardapio_item = cif.id_cardapio_item 
join alimentacao.cardapio c on c.id_cardapio = ci.id_cardapio
join escola.escola e on e.id_escola = c.id_escola 
where  c.ano = '2023'
and e.id_escola = 51870373
and c.denominacao ILIKE '%car%';


select
	pais0_.id_pais as id1_435_0_,
	pais0_.nacionalidade as nacional2_435_0_,
	pais0_.nome as nome435_0_
from
	comum.pais pais0_
where
	pais0_.id_pais =?
