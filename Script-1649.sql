SELECT count(sol)
FROM SolicitacaoDispensaEstudante sol
INNER JOIN sol.matriculaEstudanteSerie matricula
INNER JOIN matricula.discenteMedio estudante
INNER JOIN estudante.discente discente
INNER JOIN discente.pessoa pessoa
INNER JOIN matricula.serie serieEscola
INNER JOIN serieEscola.escola escola
WHERE sol.ativo = TRUE
AND sol.statusSolicitacaoDispensaEstudante.id IN ( 1, 2, 3 )
AND YEAR(sol.dataCadastro) = 2026
AND escola.id = 52232926
AND pessoa.nomeAscii LIKE :nome;

;

SELECT count(solicitaca0_.id_solicitacao_dispensa_estudante) AS col_0_0_
FROM ensino.solicitacao_dispensa_estudante solicitaca0_
INNER JOIN basico.matricula_estudante_serie matriculae1_ ON
solicitaca0_.id_matricula_estudante_serie = matriculae1_.id_matricula_discente_serie
INNER JOIN basico.estudante estudante2_ ON
matriculae1_.id_estudante = estudante2_.id_estudante
INNER JOIN discente discente3_ ON
estudante2_.id_estudante = discente3_.id_discente
INNER JOIN comum.pessoa pessoa4_ ON
discente3_.id_pessoa = pessoa4_.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie escolaetap5_ ON
matriculae1_.id_serie_escola = escolaetap5_.id_escola_etapa_ensino_serie
INNER JOIN escola.escola escola6_ ON
escolaetap5_.id_escola = escola6_.id_escola
WHERE solicitaca0_.ativo = TRUE
AND (solicitaca0_.id_status_solicitacao_dispensa_estudante IN (1 , 2 , 3))
AND EXTRACT(YEAR FROM solicitaca0_.data_cadastro)= 2026
AND escola6_.id_escola = 52232926
AND (pessoa4_.nome_ascii LIKE '%ANA%');

SELECT solicitaca0_.id_solicitacao_dispensa_estudante , solicitaca0_.data_cadastro , solicitaca0_.codigo , solicitaca0_.id_arquivo_dispensa, solicitaca0_.id_status_solicitacao_dispensa_estudante , statussoli7_.descricao , solicitaca0_.id_matricula_estudante_serie , matriculae1_.id_estudante , estudante10_.id_estudante, discente13_.matricula , discente13_.id_pessoa , pessoa20_.nome, pessoa20_.cpf_cnpj , matriculae1_.id_serie_escola , escolaetap27_.id_escola , escola30_.nome
FROM ensino.solicitacao_dispensa_estudante solicitaca0_
INNER JOIN basico.matricula_estudante_serie matriculae1_ ON
solicitaca0_.id_matricula_estudante_serie = matriculae1_.id_matricula_discente_serie
INNER JOIN basico.estudante estudante2_ ON
matriculae1_.id_estudante = estudante2_.id_estudante
INNER JOIN discente discente3_ ON
estudante2_.id_estudante = discente3_.id_discente
INNER JOIN comum.pessoa pessoa4_ ON
discente3_.id_pessoa = pessoa4_.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie escolaetap5_ ON
matriculae1_.id_serie_escola = escolaetap5_.id_escola_etapa_ensino_serie
INNER JOIN escola.escola escola6_ ON
escolaetap5_.id_escola = escola6_.id_escola, basico.estudante estudante10_, discente discente13_, comum.pessoa pessoa20_, escola.escola_etapa_ensino_serie escolaetap27_, escola.escola escola30_, ensino.status_solicitacao_dispensa_estudante statussoli7_
WHERE matriculae1_.id_estudante = estudante10_.id_estudante
AND estudante10_.id_estudante = discente13_.id_discente
AND discente13_.id_pessoa = pessoa20_.id_pessoa
AND matriculae1_.id_serie_escola = escolaetap27_.id_escola_etapa_ensino_serie
AND escolaetap27_.id_escola = escola30_.id_escola
AND solicitaca0_.id_status_solicitacao_dispensa_estudante = statussoli7_.id_status_solicitacao_dispensa_estudante
AND solicitaca0_.ativo = TRUE
AND (solicitaca0_.id_status_solicitacao_dispensa_estudante IN (1 , 2 , 3))
--AND EXTRACT(YEAR FROM solicitaca0_.data_cadastro)= 2026
AND SUBSTRING(solicitaca0_.codigo FROM 1 FOR 4) = '2025'
AND escola6_.id_escola = 52232926
AND (pessoa4_.nome_ascii LIKE '%ANA%')

SELECT solicitaca0_.id_solicitacao_dispensa_estudante AS col_0_0_, solicitaca0_.data_cadastro AS col_1_0_, solicitaca0_.codigo AS col_2_0_, solicitaca0_.id_arquivo_dispensa AS col_3_0_, solicitaca0_.id_status_solicitacao_dispensa_estudante AS col_4_0_, statussoli7_.descricao AS col_5_0_, solicitaca0_.id_matricula_estudante_serie AS col_6_0_, matriculae1_.id_estudante AS col_7_0_, estudante10_.id_estudante AS col_8_0_, discente13_.matricula AS col_9_0_, discente13_.id_pessoa AS col_10_0_, pessoa20_.nome AS col_11_0_, pessoa20_.cpf_cnpj AS col_12_0_, matriculae1_.id_serie_escola AS col_13_0_, escolaetap27_.id_escola AS col_14_0_, escola30_.nome AS col_15_0_
FROM ensino.solicitacao_dispensa_estudante solicitaca0_
INNER JOIN basico.matricula_estudante_serie matriculae1_ ON
solicitaca0_.id_matricula_estudante_serie = matriculae1_.id_matricula_discente_serie
INNER JOIN basico.estudante estudante2_ ON
matriculae1_.id_estudante = estudante2_.id_estudante
INNER JOIN discente discente3_ ON
estudante2_.id_estudante = discente3_.id_discente
INNER JOIN comum.pessoa pessoa4_ ON
discente3_.id_pessoa = pessoa4_.id_pessoa
INNER JOIN escola.escola_etapa_ensino_serie escolaetap5_ ON
matriculae1_.id_serie_escola = escolaetap5_.id_escola_etapa_ensino_serie
INNER JOIN escola.escola escola6_ ON
escolaetap5_.id_escola = escola6_.id_escola, basico.estudante estudante10_, discente discente13_, comum.pessoa pessoa20_, escola.escola_etapa_ensino_serie escolaetap27_, escola.escola escola30_, ensino.status_solicitacao_dispensa_estudante statussoli7_
WHERE matriculae1_.id_estudante = estudante10_.id_estudante
AND estudante10_.id_estudante = discente13_.id_discente
AND discente13_.id_pessoa = pessoa20_.id_pessoa
AND matriculae1_.id_serie_escola = escolaetap27_.id_escola_etapa_ensino_serie
AND escolaetap27_.id_escola = escola30_.id_escola
AND solicitaca0_.id_status_solicitacao_dispensa_estudante = statussoli7_.id_status_solicitacao_dispensa_estudante
AND solicitaca0_.ativo = TRUE
AND (solicitaca0_.id_status_solicitacao_dispensa_estudante IN (1 , 2 , 3))
AND CAST(substring(solicitaca0_.codigo, 1, 4) AS int4)= 2025
AND escola6_.id_escola =52232926;
--AND (pessoa4_.nome_ascii LIKE )
--LIMIT ?