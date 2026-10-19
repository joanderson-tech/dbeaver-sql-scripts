
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<edu:educacao xmlns:edu="http://www.tce.se.gov.br/sagres2026/xml/sagresEdu">
    <edu:PrestacaoContas>
        <edu:codigoUnidGestora>006303</edu:codigoUnidGestora>
        <edu:nomeUnidGestora>Lagarto</edu:nomeUnidGestora>
        <edu:cpfResponsavel>69317127568</edu:cpfResponsavel>
        <edu:cpfGestor>69317127568</edu:cpfGestor>
        <edu:anoReferencia>2026</edu:anoReferencia>
        <edu:mesReferencia>3</edu:mesReferencia>
        <edu:versaoXml>0</edu:versaoXml>
        <edu:diaInicPresContas>01</edu:diaInicPresContas>
        <edu:diaFinaPresContas>31</edu:diaFinaPresContas>
    </edu:PrestacaoContas>
    
    
    
    SELECT * FROM comum.pessoa WHERE cpf_cnpj = '69317127568';
    
    
SELECT *
FROM escola.escola 
WHERE codigo_inep  ILIKE '%28081404%'

SELECT * FROM basico.

SELECT * FROM comum.unidade u 
WHERE u.id_unidade = 605

SELECT u.* FROM comum.unidade AS u
WHERE id_unidade = 1


with dias_mes as (
  select
    date(days) as data_periodo,
    (CEILING((DATE_PART('day', days) - DATE_PART('dow', days)) / 7) + 1)
      - (CASE WHEN DATE_PART('dow', DATE_TRUNC('month', days)) = 0 THEN 1 ELSE 0 END) as semana,
    date_part('dow', days) as dia_semana
  from generate_series('2026-03-01', '2026-03-31', '1 day'::interval) days
)
select * from dias_mes order by data_periodo;

SELECT * FROM alimentacao.nutricionista;



SELECT * from alimentacao.cardapio c;

SELECT * FROM  alimentacao.cardapio_item ci 
join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on ft.id_ficha_tecnica = cif.id_ficha_tecnica
WHERE ci.id_cardapio = 52937667;


UNIDADE MUNICIPAL DE EDUCACAO INFANTIL PROFESSORA MARIA VALDEREZ FREIRE PRATA - CRIANCA FELIZ


with dias_mes as (
  select
    date(days) as data_periodo,
    (CEILING((DATE_PART('day', days) - DATE_PART('dow', days)) / 7) + 1) - (CASE WHEN DATE_PART('dow', DATE_TRUNC('month', days)) = 0 THEN 1 ELSE 0 END) as semana,
    date_part('dow', days) as dia_semana
  from generate_series('2026-03-01', '2026-03-31', '1 day'::interval) days
)
SELECT  DISTINCT 
  dm.data_periodo, c.denominacao,c.id_cardapio, 
  ft.denominacao as descricao_merenda,
  c.id_escola
from alimentacao.cardapio c
join alimentacao.cardapio_item ci on ci.id_cardapio = c.id_cardapio
join dias_mes dm on dm.semana = ci.semana and dm.dia_semana = ci.dia_da_semana
join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on ft.id_ficha_tecnica = cif.id_ficha_tecnica
where c.id_escola in (51877467)
AND ft.denominacao = 'SUCO DE FRUTA E PÃO COM OVOS MEXIDOS'
order by data_periodo, denominacao;


SELECT * FROM alimentacao.cardapio c WHERE c.id_escola = 51877467 AND c.id_cardapio = 52949346;

SELECT DISTINCT  ft.*
from alimentacao.cardapio c
join alimentacao.cardapio_item ci on ci.id_cardapio = c.id_cardapio
JOIN alimentacao.cardapio_item_fichas cif ON cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on ft.id_ficha_tecnica = cif.id_ficha_tecnica
where c.id_escola in (51877467)
AND ft.denominacao = 'SUCO DE FRUTA E PÃO COM OVOS MEXIDOS';

