 insert
	into
	temp_topicos_duplicados (id_topico_aula,
	conteudo_ministrado) with dados as (
	select
		ta.id_topico_aula,
		ta. data ,
		ta.conteudo_ministrado,
		ta.descricao,
		ta.data_cadastro,
		ta.programado,
		ta.id_turma
	from
		ava.topico_aula ta
	where
		ta.descricao is not null
		and (ta.conteudo_ministrado is not null
			and TRIM(ta.conteudo_ministrado) <> '')
		and ta.data_cadastro >= '2025-01-01'
		and ta.programado = true ),
	datas_duplicadas_e_nao_programados as (
	select
		d. data
	from
		dados d
	join ava.topico_aula taa on
		d. data = taa. data
		and d.id_turma = taa.id_turma
	where
		taa.programado = false
	group by
		d. data
	having
		COUNT(d. data ) > 0 )
select
	d.id_topico_aula,
	d.conteudo_ministrado
from
	dados d
join datas_duplicadas_e_nao_programados ddp on
	d. data = ddp. data ; 
