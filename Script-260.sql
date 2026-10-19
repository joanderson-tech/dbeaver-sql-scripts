select
	escola.id,
	escola.nome,
	escola.municipio.id,
	escola.municipio.nome,
	escola.codigoINEP,
	escola.endereco,
	escola.numero,
	escola.cep,
	escola.bairro.denominacao,
	escola.municipio.unidadeFederativa.sigla,
	escola.geocode,
	escola.localizacaoZona.denominacao,
	escola.regionalEnsino.id
from
	Escola escola
inner join escola.unidadeEscola unid
inner join escola.municipio municipio
left join escola.bairro
left join escola.municipio.unidadeFederativa
left join escola.localizacaoZona
where
	1 = 1
	and lower(unid.nome) like lower(:nome)
	and municipio.id = 2611101
	and escola.dependenciaAdm.id = 3
order by
	escola.nome ;
	
select * from escola.escola e where id_municipio = 2611101;
SELECT x.* FROM escola.situacao_funcionamento x;