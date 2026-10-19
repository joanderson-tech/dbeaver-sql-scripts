select
	id_unidade,
	codigo_unidade,
	nome,
	hierarquia
from
	comum.unidade
where ativo 
order by
	nome;

select * from comum.unidade u
where u.id_unidade = 605;

	
select * from comum.municipio m 
where id_unidade_federativa =27
and like 'MURICI';

SELECT * 
FROM comum.municipio m 
WHERE m.id_unidade_federativa = 27 
AND m.nome  LIKE '%MURICI%';
SELECT * FROM comum.unidade_federativa ;



-- Auto-generated SQL script #202404251551
UPDATE comum.unidade
	SET nome='Secretaria de Educação'
	WHERE id_unidade=1;


UPDATE comum.unidade
	SET nome='Regional Única de Ensino'
	WHERE id_unidade=1;
	
-- Auto-generated SQL script #202404301417
UPDATE comum.unidade
	SET nome='Secretaria de Murici/AL'
	WHERE id_unidade=1;

UPDATE comum.unidade
SET nome='Regional Única de Ensino'
WHERE id_unidade=1;


 select
	id_horario,
	inicio,
	fim,
	ano_entrada_vigor,
	h.tipo,
	h.ordem,
	h.ativo,
	u.id_unidade,
	u.nome,
	ee.id_etapa_ensino,
	ee.denominacao,
	t.descricao
from
	ensino.horario h
join comum.unidade u on
	u.id_unidade = h.id_unidade
join ensino.turno t on
	t.id_turno = h.tipo
left join basico.etapa_ensino ee on
	ee.id_etapa_ensino = h.id_etapa_ensino
where
	h.ativo
order by
	u.nome,
	ee.denominacao,
	t.descricao,
	h.ordem;

 select
	id_horario,
	inicio,
	fim,
	ano_entrada_vigor,
	h.tipo,
	h.ordem,
	h.ativo,
	u.id_unidade,
	u.nome,
	ee.id_etapa_ensino,
	ee.denominacao,
	t.descricao
from
	ensino.horario h
join comum.unidade u on
	u.id_unidade = h.id_unidade
join ensino.turno t on
	t.id_turno = h.tipo
left join basico.etapa_ensino ee on
	ee.id_etapa_ensino = h.id_etapa_ensino
where
	h.ativo
	and h.id_unidade = 605
order by
	u.nome,
	ee.denominacao,
	t.descricao,
	h.ordem;


  select
	id_horario,
	inicio,
	fim,
	ano_entrada_vigor,
	h.tipo,
	h.ordem,
	h.ativo,
	u.id_unidade,
	u.nome,
	ee.id_etapa_ensino,
	ee.denominacao,
	t.descricao
from
	ensino.horario h
join comum.unidade u on
	u.id_unidade = h.id_unidade
join ensino.turno t on
	t.id_turno = h.tipo
left join basico.etapa_ensino ee on
	ee.id_etapa_ensino = h.id_etapa_ensino
where
	h.ativo
	and h.id_unidade in (5883)
order by
	u.nome,
	ee.denominacao,
	t.descricao,
	h.ordem