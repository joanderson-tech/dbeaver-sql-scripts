

select
	*
from
	basico.matricula_estudante_serie
where
	id_turma_serie = 52108428
	and id_situacao_matricula_serie not in ( 5, 12 );
	
 select
	ts.id,
	ts.nome,
	ts.tipoDiario,
	ts.periodo,
	ts.dataCadastro,
	case
		when ts.capacidadeAluno <> null then ts.capacidadeAluno
		when s.capacidadeMaximaEstudantes <> null then (s.capacidadeMaximaEstudantes + s.capacidadeExcesso)
		else (ee.capacidadeMaximaEstudantes + ee.capacidadeExcesso)
	end as capacidadeAluno,
	ts.ano,
	ts.regraNao,
	ts.tipoTurmaSerie.id,
	ts.tipoTurmaSerie.descricao,
	ts.turno.id,
	ts.turno,
	ts.turmaSerieAgrupadora.id,
	ts.turmaSerieAgrupadora.nome,
	ts.curriculo,
	ts.serie.id,
	ts.serie.descricao,
	ts.serie.tipoDiario,
	ts.serie.multisseriada,
	ts.serie.etapaEnsino.id,
	ts.serie.etapaEnsino.denominacao,
	ts.serie.etapaEnsino.modalidade.id ,
	ts.serie.etapaEnsino.modalidade.denominacao,
	ts.serie.etapaEnsino.nivelEtapa.id,
	ts.serie.etapaEnsino.nivelEtapa.denominacao,
	ts.serie.etapaEnsino.periodicidadeEtapa,
	ts.serie.etapaEnsino.formaOrganizacao,
	ts.serie.etapaEnsino.capacidadeMaximaEstudantes,
	ts.serie.etapaEnsino.capacidadeMinimaEstudantes,
	ts.serie.etapaEnsino.capacidadeExcesso,
	ts.serie.capacidadeMaximaEstudantes,
	ts.serie.capacidadeMinimaEstudantes,
	ts.serie.capacidadeExcesso,
	ts.regraNao,
	ts.escola.id,
	ts.escola.nome,
	ts.escola.municipio.id,
	ts.escola.municipio.nome,
	ts.escola.regionalEnsino.id,
	ts.escola.regionalEnsino.nome
from
	basico.turma_serie ts
left join ts.tipoTurmaSerie tts
left join ts.curriculo c
join ts.escola e
join ts.escola.municipio m
join ts.escola.regionalEnsino re
join ts.serie s
join ts.serie.etapaEnsino ee
join ts.serie.etapaEnsino.modalidade modalidade
join ts.serie.etapaEnsino.nivelEtapa nivelEtapa
left join ts.turmaSerieAgrupadora tsa
where
	ts.id = 52108428;