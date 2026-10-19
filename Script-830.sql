with sol_trans_opcao as (
select
	o.id_solicitacao,
	o.id_escola,
	o.ordem
from
	matricula.solicitacao_transferencia_opcao_escola o
where
	o.ordem = 1 ),
escolas as (
select
	distinct escola.id_escola,
	escola.nome as nome_escola,
	escola.id_municipio,
	dired.nome as dired,
	dired.codigo_unidade,
	dired.id_unidade,
	municipio.nome as municipio
from
	escola.escola escola
inner join sol_trans_opcao o on
	o.id_escola = escola.id_escola
inner join comum.unidade dired on
	dired.id_unidade = escola.id_regional_ensino
inner join comum.municipio municipio on
	municipio.id_municipio = escola.id_municipio )
select
	solicitacao.ano_escolar as anoescolar,
	(
	select
		count(id_solicitacao_transferencia)
	from
		matricula.solicitacao_transferencia st
	where
		st.ano_escolar = solicitacao.ano_escolar
		and exists( select o.id_solicitacao from sol_trans_opcao o where o.id_solicitacao = st.id_solicitacao_transferencia)) as qtdanoescolar,
	escola.dired as dired,
	escola.codigo_unidade,
	(
	select
		count(e.id_municipio)
	from
		sol_trans_opcao o
	inner join escola.escola e on
		e.id_escola = o.id_escola
	where
		e.id_regional_ensino = escola.id_unidade) as qtddired,
	escola.municipio as municipio,
	(
	select
		count(e.id_municipio)
	from
		sol_trans_opcao o
	inner join escola.escola e on
		e.id_escola = o.id_escola
	where
		e.id_municipio = escola.id_municipio) as qtdmunicipio,
	escola.nome_escola as escoladestino,
	(
	select
		count(o.id_escola)
	from
		sol_trans_opcao o
	where
		o.id_escola = escola.id_escola) as qtdescoladestino
from
	sol_trans_opcao opcao
inner join escolas escola on
	escola.id_escola = opcao.id_escola
inner join matricula.solicitacao_transferencia solicitacao on
	solicitacao.id_solicitacao_transferencia = opcao.id_solicitacao
where
	solicitacao.ano_escolar = 2025
group by
	solicitacao.ano_escolar,
	escola.dired,
	escola.codigo_unidade,
	escola.municipio,
	escola.nome_escola,
	escola.id_unidade,
	escola.id_municipio,
	escola.id_escola
order by
	escola.codigo_unidade,
	escola.nome_escola;