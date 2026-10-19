 select
	va.id_vaga_administrativa,
	s.id_servidor,
	s.siape,
	s.digito_siape,
	u.id_unidade,
	u.nome as unidade,
	uResponsavel.nome as responsavel,
	m.nome as municipio,
	t.id_turno,
	t.descricao as turno,
	aa.id_area_administrativa,
	aa.descricao as area,
	a.id_atividade,
	a.descricao as atividade,
	va.dt_inicio,
	va.ch_semanal
from
	pessoas.vaga_administrativa va
join rh.servidor s on
	s.id_servidor = va.id_servidor
join comum.unidade u on
	u.id_unidade = va.id_unidade
left join comum.unidade uResponsavel on
	uResponsavel.id_unidade = u.id_responsavel
join ensino.turno t on
	t.id_turno = va.id_turno
join pessoas.area_administrativa aa on
	aa.id_area_administrativa = va.id_area_administrativa
join rh.atividade a on
	a.id_atividade = va.id_atividade
left join comum.municipio m on
	m.id_municipio = u.id_municipio
where
	va.ativo is true
	and s.id_servidor = 11733
order by
	s.siape,
	va.dt_inicio desc;
	
	select * from comum.pessoa p where p.nome ilike '%MARILEIA DA SILVA RIBEIRO DIAS%'
	
	select * from  rh.servidor s where s.id_pessoa = 776202;
	
	
52325008
11733