SELECT * FROM matricula.solicitacao_transferencia st WHERE st.id_solicitacao_transferencia = 59989052 ;


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
WHERE(discente6_.id_discente IN (985972))
--AND matriculae0_.ano_calendario =2025
--AND (matriculae0_.id_situacao_matricula_serie IN (2 , 3 , 1 , 7 , 8 , 10 ,-1))
ORDER BY matriculae0_.id_matricula_discente_serie DESC
