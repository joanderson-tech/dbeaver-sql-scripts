select
	ce.id_calendario_escolar,
	ce.inicio_bim_1,
	cast(coalesce(ece.fim_bim_4,
	ce.fim_bim_4) as date)
from
	basico.calendario_escolar ce
left join diario.extensao_calendario_escolar ece on
	ece.id_calendario_escolar = ce.id_calendario_escolar
	and ece.id_escola = 51872608
	and ece.data_fim_validade is null
where
	ce.ativo
	and ce.ano = 2024;

with docente_turma_view as (
select
	dt.id_docente,
	dt.id_turma,
	dt.ativo,
	row_number() over(
	order by dt.data_fim desc) as ordem
from
	ensino.docente_turma dt
where
	dt.id_turma = 733295
	and dt.ativo
)select
	distinct ie.id_interrupcao_escola
from
	ensino.interrupcao_escola_professor iep
join ensino.interrupcao_escola ie
		using (id_interrupcao_escola)
join docente_turma_view dtv on
	dtv.id_docente = iep.id_professor
	and dtv.ordem = 1
where
	dtv.id_turma = 733295
	and dtv.ativo;

select
	interrupca0_.id_interrupcao_escola as id1_869_,
	interrupca0_.ativo as ativo869_,
	interrupca0_.data_cadastro as data3_869_,
	interrupca0_.descricao as descricao869_,
	interrupca0_.id_escola as id12_869_,
	interrupca0_.fim as fim869_,
	interrupca0_.inicio as inicio869_,
	interrupca0_.id_motivo_interrupcao_escola as id10_869_,
	interrupca0_.motivo_string as motivo7_869_,
	interrupca0_.id_registro_cadastro as id11_869_,
	interrupca0_.tipo as tipo869_,
	interrupca0_.id_turno as id9_869_
from
	ensino.interrupcao_escola interrupca0_
where
	interrupca0_.ativo = trueValue()
	and interrupca0_.id_escola =?
	and interrupca0_.inicio <=?
	and interrupca0_.fim >=?
	and (interrupca0_.tipo = 'TOTAL'
		or interrupca0_.tipo = 'TURNO'
		and interrupca0_.id_turno =?
		or interrupca0_.tipo = 'PROFESSOR'
		and (interrupca0_.id_interrupcao_escola in (70044309 , 70045533 , 70045813 , 0)))
order by
	interrupca0_.inicio;

