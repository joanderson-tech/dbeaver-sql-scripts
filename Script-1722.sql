SELECT *
FROM matricula.solicitacao_transferencia
WHERE numero = '2026059893';

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
AND escola.id_escola = 52232847
AND ((mes.ano_calendario = 2025
	AND mes.periodo = (CASE WHEN estapaEnsino.periodicidade_etapa = 'SEMESTRAL' THEN 2
	ELSE 1 END))
	OR (mes.ano_calendario = 2025
		AND estapaEnsino.id_modalidade = 2
		AND estapaEnsino.periodicidade_etapa = 'SEMESTRAL'
		AND mes.periodo = 1))
AND upper(pessoa.nome_ascii) LIKE '%%'
ORDER BY estapaEnsino.denominacao, serie.descricao, pessoa.nome
LIMIT 50 OFFSET 0;

SELECT solicitaca0_.id_solicitacao_transferencia AS id1_941_, solicitaca0_.ano_escolar AS ano2_941_, solicitaca0_.id_calendario_matricula AS id12_941_, solicitaca0_.data_solicitacao AS data3_941_, solicitaca0_.data_analise AS data4_941_, solicitaca0_.id_matricula_discente_serie AS id13_941_, solicitaca0_.id_matricula_discente_serie_gerado AS id8_941_, solicitaca0_.id_motivo_transferencia_int_proprio AS id14_941_, solicitaca0_.numero AS numero941_, solicitaca0_.observacoes_analise AS observac6_941_, solicitaca0_.id_registro_analise AS id9_941_, solicitaca0_.id_registro_cadastro AS id11_941_, solicitaca0_.id_status AS id10_941_, solicitaca0_.id_tipo AS id15_941_, solicitaca0_.visto_escola AS visto7_941_
FROM matricula.solicitacao_transferencia solicitaca0_, basico.matricula_estudante_serie matriculae1_
WHERE solicitaca0_.id_matricula_discente_serie = matriculae1_.id_matricula_discente_serie
AND 1 = 1
AND matriculae1_.id_estudante = '1371708'
AND solicitaca0_.ano_escolar = '2027'

SELECT matriculae0_
FROM basico.matricula_estudante_serie matriculae0_
INNER JOIN escola.escola_etapa_ensino_serie escolaetap1_ ON
matriculae0_.id_serie_escola = escolaetap1_.id_escola_etapa_ensino_serie
INNER JOIN basico.serie serie3_ ON
escolaetap1_.id_serie = serie3_.id_serie
LEFT OUTER JOIN basico.turma_serie turmaserie4_ ON
matriculae0_.id_turma_serie = turmaserie4_.id_turma_serie
INNER JOIN basico.estudante estudante5_ ON
matriculae0_.id_estudante = estudante5_.id_estudante
INNER JOIN discente discente6_ ON
estudante5_.id_estudante = discente6_.id_discente
INNER JOIN comum.pessoa pessoa7_ ON
discente6_.id_pessoa = pessoa7_.id_pessoa
WHERE(discente6_.id_discente IN (1355551))
AND matriculae0_.ano_calendario =2026
AND (matriculae0_.id_situacao_matricula_serie IN (2 , 3 , 1 , 7 , 8 , 10 ,-1))
ORDER BY matriculae0_.id_matricula_discente_serie DESC;

SELECT * FROM discente d WHERE d.matricula = '202352768287';


SELECT * FROM basico.matricula_estudante_serie mes WHERE mes.id_estudante = 1349479 AND mes.ano_calendario = 2026;