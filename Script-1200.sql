begin;

select 
'insert into ava.aula_extra
(id, id_turma,
 observacoes,
 data_aula,
 criado_em,
 criado_por,
 numero_aulas,
 tipo,
 aula_reposta,
 descricao,
 id_servidor,
 id_registro_cadastro,
 id_registro_atualizacao,
 dia_equivalente,
 de_interrupcao)
values ' || string_agg('(' || nextval('hibernate_sequence') || ', ' || t.id_turma || ', ' || 'NULL, ' || quote_literal('2025-09-13') || ', ' || quote_literal(now()::timestamp) || ', ' || 'NULL, ' ||
'1, ' || '3, ' || 'NULL, ' || quote_literal('Capacitação equivalente ao Sábado letivo, sobre o sistema Sigueduc.') || ', ' || 'NULL, ' || 'NULL, ' || 'NULL, ' ||
quote_literal('Segunda') || ', ' || 'false' || ')', ', ') || ';' solucao
from ensino.turma t
where t.ano = 2025
and t.id_situacao_turma = 1;


begin;
with dias_agg (dia) as (values
	('2025-05-10'),
	('2025-06-14'),
	('2025-09-13'),
	('2025-10-11') ),
turmas_agg as (
	select distinct	 
		coalesce(t.id_turma_agrupadora, t.id_turma) as id_turma,
		d.dia
	from dias_agg d, ensino.turma t
	where t.id_situacao_turma not in (4,9) 
	and t.ano = 2025
	and coalesce(t.id_turma_agrupadora, t.id_turma) not in (
		select 
			ae.id_turma 
		from ava.aula_extra ae
		where ae.id_turma = coalesce(t.id_turma_agrupadora, t.id_turma) 
		and ae.data_aula = d.dia::date
	)
)
insert into ava.aula_extra (id, id_turma, data_aula, criado_em, numero_aulas, tipo, descricao) (
	select
		nextval('hibernate_sequence') as id,
		t.id_turma,
		t.dia::date,
		now()::timestamp as criado_em,
		1 as numero_aulas,
		3 as tipo,
		'Sábado Letivo' as descricao
	from turmas_agg t);

WITH datas (dia, descricao) AS (VALUES
  	('2025-05-10', 'Sábado Letivo'),
	('2025-06-14', 'Sábado Letivo'),
	('2025-09-13', 'Sábado Letivo'),
	('2025-10-11', 'Sábado Letivo') )
SELECT distinct 'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'|| t.id_turma ||','''|| d.dia || ''','''||current_date||''',1,3, '''||d.descricao||''');'
	FROM ensino.turma t
	join basico.turma_serie ts on t.id_turma_serie  = ts.id_turma_serie 
	join basico.curriculo_basico cb  on cb.id_curriculo_basico  = ts.id_curriculo_medio 
	join ensino.docente_turma dt on dt.id_turma  = t.id_turma 
	join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico  = ts.id_curriculo_medio 
	and cbc.permite_alocacao_adjunto and cbc.id_componente_curricular = t.id_disciplina, datas d
	WHERE dt.ativo and not dt.finalizada 
	and (now() between dt.data_inicio and dt.data_fim ) and t.id_turma_agrupadora IS NOT NULL
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date);



