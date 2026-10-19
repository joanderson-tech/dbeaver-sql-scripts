select
	new MatriculaEstudanteSerie( m.id, n.turno,
	discenteMedio.id,
	discenteMedio.discente.matricula,
	discenteMedio.discente.pessoa.id,
	discenteMedio.discente.pessoa.nome,
	discenteMedio.discente.pessoa.nomeMae,
	m.serie.serie.etapaEnsino.nivelEtapa.id,
	m.serie.serie.etapaEnsino.denominacao,
	m.serie.serie.descricao,
	situacaoMatriculaSerie.id,
	situacaoMatriculaSerie.descricao,
	(
	select
		count(*)
	from
		br.com.sigsoftware.sigeduc.basico.matricula.dominio.RenovacaoMatricula rm
	where
		rm.estudante.id = m.discenteMedio.id
		and rm.calendario.id = 71558970
		and rm.registroCancelamento.id is null ),
	(
	select
		count(sol.id)
	from
		br.com.sigsoftware.sigeduc.basico.matricula.dominio.SolicitacaoTransferencia sol
	where
		sol.status.id != 6
		and sol.matricula.discenteMedio.id = m.discenteMedio.id
		and sol.calendario.id = 71558970) ,
	n.descricao )
from
	br.com.sigsoftware.sigeduc.basico.dominio.MatriculaEstudanteSerie m,
	br.ufrn.sigaa.ensino.dominio.Turno n
where
	serie.escola.id = 52232930
	and m.situacaoMatriculaSerie.id <> 5
	and ano = 2024
	and upper(discenteMedio.discente.pessoa.nomeAscii) like upper(:nome)
	and serie.serie.id = 1005223
	and turno.id = 2;
