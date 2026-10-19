with cardapio_def as (
    select *
    from alimentacao.cardapio c
    where c.id_cardapio IN (52105138, 52096315, 52096201, 52095749, 52095867, 52096575)
)
select
    nextval('hibernate_sequence') as id_cardapio,
    cd.denominacao,
    cd.id_nutricionista,
    cd.ano,
    e.id_escola,
    u.nome as nome_escola,
    cd.id_etapa_ensino
from escola.escola e
join comum.unidade u on u.id_unidade = e.id_unidade_escola
cross join cardapio_def cd
where u.ativo
order by u.nome;

SELECT * FROM escola.escola e
join comum.unidade u on u.id_unidade = e.id_unidade_escola;
WHERE e.id_escola in(51892306, 51870373) ;


SELECT DISTINCT ts.id_escola
FROM basico.turma_serie ts
WHERE ts.ano = 2026
AND ts.ativo ;


BEGIN;

--insert alimentacao.cardapio	
with cardapio_def as (	
	select 
		*
	from alimentacao.cardapio c 
	where c.id_cardapio IN (52105138, 52096315, 52096201, 52095749, 52095867, 52096575)
)
insert into alimentacao.cardapio
(id_cardapio, denominacao, id_nutricionista, ano, id_escola, id_etapa_ensino)
select 
	nextval('hibernate_sequence') as id_cardapio,
	cd.denominacao,
	cd.id_nutricionista,
	cd.ano,
	e.id_escola,
	cd.id_etapa_ensino
from escola.escola e 
join comum.unidade u on u.id_unidade = e.id_unidade_escola 
cross join cardapio_def cd
where u.ativo;


--insert alimentacao.cardapio_item
with cardapio_item_def as (
	select
		*
	from alimentacao.cardapio_item ci
	where ci.id_cardapio IN (52105138, 52096315, 52096201, 52095749, 52095867, 52096575)
)
insert into alimentacao.cardapio_item
(id_cardapio_item, id_cardapio, semana, dia_da_semana)
select 
	nextval('hibernate_sequence') as id_cardapio_item,
	c.id_cardapio,
	cid.semana,
	cid.dia_da_semana
from alimentacao.cardapio c 
cross join cardapio_item_def cid
where c.id_cardapio not in (
	select distinct
		c1.id_cardapio
	from alimentacao.cardapio c1 
	join alimentacao.cardapio_item ci on ci.id_cardapio = c1.id_cardapio
);

--Updated Rows	345600
--insert alimentacao.cardapio_item_fichas
with cardapio_item_ficha_def as (
	select 
		ci.semana,
		ci.dia_da_semana,
		cif.*
	from alimentacao.cardapio_item ci
	join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item 
	where ci.id_cardapio IN (52105138, 52096315, 52096201, 52095749, 52095867, 52096575)
)
insert into alimentacao.cardapio_item_fichas
(id_cardapio_item_fichas, id_cardapio_item, id_ficha_tecnica)
select distinct
	nextval('hibernate_sequence') as id_cardapio_item_fichas,
	ci.id_cardapio_item,
	cifd.id_ficha_tecnica
from alimentacao.cardapio_item ci
join cardapio_item_ficha_def cifd on cifd.semana = ci.semana and cifd.dia_da_semana = ci.dia_da_semana 
where ci.id_cardapio not in (
	select distinct
		c1.id_cardapio
	from alimentacao.cardapio c1 
	join alimentacao.cardapio_item ci on ci.id_cardapio = c1.id_cardapio
	join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item 
);

COMMIT;