select
	escola0_.id_escola as id1_863_17_,
	escola0_.ato_autorizacao_doe_data as ato2_863_17_,
	escola0_.ato_autorizacao_doe_numero as ato3_863_17_,
	escola0_.ato_autorizacao_data as ato4_863_17_,
	escola0_.ato_autorizacao_descricao as ato5_863_17_,
	escola0_.ato_criacao_doe_data as ato6_863_17_,
	escola0_.ato_criacao_doe_numero as ato7_863_17_,
	escola0_.ato_criacao_data as ato8_863_17_,
	escola0_.ato_criacao_descricao as ato9_863_17_,
	escola0_.ato_reconhecimento_doe_data as ato10_863_17_,
	escola0_.ato_reconhecimento_doe_numero as ato11_863_17_,
	escola0_.ato_reconhecimento_data as ato12_863_17_,
	escola0_.ato_reconhecimento_descricao as ato13_863_17_,
	escola0_.id_bairro_escola as id43_863_17_,
	escola0_.cep as cep863_17_,
	escola0_.cnpj as cnpj863_17_,
	escola0_.codigo_acao as codigo16_863_17_,
	escola0_.codigo_cadastro_escolar as codigo17_863_17_,
	escola0_.codigo_inep as codigo18_863_17_,
	escola0_.codigo_ies as codigo19_863_17_,
	escola0_.codigo_legado as codigo20_863_17_,
	escola0_.id_conta as id34_863_17_,
	escola0_.data_validacao_geocode as data21_863_17_,
	escola0_.id_dependencia_administrativa as id35_863_17_,
	escola0_.distrito as distrito863_17_,
	escola0_.id_drae as id42_863_17_,
	escola0_.email as email863_17_,
	escola0_.endereco as endereco863_17_,
	escola0_.escola_rh as escola25_863_17_,
	escola0_.fax as fax863_17_,
	escola0_.geocode as geocode863_17_,
	escola0_.instituicao_ensino_superior as institu28_863_17_,
	escola0_.id_localizacao_zona as id41_863_17_,
	escola0_.id_municipio as id36_863_17_,
	escola0_.nome as nome863_17_,
	escola0_.numero as numero863_17_,
	escola0_.id_regional_ensino as id45_863_17_,
	escola0_.senhaTransferencia as senhaTr31_863_17_,
	escola0_.sigla as sigla863_17_,
	escola0_.id_situacao_funcionamento as id44_863_17_,
	escola0_.telefone as telefone863_17_,
	escola0_.id_tipo_unidade_escolar as id39_863_17_,
	escola0_.id_unidade_escola as id38_863_17_,
	escola0_.id_registro_validacao_geocode as id37_863_17_,
	escola0_.id_zona_municipal as id40_863_17_,
	bairroesco1_.id_bairro_escola as id1_860_0_,
	bairroesco1_.ativo as ativo860_0_,
	bairroesco1_.id_municipio as id4_860_0_,
	bairroesco1_.denominacao as denomina3_860_0_,
	municipio2_.id_municipio as id1_434_1_,
	municipio2_.ativo as ativo434_1_,
	municipio2_.codigo as codigo434_1_,
	municipio2_.codigo_acao as codigo4_434_1_,
	municipio2_.nome as nome434_1_,
	municipio2_.id_unidade_federativa as id6_434_1_,
	unidadefed3_.id_unidade_federativa as id1_464_2_,
	unidadefed3_.ativo as ativo464_2_,
	unidadefed3_.id_capital as id6_464_2_,
	unidadefed3_.descricao as descricao464_2_,
	unidadefed3_.id_pais as id5_464_2_,
	unidadefed3_.sigla as sigla464_2_,
	municipio4_.id_municipio as id1_434_3_,
	municipio4_.ativo as ativo434_3_,
	municipio4_.codigo as codigo434_3_,
	municipio4_.codigo_acao as codigo4_434_3_,
	municipio4_.nome as nome434_3_,
	municipio4_.id_unidade_federativa as id6_434_3_,
	pais5_.id_pais as id1_435_4_,
	pais5_.nacionalidade as nacional2_435_4_,
	pais5_.nome as nome435_4_,
	contabanca6_.id_conta_bancaria as id1_427_5_,
	contabanca6_.agencia as agencia427_5_,
	contabanca6_.id_banco as id5_427_5_,
	contabanca6_.numero as numero427_5_,
	contabanca6_.variacao as variacao427_5_,
	banco7_.id_banco as id1_424_6_,
	banco7_.ativo as ativo424_6_,
	banco7_.codigo as codigo424_6_,
	banco7_.denominacao as denomina4_424_6_,
	banco7_.publicado as publicado424_6_,
	dependenci8_.id_dependencia_administrativa_escola as id1_862_7_,
	dependenci8_.denominacao as denomina2_862_7_,
	unidade9_.id_unidade as id1_465_8_,
	unidade9_.ativo as ativo465_8_,
	unidade9_.bairro as bairro465_8_,
	unidade9_.cep as cep465_8_,
	unidade9_.cnpj as cnpj465_8_,
	unidade9_.codigo_unidade as codigo6_465_8_,
	unidade9_.codigo_inep as codigo7_465_8_,
	unidade9_.codigo_rh as codigo8_465_8_,
	unidade9_.complemento as compleme9_465_8_,
	unidade9_.data_cadastro as data10_465_8_,
	unidade9_.distrito as distrito465_8_,
	unidade9_.email as email465_8_,
	unidade9_.endereco as endereco465_8_,
	unidade9_.fax as fax465_8_,
	unidade9_.hierarquia as hierarquia465_8_,
	unidade9_.id_municipio as id16_465_8_,
	unidade9_.instituicao_ensino_superior as institu17_465_8_,
	unidade9_.nome as nome465_8_,
	unidade9_.nome_ascii as nome19_465_8_,
	unidade9_.numero as numero465_8_,
	unidade9_.sigla as sigla465_8_,
	unidade9_.telefone as telefone465_8_,
	unidade9_.tipo as tipo465_8_,
	unidade9_.uf as uf465_8_,
	unidade9_.unidade_orcamentaria as unidade25_465_8_,
	unidade9_.id_responsavel as id26_465_8_,
	localizaca10_.id_localizacao_zona as id1_875_9_,
	localizaca10_.denominacao as denomina2_875_9_,
	municipio11_.id_municipio as id1_434_10_,
	municipio11_.ativo as ativo434_10_,
	municipio11_.codigo as codigo434_10_,
	municipio11_.codigo_acao as codigo4_434_10_,
	municipio11_.nome as nome434_10_,
	municipio11_.id_unidade_federativa as id6_434_10_,
	unidade12_.id_unidade as id1_465_11_,
	unidade12_.ativo as ativo465_11_,
	unidade12_.bairro as bairro465_11_,
	unidade12_.cep as cep465_11_,
	unidade12_.cnpj as cnpj465_11_,
	unidade12_.codigo_unidade as codigo6_465_11_,
	unidade12_.codigo_inep as codigo7_465_11_,
	unidade12_.codigo_rh as codigo8_465_11_,
	unidade12_.complemento as compleme9_465_11_,
	unidade12_.data_cadastro as data10_465_11_,
	unidade12_.distrito as distrito465_11_,
	unidade12_.email as email465_11_,
	unidade12_.endereco as endereco465_11_,
	unidade12_.fax as fax465_11_,
	unidade12_.hierarquia as hierarquia465_11_,
	unidade12_.id_municipio as id16_465_11_,
	unidade12_.instituicao_ensino_superior as institu17_465_11_,
	unidade12_.nome as nome465_11_,
	unidade12_.nome_ascii as nome19_465_11_,
	unidade12_.numero as numero465_11_,
	unidade12_.sigla as sigla465_11_,
	unidade12_.telefone as telefone465_11_,
	unidade12_.tipo as tipo465_11_,
	unidade12_.uf as uf465_11_,
	unidade12_.unidade_orcamentaria as unidade25_465_11_,
	unidade12_.id_responsavel as id26_465_11_,
	situacaofu13_.id_situacao_funcionamento as id1_879_12_,
	situacaofu13_.denominacao as denomina2_879_12_,
	tipounidad14_.id_tipo_unidade_escolar as id1_893_13_,
	tipounidad14_.descricao as descricao893_13_,
	unidade15_.id_unidade as id1_465_14_,
	unidade15_.ativo as ativo465_14_,
	unidade15_.bairro as bairro465_14_,
	unidade15_.cep as cep465_14_,
	unidade15_.cnpj as cnpj465_14_,
	unidade15_.codigo_unidade as codigo6_465_14_,
	unidade15_.codigo_inep as codigo7_465_14_,
	unidade15_.codigo_rh as codigo8_465_14_,
	unidade15_.complemento as compleme9_465_14_,
	unidade15_.data_cadastro as data10_465_14_,
	unidade15_.distrito as distrito465_14_,
	unidade15_.email as email465_14_,
	unidade15_.endereco as endereco465_14_,
	unidade15_.fax as fax465_14_,
	unidade15_.hierarquia as hierarquia465_14_,
	unidade15_.id_municipio as id16_465_14_,
	unidade15_.instituicao_ensino_superior as institu17_465_14_,
	unidade15_.nome as nome465_14_,
	unidade15_.nome_ascii as nome19_465_14_,
	unidade15_.numero as numero465_14_,
	unidade15_.sigla as sigla465_14_,
	unidade15_.telefone as telefone465_14_,
	unidade15_.tipo as tipo465_14_,
	unidade15_.uf as uf465_14_,
	unidade15_.unidade_orcamentaria as unidade25_465_14_,
	unidade15_.id_responsavel as id26_465_14_,
	zonamunici16_.id_zona_municipal as id1_453_15_,
	zonamunici16_.data_atualizacao as data2_453_15_,
	zonamunici16_.data_cadastro as data3_453_15_,
	zonamunici16_.descricao as descricao453_15_,
	zonamunici16_.id_municipio as id7_453_15_,
	zonamunici16_.id_registro_atualizacao as id6_453_15_,
	zonamunici16_.id_registro_cadastro as id5_453_15_,
	municipio17_.id_municipio as id1_434_16_,
	municipio17_.ativo as ativo434_16_,
	municipio17_.codigo as codigo434_16_,
	municipio17_.codigo_acao as codigo4_434_16_,
	municipio17_.nome as nome434_16_,
	municipio17_.id_unidade_federativa as id6_434_16_
