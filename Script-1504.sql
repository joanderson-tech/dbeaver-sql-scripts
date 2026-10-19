SELECT mes.ano_calendario AS ano, escola.id_escola, escola.nome, discente.matricula matricula, pessoa.id_pessoa idPessoa, pessoa.nome nomeEstudante, estapaEnsino.denominacao serieDenominacao,(serie.descricao || COALESCE(' (' || sm.descricao || ')', '')) serieDescricao, estudante.id_estudante idEstudante,(SELECT COUNT(mat.id_matricula_discente_serie)
FROM matricula.solicitacao_transferencia sol
INNER JOIN basico.matricula_estudante_serie mat ON
mat.id_matricula_discente_serie = sol.id_matricula_discente_serie) AS countSol, CASE WHEN (SELECT COUNT(mat.id_matricula_discente_serie)
FROM matricula.solicitacao_transferencia sol
INNER JOIN basico.matricula_estudante_serie mat ON
mat.id_matricula_discente_serie = sol.id_matricula_discente_serie
AND mes.id_matricula_discente_serie = sol.id_matricula_discente_serie
WHERE sol.id_status != 6
AND sol.ano_escolar = 2026 ) > 0 THEN TRUE
ELSE FALSE END AS isSolicitado, sol.id_solicitacao_transferencia AS idsolicitacao, sol.numero AS numero,(mes.id_situacao_matricula_serie IN ( 2, 3, 7, 8,-1 ) ) AS consolidado,(estapaEnsino.id_modalidade = 2
	AND estapaEnsino.periodicidade_etapa = 'SEMESTRAL') AS isEjaSemestral, mes.periodo
FROM basico.matricula_estudante_serie mes
INNER JOIN basico.estudante estudante ON
estudante.id_estudante = mes.id_estudante
INNER JOIN public.discente discente ON
discente.id_discente = estudante.id_estudante
INNER JOIN comum.pessoa pessoa ON
pessoa.id_pessoa = discente.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN escola.escola escola ON
escola.id_escola = eees.id_escola
INNER JOIN basico.serie serie ON
serie.id_serie = eees.id_serie
INNER JOIN basico.etapa_ensino estapaEnsino ON
estapaEnsino.id_etapa_ensino = serie.id_etapa_ensino
LEFT JOIN matricula.solicitacao_transferencia sol ON
mes.id_matricula_discente_serie = sol.id_matricula_discente_serie
AND sol.id_status <> 6
LEFT JOIN basico.serie sm ON
sm.id_serie = mes.id_serie_multisseriado
WHERE mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
--AND escola.id_escola = 0

;

SELECT vaga.id_vaga_serie, vaga.numero_vagas, vaga.ano_letivo, vaga.data_cadastro, vaga.data_validacao, vaga.vagas_validadas, vaga.vagas_ocupadas, vaga.id_escola, vaga.id_serie, vaga.id_turno, vaga.numero_turmas, vaga.aceita_novas_matriculas_nee
FROM matricula.vaga_serie AS vaga
INNER JOIN escola.escola AS escola ON escola.id_escola = vaga.id_escola
INNER JOIN basico.serie AS serie ON serie.id_serie = vaga.id_serie
INNER JOIN ensino.turno AS turno ON turno.id_turno = vaga.id_turno
INNER JOIN matricula.calendario_matricula AS cm ON cm.id_calendario_matricula = vaga.id_calendario_matricula
WHERE escola.id_escola = 973
AND serie.id_serie = 51900268
AND turno.id_turno = 2
--AND vaga.vagas_validadas > 0
AND vaga.ano_letivo = 2026
AND vaga.removida = falseValue();