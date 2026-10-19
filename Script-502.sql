begin;

insert
	into
	ensino.turma (agrupadora,
	ano,
	capacidade_aluno,
	id_categoria_componente,
	categoria_esportiva,
	codigo,
	codigo_rh,
	data_alteracao,
	data_cadastro,
	data_consolidacao,
	data_fim,
	data_inicio,
	descricao_horario,
	id_disciplina,
	execucao,
	extra,
	grupo,
	local,
	id_modulo,
	motivo_exclusao,
	nome_professor,
	numero_estudantes,
	observacao,
	ordem,
	periodo,
	processada,
	processada_rematricula,
	execucao_parcial_qtd_unidades,
	id_registro_atualizacao,
	id_registro_cadastro,
	id_situacao_turma,
	tipo,
	total_matriculados,
	id_turma_agrupadora,
	id_turma_serie,
	id_usuario_consolidacao,
	id_turma)
values ('FALSE',
2025,
40,
1,
null,
'EIPREMEIP1K',
null,
null,
'2025-05-13 14:56:17.665-03',
null,
null,
null,
null,
220,
null,
'FALSE',
null,
null,
null,
null,
null,
null,
null,
1,
1,
'FALSE',
'FALSE',
null,
null,
null,
1,
1,
null,
null,
null,
null,
685442);

select
	count(ts.id_turma_serie)
from
	basico.turma_serie ts
join basico.serie s
		using (id_serie)
join ensino.turma tu
		using (id_turma_serie)
where
	s.id_etapa_ensino = ?
	and s.id_serie = ?
	and ts.nome = ?
	and ts.id_escola = ?
	and ts.ano = ?
	and ts.ativo = ?
	and tu.periodo = ?;


/*was aborted: ERROR: duplicate key value violates unique constraint "idx_turma_serie_situacao"
  Detalhe: key (id_disciplina,
id_turma_serie,
id_situacao_turma)=(220,
52046305,
1) already exists.

Erro SQL [23503]: ERROR: insert or update on table "turma" violates foreign key constraint "id_turma_agrupadora_fk"
  Detalhe: Key (id_turma_agrupadora)=(685441) is not present in table "turma".*/

rollback;

select * from ensino.turma t where t.id_disciplina = 220 and t.id_turma = 685442;

select * from ensino.turma t where t.id_turma_serie = 52046305;

SELECT ts.* FROM basico.turma_serie AS ts WHERE id_serie  = 51869714;
