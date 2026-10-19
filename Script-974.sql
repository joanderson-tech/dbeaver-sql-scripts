select * from  COMUM.unidade u  where ativo 

select * from escola.escola e; 

SELECT * FROM comum.municipio;
escola.escola e


Dired

Numero


select distinct 
e.nome as "ESCOLA",
u.nome_ascii as "DIRED",
e.id_tipo_unidade_escolar,
m.nome_ascii as "MUNICIPIO",
lz.denominacao as "ZONA",
ba.denominacao_ascii as "BAIRRO",
e.endereco as "ENDEREÇO",
e.numero as "NUMERO",
sf.denominacao as "SITUACAO",
e.cep  as "CEP",
e.codigo_inep as "CODIGO INEP"
from  escola.escola e 
join basico.turma_serie ts  on ts.id_escola= e.id_escola
join comum.municipio m on m.id_municipio = 2611101 --Petrolina
join comum.unidade u on u.id_unidade = e.id_unidade_escola
join escola.bairro_escola ba on ba.id_bairro_escola = e.id_bairro_escola
left join escola.situacao_funcionamento sf on sf.id_situacao_funcionamento = e.id_situacao_funcionamento
left join escola.localizacao_zona lz on lz.id_localizacao_zona = e.id_localizacao_zona 
order by e.nome;