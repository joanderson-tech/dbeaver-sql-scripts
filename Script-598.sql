 select
 string_agg(u.id_unidade::varchar, ', ') 
from
	comum.unidade u
join escola.escola e on
	e.id_unidade_escola = u.id_unidade
	and e.id_situacao_funcionamento = 1
	and e.id_dependencia_administrativa = 3
left join comum.municipio m on
	m.id_municipio = e.id_municipio
where
	u.ativo = true
	and u.instituicao_ensino_superior = false
	and translate(UPPER(u.nome), 'ÁÀÂÃÄáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÔÕÖóòôõöÚÙÛÜúùûüÇç', 'AAAAAAAAAAEEEEEEEEIIIIIIIIOOOOOOOOOOUUUUUUUUCC') like '%%%%%'


 
 select
	unidade0_.id_unidade as id1_579_0_,
	unidade0_.ativo as ativo579_0_,
	unidade0_.bairro as bairro579_0_,
	unidade0_.cep as cep579_0_,
	unidade0_.cnpj as cnpj579_0_,
	unidade0_.codigo_unidade as codigo6_579_0_,
	unidade0_.codigo_inep as codigo7_579_0_,
	unidade0_.codigo_rh as codigo8_579_0_,
	unidade0_.complemento as compleme9_579_0_,
	unidade0_.data_cadastro as data10_579_0_,
	unidade0_.distrito as distrito579_0_,
	unidade0_.email as email579_0_,
	unidade0_.endereco as endereco579_0_,
	unidade0_.fax as fax579_0_,
	unidade0_.hierarquia as hierarquia579_0_,
	unidade0_.id_municipio as id16_579_0_,
	unidade0_.instituicao_ensino_superior as institu17_579_0_,
	unidade0_.nome as nome579_0_,
	unidade0_.nome_ascii as nome19_579_0_,
	unidade0_.numero as numero579_0_,
	unidade0_.sigla as sigla579_0_,
	unidade0_.telefone as telefone579_0_,
	unidade0_.tipo as tipo579_0_,
	unidade0_.uf as uf579_0_,
	unidade0_.unidade_orcamentaria as unidade25_579_0_,
	unidade0_.id_responsavel as id26_579_0_
from
	comum.unidade unidade0_
where
	unidade0_.id_unidade =4261;
 
 
 
 select
	e.nome ,
	e.id_escola ,
	e.geocode ,
	e.codigo_inep ,
	e.cnpj ,
	e.telefone ,
	e.endereco,
	e.numero ,
	e.cep ,
	e.instituicao_ensino_superior ,
	e.id_regional_ensino a,
	u.nome ,
	e.id_unidade_escola,
	cu.nome ,
	e.id_situacao_funcionamento,
	sf.denominacao _,
	e.id_dependencia_administrativa a,
	ae.denominacao ,
	e.id_municipio ,
	e.habilita_ambientes 
from
	escola.escola e
inner join comum.unidade u on e.id_regional_ensino = u.id_unidade
inner join comum.unidade cu on
	e.id_unidade_escola = cu.id_unidade
inner join escola.situacao_funcionamento sf on
	e.id_situacao_funcionamento = sf.id_situacao_funcionamento
inner join escola.dependencia_administrativa_escola ae on
	e.id_dependencia_administrativa = ae.id_dependencia_administrativa_escola
left outer join comum.municipio m on
	e.id_municipio = m.id_municipio
where
	e.id_unidade_escola =4261;

 
select	id_regional_ensino , * from	escola.escola e --inner join comum.unidade u on e.id_regional_ensino = u.id_unidade
where e.id_unidade_escola in (4260, 4265, 4266, 4267, 4264, 4263, 4262, 4261)
and id_regional_ensino diferente 1;


SELECT  string_agg(id_escola::varchar, ', ') 
FROM escola.escola e
-- INNER JOIN comum.unidade u ON e.id_regional_ensino = u.id_unidade
WHERE e.id_unidade_escola IN (4260, 4265, 4266, 4267, 4264, 4263, 4262, 4261)
  AND e.id_regional_ensino is null;

select * from comum.unidade u;






-- Auto-generated SQL script #202505271024
UPDATE escola.escola SET id_regional_ensino=1 WHERE id_escola in (3262, 3267, 3268, 3269, 3263);




-- Auto-generated SQL script #202505271024
UPDATE escola.escola SET id_regional_ensino=null WHERE id_escola in (3262, 3267, 3268, 3269, 3263);




