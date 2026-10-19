
select
	atv.descricao as "funcao",
	count(distinct vaga.id_vaga_administrativa) as "necessidade"
from
	pessoas.vaga_administrativa vaga
join rh.atividade atv using (id_atividade)
join ensino.turno t using (id_turno)
join escola.escola e on e.id_unidade_escola = vaga.id_unidade 
join comum.unidade direc on direc.id_unidade = vaga.id_unidade
join comum.municipio m on m.id_municipio = e.id_municipio 
join pessoas.area_administrativa aa on
	aa.id_area_administrativa = vaga.id_area_administrativa
where
	vaga.ativo
	and vaga.id_servidor is null
	and e.id_unidade_escola  in (5862)
	group by atv.descricao
order by
	atv.descricao; 


select
	atv.descricao as "funcao",
	count(distinct vaga.id_vaga_administrativa) as "necessidade"
from
	pessoas.vaga_administrativa vaga
join rh.atividade atv
		using (id_atividade)
join ensino.turno t
		using (id_turno)
join comum.unidade direc on
	direc.id_unidade = vaga.id_unidade
join comum.municipio m on
	m.id_municipio = direc.id_municipio
join pessoas.area_administrativa aa on
	aa.id_area_administrativa = vaga.id_area_administrativa
where
	vaga.ativo
	and vaga.id_servidor is null
	and direc.id_unidade in (5862)
	group by atv.descricao
order by
	atv.descricao; 



select * from pessoas.vaga_administrativa vaga;
	
select * from pessoas.area_administrativa aa ;
select * from comum.unidade u where id_unidade = 5862;
select * from comum.municipio m;

select * from escola.escola e where id_unidade_escola ;

select
	atv.descricao as "funcao",
	count(distinct vaga.id_vaga_administrativa) as "necessidade"
from
	pessoas.vaga_administrativa vaga
join rh.atividade atv
		using (id_atividade)
join ensino.turno t
		using (id_turno)
join escola.escola e on
	e.id_unidade_escola = vaga.id_unidade
join comum.unidade direc on
	direc.id_unidade = vaga.id_unidade
join comum.municipio m on
	m.id_municipio = e.id_municipio
join pessoas.area_administrativa aa on
	aa.id_area_administrativa = vaga.id_area_administrativa
where
	vaga.ativo
	and vaga.id_servidor is null
	and e.id_unidade_escola in (5862)
	group by atv.descricao
order by
	atv.descricao; 
