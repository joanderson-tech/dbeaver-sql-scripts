select
	es.id_escola,
	es.nome,
	un.id_unidade as idDired,
	un.nome as nomeDired,
	m.id_municipio,
	m.nome as nomeMunicipio,
	be.id_bairro_escola,
	be.denominacao as bairroDenominacao,
	sf.id_situacao_funcionamento,
	sf.denominacao,
	es.endereco,
	es.numero,
	CONCAT(SUBSTRING(es.cep,
	1,
	5),
	'-',
	SUBSTRING(es.cep,
	6)), 
	es.codigo_inep 
from
	escola.escola es
join comum.unidade unEscola on
	(unEscola.id_unidade = es.id_unidade_escola
		and unEscola.ativo = true)
left join escola.escola_dados_censo edc on
	(edc.id_escola = es.id_escola)
left join escola.caracterizacao_infraestrutura ci on
	(ci.id_escola = es.id_escola)
left join escola.equipamento_escola ec on
	(ec.id_escola = es.id_escola)
left join comum.unidade un on
	(un.id_unidade = es.id_regional_ensino)
left join comum.municipio m on
	(m.id_municipio = es.id_municipio)
left join escola.bairro_escola be on
	(be.id_bairro_escola = es.id_bairro_escola)
left join escola.situacao_funcionamento sf on
	(sf.id_situacao_funcionamento = es.id_situacao_funcionamento)
left join escola.tipo_abastecimento_agua_escola aae on
	(aae.id_escola = es.id_escola)
left join escola.tipo_abastecimento_energia_escola aee on
	(aee.id_escola = es.id_escola)
left join escola.tipo_esgoto_sanitario_escola tese on
	(tese.id_escola = es.id_escola)
left join escola.destinacao_lixo_escola dle on
	(dle.id_escola = es.id_escola)
left join escola.forma_ocupacao_predio fop on
	(fop.id_forma_ocupacao_predio = ci.id_forma_ocupacao)
left join escola.dependencia_escola de on
	(de.id_dependencia = es.id_escola)
left join escola.local_funcionamento_escola lfe on
	(lfe.id_escola = es.id_escola)
left join escola.escola_turno et on
	(et.id_escola = es.id_escola)
left join escola.escola_etapa_ensino_serie e3s on
	(e3s.id_escola = es.id_escola)
left join basico.serie serie on
	(serie.id_serie = e3s.id_serie)
left join basico.etapa_ensino etapaEnsino on
	(etapaEnsino.id_etapa_ensino = serie.id_etapa_ensino)
left join basico.modalidade_ensino_basico modalidade on
	(etapaEnsino.id_modalidade = modalidade.id_modalidade_ensino_basico)
where
	un.ativo = true
	and es.nome ilike '%ESCOLA MUNICIPAL NOSSA SENHORA RAINHA DOS ANJOS -CAIC%'
	and es.id_municipio = 2611101
group by
	es.id_escola,
	es.nome,
	un.id_unidade,
	un.nome,
	m.id_municipio,
	m.nome,
	be.id_bairro_escola,
	be.denominacao,
	sf.id_situacao_funcionamento,
	sf.denominacao,
	es.endereco,
	es.numero
order by
	un.nome,
	m.nome,
	be.denominacao,
	es.nome;
	
select * from escola.escola e 