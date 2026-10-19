select
	ta.id_topico_aula,
	ta."data",
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
	and ta.programado = true;
