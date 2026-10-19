begin;

ROLLBACK;

-- Criar tabela temporária do parecer descritivo individual
-- Esta tabela será usada tanto para o preenchimento, quando para o backup, caso necessário.
create temp table backup_parecer_descritivo_individuas as 
select
	nextval('ensino_infantil.parecer_descritivo_individual_seq') as id_parecer_descritivo_individual,
	mes.id_matricula_discente_serie as id_matricula_discente_serie,
	null as descricao,
	true as ativo,
	null as descricao_medial,
	null as descricao_final
from ensino.matricula_componente mc
join diario.competencia_habilidades_aluno cha on cha.id_discente = mc.id_discente and mc.id_turma = cha.id_turma
join basico.matricula_estudante_serie mes on mes.id_estudante = mc.id_discente
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
where mc.id_turma in (682246)
and cha.ano_escolar = 2025 
and cha.ano_letivo = 2025
and ts.id_turma_serie = 51881290
and not exists (
	select 1
	from ensino_infantil.relatorio_avaliativo ra2
	where ra2.id_matricula_discente_serie = mes.id_matricula_discente_serie 
);

select * from backup_parecer_descritivo_individuas;

insert into ensino_infantil.parecer_descritivo_individual (
	id_parecer_descritivo_individual,
	id_matricula_discente_serie,
	descricao,
	ativo,
	descricao_medial,
	descricao_final
)
select
	id_parecer_descritivo_individual,
	id_matricula_discente_serie,
	descricao,
	ativo,
	descricao_medial,
	descricao_final
from backup_parecer_descritivo_individuas;

/*--backup parecer descritivo individual
delete from ensino_infantil.parecer_descritivo_individual
where id_parecer_descritivo_individual in (
    select id_parecer_descritivo_individual
    from backup_parecer_descritivo_individual
);*/

SELECT  'delete from ensino_infantil.relatorio_avaliativo where id_relatorio_avaliativo in ( ' || string_agg(id_parecer_descritivo_individual::TEXT,',') || ');'
FROM backup_parecer_descritivo_individuas ;


delete from ensino_infantil.relatorio_avaliativo where id_relatorio_avaliativo in ( 42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60);
--------------------------------------------------------------

-- Criar tabela temporária para o relatorio avaliativo
create temp table backup_relatorio_avaliativo as 
select
	nextval('ensino_infantil.relatorio_avaliativo_seq') as id_relatorio_avaliativo,
	7 as id_configuracao_relatorio,
	mes.id_matricula_discente_serie as id_matricula_discente_serie,
	1 as id_situacao_relatorio_avaliativo,
	true as ativo,
	null::integer as id_registro_cadastro,
	null::integer as id_registro_atualizacao,
	now()::timestamp as data_cadastro,
	null::timestamp as data_alteracao,
	pdi.id_parecer_descritivo_individual as id_parecer_descritivo_individual,
	0 as situacao,
	null as justificativa_situacao
from ensino.matricula_componente mc
join diario.competencia_habilidades_aluno cha on cha.id_discente = mc.id_discente and mc.id_turma = cha.id_turma
join basico.matricula_estudante_serie mes on mes.id_estudante = mc.id_discente
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
join ensino_infantil.parecer_descritivo_individual pdi on pdi.id_matricula_discente_serie = mes.id_matricula_discente_serie
where mc.id_turma in (682246)
and cha.ano_escolar = 2025 
and cha.ano_letivo = 2025
and ts.id_turma_serie = 51881290
and not exists (
	select 1
	from ensino_infantil.relatorio_avaliativo ra2
	where ra2.id_matricula_discente_serie = mes.id_matricula_discente_serie 
);

select * from backup_relatorio_avaliativo;

insert into ensino_infantil.relatorio_avaliativo (
	id_relatorio_avaliativo, 
	id_configuracao_relatorio, 
	id_matricula_discente_serie, 
	id_situacao_relatorio_avaliativo, 
	ativo, 
	id_registro_cadastro, 
	id_registro_atualizacao, 
	data_cadastro, 
	data_alteracao, 
	id_parecer_descritivo_individual, 
	situacao, 
	justificativa_situacao
)
select
	id_relatorio_avaliativo, 
	id_configuracao_relatorio, 
	id_matricula_discente_serie, 
	id_situacao_relatorio_avaliativo, 
	ativo, 
	id_registro_cadastro, 
	id_registro_atualizacao, 
	data_cadastro, 
	data_alteracao, 
	id_parecer_descritivo_individual, 
	situacao, 
	justificativa_situacao
