			
select es.denominacao, COUNT(distinct mes.id_estudante) as total_estudantes
from basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
join basico.serie s on eees.id_serie =  s.id_serie
join basico.etapa_ensino es on es.id_etapa_ensino = s.id_etapa_ensino
where mes.ano_calendario = 2024
	and mes.id_situacao_matricula_serie not in ( 4,6,5,9,12 )
	and ( (mes.periodo = 1 and es.periodicidade_etapa = 'SEMESTRAL')
	or es.periodicidade_etapa = 'ANUAL' )group by es.denominacao order by total_estudantes desc;

 select
	mes.ano_calendario,
	s.descricao as serie,
	count(distinct mes.*) as qtd,
	sum(count(distinct mes.*)) over () as total_qtd
from basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join basico.serie s on eees.id_serie =  s.id_serie
where mes.id_situacao_matricula_serie not in ( 4,6,5,9,12 )
	and mes.ano_calendario = 2024
	and s.id_etapa_ensino = 3
group by mes.ano_calendario, s.descricao
order by mes.ano_calendario, s.descricao; 

select
	mes.ano_calendario,
	s.descricao as serie,
	count(mes.id_estudante) as qtd,
	sum(count(distinct mes.*)) over () as total_qtd
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
join basico.serie s on
	s.id_serie = eees.id_serie
	join basico.etapa_ensino es on es.id_etapa_ensino = s.id_etapa_ensino
where
	mes.id_situacao_matricula_serie not in ( 4, 6, 5, 9, 12 )
	and mes.ano_calendario = 2024
group by
	mes.ano_calendario,
	s.descricao
order by
	mes.ano_calendario,
	s.descricao; 


[{denominacao = ANOS INICIAIS,
total_estudantes = 25903 },
{denominacao = PRÉ-ESCOLA ,
total_estudantes = 10147 },
{denominacao = ANOS FINAIS,
total_estudantes = 9880 },
{denominacao = CRECHE,
total_estudantes = 9755 },
{denominacao = MULTI INFANTIL,
total_estudantes = 627 },
{denominacao = ANOS FINAIS (EJA),
total_estudantes = 447 },
{denominacao = MULTI,
total_estudantes = 282 },
{denominacao = MULTI (EJA),
total_estudantes = 213 },
{denominacao = ANOS FINAIS ESPECIAL (EJA),
total_estudantes = 150 },
{denominacao = ANOS INICIAIS ESPECIAL,
total_estudantes = 46 },
{denominacao = MULTIETAPA,
total_estudantes = 35 },
{denominacao = ANOS INICIAIS (EJA),
total_estudantes = 25 },
{denominacao = PRÉ-ESCOLA - 4 E 5 ANOS ESPECIAL,
total_estudantes = 4 }]