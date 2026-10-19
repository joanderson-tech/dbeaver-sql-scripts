
select
	config.id,
	config.codigo,
	config.ativo,
	config.periodicidadeRelatorio.id,
	config.periodicidadeRelatorio.descricao,
	config.curriculoBasico.id,
	config.curriculoBasico.anoEntradaVigor,
	config.curriculoBasico.codigo,
	config.curriculoBasico.turno.id,
	config.curriculoBasico.turno.descricao,
	config.curriculoBasico.serie.id,
	config.curriculoBasico.serie.descricao,
	config.curriculoBasico.serie.etapaEnsino.id,
	config.curriculoBasico.serie.etapaEnsino.denominacao
from
	ConfiguracaoRelatorio config
join config.curriculoBasico curr
left join config.curriculoBasico.turno tu
join config.curriculoBasico.serie s
join config.curriculoBasico.serie.etapaEnsino ee
join config.periodicidadeRelatorio per
where
	1 = 1 
	
	
	
	select
	config.id,
	config.codigo,
	config.ativo,
	config.periodicidadeRelatorio.id,
	config.periodicidadeRelatorio.descricao,
	config.curriculoBasico.id,
	config.curriculoBasico.anoEntradaVigor,
	config.curriculoBasico.codigo,
	config.curriculoBasico.turno.id,
	config.curriculoBasico.turno.descricao,
	config.curriculoBasico.serie.id,
	config.curriculoBasico.serie.descricao,
	config.curriculoBasico.serie.etapaEnsino.id,
	config.curriculoBasico.serie.etapaEnsino.denominacao
from
	ConfiguracaoRelatorio config
join config.curriculoBasico curr
left join config.curriculoBasico.turno tu
join config.curriculoBasico.serie s
join config.curriculoBasico.serie.etapaEnsino ee
join config.periodicidadeRelatorio per
where
	1 = 1
	and curr.id = 51876171
	and curr.id = 51876171;