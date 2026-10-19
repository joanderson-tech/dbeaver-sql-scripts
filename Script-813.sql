 
 
CREATE TEMPORARY TABLE temp_inserted_topico_aula_ids ( id_topico_aula BIGINT PRIMARY KEY ); 
 CREATE TEMPORARY TABLE backup_conteudo_ministrado ( id_topico_aula BIGINT PRIMARY KEY, conteudo_original TEXT,  data_backup TIMESTAMP DEFAULT now() ); 
 CREATE TEMPORARY TABLE temp_topicos_duplicados ( id_topico_aula INT, conteudo_ministrado TEXT ); 

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
 
 update
	ava.topico_aula
set
	conteudo_ministrado = ''
where
	id_topico_aula in (
	select
		id_topico_aula
	from
		temp_topicos_duplicados); 
 with inserted_rows as (
insert
	into
		ava.topico_aula ( id_topico_aula,
		id_turma,
		descricao,
		data ,
		fim,
		id_topico_pai,
		conteudo,
		id_usuario,
		data_cadastro,
		visivel,
		ativo,
		id_docente_turma,
		aula_cancelada,
		id_aula_extra,
		bimestre,
		programado,
		bimestral,
		necessita_correcao,
		replica_conteudo,
		conteudo_ministrado )
		select
			nextval('hibernate_sequence') as id_topico_aula,
			ta.id_turma,
			null as descricao,
			ta. data ,
			ta.fim,
			null as id_topico_pai,
			null as conteudo,
			1 as id_usuario,
			now() as data_cadastro,
			false as visivel,
			true as ativo,
			null as id_docente_turma,
			false as aula_cancelada,
			null as id_aula_extra,
			ta.bimestre,
			false as programado,
			false as bimestral,
			false as necessita_correcao,
			false as replica_conteudo,
			ta.conteudo_ministrado
		from
			ava.topico_aula ta
		where
			ta.descricao is not null
			and (ta.conteudo_ministrado is not null
				and TRIM(ta.conteudo_ministrado) <> '')
			and ta.data_cadastro >= '2025-01-01'
			and ta.programado = true returning id_topico_aula )
insert
	into
	temp_inserted_topico_aula_ids (id_topico_aula)
select
	id_topico_aula
from
	inserted_rows; 
 insert
	into
	backup_conteudo_ministrado (id_topico_aula,
	conteudo_original)
select
	ta.id_topico_aula,
	ta.conteudo_ministrado
from
	ava.topico_aula ta
where
	ta.descricao is not null
	and (ta.conteudo_ministrado is not null
		and TRIM(ta.conteudo_ministrado) <> '')
	and ta.data_cadastro >= '2025-01-01'
	and ta.programado = true
	and ta.id_turma = 681952; 
 update
	ava.topico_aula
set
	conteudo_ministrado = ''
where
	id_topico_aula in (
	select
		id_topico_aula
	from
		backup_conteudo_ministrado ); 
 select
	'UPDATE ava.topico_aula SET conteudo_ministrado = ' || case
		when b.conteudo_ministrado is not null then '''' || replace(b.conteudo_ministrado, '''', '''''') || ''''
		else 'NULL'
	end || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' as restore_statement
from
	temp_topicos_duplicados b; 
 select
	'UPDATE ava.topico_aula SET conteudo_ministrado = ' || case
		when b.conteudo_original is not null then '''' || replace(b.conteudo_original, '''', '''''') || ''''
		else 'NULL'
	end || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' as restore_statement
from
	backup_conteudo_ministrado b; 
 SELECT 'DELETE FROM ava.topico_aula WHERE id_topico_aula = ' || tid.id_topico_aula || ';' AS delete_statement FROM temp_inserted_topico_aula_ids tid; 
 DROP TABLE temp_inserted_topico_aula_ids; 
 DROP table backup_conteudo_ministrado; 
 DROP table temp_topicos_duplicados; 