from
	escola.escola escola0_
left outer join escola.bairro_escola bairroesco1_ on
	escola0_.id_bairro_escola = bairroesco1_.id_bairro_escola
left outer join comum.municipio municipio2_ on
	bairroesco1_.id_municipio = municipio2_.id_municipio
left outer join comum.unidade_federativa unidadefed3_ on
	municipio2_.id_unidade_federativa = unidadefed3_.id_unidade_federativa
left outer join comum.municipio municipio4_ on
	unidadefed3_.id_capital = municipio4_.id_municipio
left outer join comum.pais pais5_ on
	unidadefed3_.id_pais = pais5_.id_pais
left outer join comum.conta_bancaria contabanca6_ on
	escola0_.id_conta = contabanca6_.id_conta_bancaria
left outer join comum.banco banco7_ on
	contabanca6_.id_banco = banco7_.id_banco
left outer join escola.dependencia_administrativa_escola dependenci8_ on
	escola0_.id_dependencia_administrativa = dependenci8_.id_dependencia_administrativa_escola
left outer join comum.unidade unidade9_ on
	escola0_.id_drae = unidade9_.id_unidade
left outer join escola.localizacao_zona localizaca10_ on
	escola0_.id_localizacao_zona = localizaca10_.id_localizacao_zona
left outer join comum.municipio municipio11_ on
	escola0_.id_municipio = municipio11_.id_municipio