from backup_relatorio_avaliativo;

commit;
--rollback;

--backup relatorio avaliativo
/*delete from ensino_infantil.relatorio_avaliativo
where id_relatorio_avaliativo in (
    select id_relatorio_avaliativo
    from backup_relatorio_avaliativo
);*/

SELECT  'delete from ensino_infantil.relatorio_avaliativo where id_relatorio_avaliativo in ( ' || string_agg(id_relatorio_avaliativo::TEXT,',') || ');'
FROM backup_relatorio_avaliativo ;

delete from ensino_infantil.relatorio_avaliativo where id_relatorio_avaliativo in ( 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22);

--------------------------------------------------------------

--Criar tabela temporaria para relatorio avaliativo componente
create temp table backup_relatorio_avaliativo_componente as
select
	nextval('ensino_infantil.relatorio_avaliativo_componente_seq') as id_relatorio_avaliativo_componente,
	ra.id_relatorio_avaliativo as id_relatorio_avaliativo,
	mc.id_matricula_componente as id_matricula_componente, 
	crc.id_configuracao_relatorio_componente as id_configuracao_relatorio_componente,
	cha.descricao_parcial as avaliacao_descritiva,
	1 as id_situacao_relatorio_avaliativo_componente,
	null::integer as id_registro_cadastro,
	null::integer as id_registro_atualizacao,
	now()::timestamp as data_cadastro,
	null::timestamp as data_alteracao,
	cha.descricao_conclusiva as avaliacao_descritiva_2,
	null::text as avaliacao_descritiva_3,
	null::text as avaliacao_descritiva_4,
	null::integer as parecer_final_fixo,
	null::text as parecer_final_descritivo
from diario.competencia_habilidades_aluno cha 
join ensino.matricula_componente mc on mc.id_discente = cha.id_discente and mc.id_turma = cha.id_turma
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mc.id_matricula_estudante_serie
join ensino_infantil.configuracao_relatorio_componente crc on crc.id_configuracao_relatorio = ra.id_configuracao_relatorio and mc.id_componente_curricular = crc.id_componente_curricular
where cha.id_turma in (682246,682247,682248,682249,682250);

select * from backup_relatorio_avaliativo_componente;

insert into ensino_infantil.relatorio_avaliativo_componente (
	id_relatorio_avaliativo_componente, 
	id_relatorio_avaliativo, 
	id_matricula_componente, 
	id_configuracao_relatorio_componente, 
	avaliacao_descritiva, 
	id_situacao_relatorio_avaliativo_componente, 
	id_registro_cadastro, 
	id_registro_atualizacao, 
	data_cadastro, 
	data_alteracao, 
	avaliacao_descritiva_2, 
	avaliacao_descritiva_3, 
	avaliacao_descritiva_4, 
	parecer_final_fixo, 
	parecer_final_descritivo
)
select
	id_relatorio_avaliativo_componente, 
	id_relatorio_avaliativo, 
	id_matricula_componente, 
	id_configuracao_relatorio_componente, 
	avaliacao_descritiva, 
	id_situacao_relatorio_avaliativo_componente, 
	id_registro_cadastro, 
	id_registro_atualizacao, 
	data_cadastro, 
	data_alteracao, 
	avaliacao_descritiva_2, 
	avaliacao_descritiva_3, 
	avaliacao_descritiva_4, 
	parecer_final_fixo, 
	parecer_final_descritivo
from backup_relatorio_avaliativo_componente;

--backup relatorio_avaliativo_componente
delete from ensino_infantil.relatorio_avaliativo_componente
where id_relatorio_avaliativo_componente in (
    select id_relatorio_avaliativo_componente
    from backup_relatorio_avaliativo_componente
);


SELECT  'delete from ensino_infantil.relatorio_avaliativo_componente where id_relatorio_avaliativo_componente in ( ' || string_agg(id_relatorio_avaliativo_componente::TEXT,',') || ');'
FROM backup_relatorio_avaliativo_componente ;


delete from ensino_infantil.relatorio_avaliativo_componente where id_relatorio_avaliativo_componente in ( 7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101);

commit;
--rollback;