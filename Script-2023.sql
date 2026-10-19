with dias_mes as ( select date(days) as data_periodo,(CEILING((DATE_PART( 'day', days ) - DATE_PART( 'dow', days )) / 7) + 1) as semana, date_part('dow', days) as dia_semana
from generate_series('2026-02-01', '2026-02-28', '1 day'::interval) days ) select dm.data_periodo, ft.denominacao as descricao_merenda, 
from alimentacao.cardapio c
join alimentacao.cardapio_item ci on
ci.id_cardapio = c.id_cardapio
join dias_mes dm on
dm.semana = ci.semana
and dm.dia_semana = ci.dia_da_semana
join alimentacao.cardapio_item_fichas cif on
cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on
ft.id_ficha_tecnica = cif.id_ficha_tecnica
where c.id_escola = 51870364
order by data_periodo;



SELECT m.* FROM comum.municipio AS m where m.nome ilike '%nossa senhora do socorro%'

-- Versão com filtro de ano/período
SELECT distinct  e.nome
FROM escola.escola e
join basico.turma_serie ts on ts.id_escola = e.id_escola  
and ts.ativo 
and ts.ano = 2026
WHERE e.id_municipio = 2804805
and e.id_situacao_funcionamento = 1
and NOT EXISTS (
    select 1
    FROM alimentacao.cardapio c 
    WHERE c.id_escola = e.id_escola
);


    select *
    FROM alimentacao.cardapio c 
    WHERE c.id_escola in (51870339,51870340,51870341,51870342,51870343,51870344,51870345,51870346,51870347,51870348,51870349,51870350,51870351,51870352,51870353,51870354,51870355,51870356,51870357,51870358,51870359,51870360,51870361,51870362,51870363,51870364,51870365,51870366,51870367,51870368,51870369,51870370,51870371,51870372,51870373,51870374,51870375,51870376,51870377,51870378,51870379,51870380,51870381,51870382,51870383,51870384,51870385,52902326,53877856,53886804,53898153,53898193,54448999,54454612)