left outer join comum.unidade unidade12_ on
	escola0_.id_regional_ensino = unidade12_.id_unidade
left outer join escola.situacao_funcionamento situacaofu13_ on
	escola0_.id_situacao_funcionamento = situacaofu13_.id_situacao_funcionamento
left outer join escola.tipo_unidade_escolar tipounidad14_ on
	escola0_.id_tipo_unidade_escolar = tipounidad14_.id_tipo_unidade_escolar
inner join comum.unidade unidade15_ on
	escola0_.id_unidade_escola = unidade15_.id_unidade
left outer join comum.zona_municipal zonamunici16_ on
	escola0_.id_zona_municipal = zonamunici16_.id_zona_municipal
left outer join comum.municipio municipio17_ on
	zonamunici16_.id_municipio = municipio17_.id_municipio
where
	escola0_.id_escola =?;

select
	motivointe0_.id_motivo_interrupcao_escola as id1_870_0_,
	motivointe0_.ativo as ativo870_0_,
	motivointe0_.data_cadastro as data3_870_0_,
	motivointe0_.ferias as ferias870_0_,
	motivointe0_.nome as nome870_0_,
	motivointe0_.id_registro_cadastro as id6_870_0_
from
	ensino.motivo_interrupcao_escola motivointe0_
where
	motivointe0_.id_motivo_interrupcao_escola =?;

select
	feriado0_.data_feriado as col_0_0_
from
	comum.feriado feriado0_
left outer join comum.municipio municipio1_ on
	feriado0_.id_municipio = municipio1_.id_municipio
left outer join comum.unidade_federativa unidadefed3_ on
	municipio1_.id_unidade_federativa = unidadefed3_.id_unidade_federativa
left outer join comum.unidade_federativa unidadefed2_ on
	feriado0_.id_unidade_federativa = unidadefed2_.id_unidade_federativa
where
	1 = 1
	and feriado0_.data_feriado >=?
	and feriado0_.data_feriado <=?
	and (feriado0_.id_municipio is null
		or municipio1_.id_municipio =?
		or upper(unidadefed2_.sigla)= upper(trim(?))
			and (municipio1_.id_municipio is null)
				or (feriado0_.id_municipio is null)
					and (feriado0_.id_unidade_federativa is null));

select
	distinct rfs.data_aula
from
	ensino.registro_falta_professor rfs
join ensino.docente_turma dt on
	(dt.id_docente_turma = rfs.id_docente_turma)
where
	dt.ativo is true
	and rfs.ativo is true
	and dt.id_turma in (733295);