SELECT * FROM alimentacao.cardapio_item_fichas ft; WHERE ft.id_ficha_tecnica = 52104232;


SELECT id_cardapio_item_fichas, id_cardapio_item, id_ficha_tecnica
FROM alimentacao.cardapio_item_fichas
WHERE id_cardapio_item_fichas NOT IN (
  SELECT MIN(id_cardapio_item_fichas)
  FROM alimentacao.cardapio_item_fichas
  GROUP BY id_cardapio_item, id_ficha_tecnica
);
LIMIT 50;






with dias_mes as (
  select
    date(days) as data_periodo,
    (CEILING((DATE_PART('day', days) - DATE_PART('dow', days)) / 7) + 1) 
      - (CASE WHEN DATE_PART('dow', DATE_TRUNC('month', days)) = 0 THEN 1 ELSE 0 END) as semana,
    date_part('dow', days) as dia_semana
  from generate_series('2026-03-01', '2026-03-31', '1 day'::interval) days
)
SELECT
	c.denominacao ,
  dm.data_periodo,
  ft.denominacao as descricao_merenda,
  c.id_escola
from alimentacao.cardapio c
join alimentacao.cardapio_item ci on ci.id_cardapio = c.id_cardapio
join dias_mes dm on dm.semana = ci.semana and dm.dia_semana = ci.dia_da_semana
join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on ft.id_ficha_tecnica = cif.id_ficha_tecnica
where 
    c.id_escola in (51877510, 51877467)  -- cardápio específico da escola
    OR c.id_escola is null               -- cardápio padrão da secretaria (vale para todas)
order by data_periodo;

SELECT * 
c.denominacao ,
  dm.data_periodo,
  ft.denominacao as descricao_merenda,
  c.id_escola
from alimentacao.cardapio c
join alimentacao.cardapio_item ci on ci.id_cardapio = c.id_cardapio
join dias_mes dm on dm.semana = ci.semana and dm.dia_semana = ci.dia_da_semana
join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on ft.id_ficha_tecnica = cif.id_ficha_tecnica
where 
    c.id_escola in (51877510, 51877467)  -- cardápio específico da escola
    OR c.id_escola is null               -- cardápio padrão da secretaria (vale para todas)
order by data_periodo;




-- Quantas duplicatas existem?
SELECT COUNT(*) as total_duplicatas
FROM alimentacao.cardapio_item_fichas
WHERE id_cardapio_item_fichas NOT IN (
  SELECT MIN(id_cardapio_item_fichas)
  FROM alimentacao.cardapio_item_fichas
  GROUP BY id_cardapio_item, id_ficha_tecnica
);


with dias_mes as (
  select
    date(days) as data_periodo,
    (CEILING((DATE_PART('day', days) - DATE_PART('dow', days)) / 7) + 1) 
      - (CASE WHEN DATE_PART('dow', DATE_TRUNC('month', days)) = 0 THEN 1 ELSE 0 END) as semana,
    date_part('dow', days) as dia_semana
  from generate_series('2026-03-01', '2026-03-31', '1 day'::interval) days
)
SELECT DISTINCT ON (dm.data_periodo, c.denominacao, c.id_cardapio, ft.denominacao, c.id_escola)
  dm.data_periodo,
  c.denominacao,
  c.id_cardapio,
  ft.denominacao as descricao_merenda,
  c.id_escola
from alimentacao.cardapio c
join alimentacao.cardapio_item ci on ci.id_cardapio = c.id_cardapio
join dias_mes dm on dm.semana = ci.semana and dm.dia_semana = ci.dia_da_semana
join alimentacao.cardapio_item_fichas cif on cif.id_cardapio_item = ci.id_cardapio_item
join alimentacao.ficha_tecnica ft on ft.id_ficha_tecnica = cif.id_ficha_tecnica
where c.id_escola in (51877467)
  AND ft.denominacao = 'SUCO DE FRUTA E PÃO COM OVOS MEXIDOS'
order by dm.data_periodo, c.denominacao, c.id_cardapio, ft.denominacao, c.id_escola;