with habilidades_competencia_novas as (
select
	hc.id_habilidade_competencia
from
	ensino_infantil.habilidade_competencia hc
where
	hc.ativo = true
	and hc.descricao similar to '%(EI03CG01|EI03CG02|EI03CG04|EI03CG05)%'
),
configuracoes_relatorio_componente_habilidades_novas as (
select
	nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade,
	8 id_configuracao_relatorio_componente,
	hcn.id_habilidade_competencia,
	true ativo
from
	habilidades_competencia_novas hcn
order by
	hcn.id_habilidade_competencia 
),
relatorio_avaliativo_componente as (
select
	rac.id_relatorio_avaliativo_componente
from
	ensino_infantil.relatorio_avaliativo ra
join ensino_infantil.relatorio_avaliativo_componente rac on
	rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
join ensino_infantil.configuracao_relatorio_componente crc on
	crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
where
	ra.ativo = true
	and crc.id_configuracao_relatorio = 5
	and crc.id_componente_curricular = 507
),
relatorios_avaliativos_habilidades_novos as (
select
	nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade,
	rac.id_relatorio_avaliativo_componente,
	crchn.id_configuracao_relatorio_componente_habilidade
from
	relatorio_avaliativo_componente rac,
	configuracoes_relatorio_componente_habilidades_novas crchn
order by
	rac.id_relatorio_avaliativo_componente,
	crchn.id_configuracao_relatorio_componente_habilidade
),
relatorios_avaliativos_habilidades_respostas_novos as (
select
	nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta,
	rahn.id_relatorio_avaliativo_habilidade,
	gs.periodo
from
	relatorios_avaliativos_habilidades_novos rahn
cross join generate_series(1, 4) as gs(periodo)
order by
	rahn.id_relatorio_avaliativo_habilidade,
	gs.periodo
),
script_configuracoes_relatorio_componente_habilidades_novas as (
select
	'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade || ', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao,
	'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup
from
	configuracoes_relatorio_componente_habilidades_novas crchn
),
script_relatorios_avaliativos_habilidades_novos as (
select
	'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao,
	'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup
from
	relatorios_avaliativos_habilidades_novos rahn
),
script_relatorios_avaliativos_habilidades_respostas_novos as (
select
	'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao,
	'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup
from
	relatorios_avaliativos_habilidades_respostas_novos rahrn
)
select
	*
from
	script_configuracoes_relatorio_componente_habilidades_novas
union all
select
	*
from
	script_relatorios_avaliativos_habilidades_novos
union all
select
	*
from
	script_relatorios_avaliativos_habilidades_respostas_novos;

begin;
rollback;

select * from ensino_infantil.relatorio_avaliativo_habilidade


commit;

