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


 SELECT mes
FROM MatriculaEstudanteSerie mes
JOIN FETCH mes.serie s
JOIN FETCH mes.serie.serie ss
LEFT JOIN mes.turmaSerie
JOIN mes.discenteMedio est
JOIN est.discente d
JOIN d.pessoa p
WHERE d.id IN (985972)
AND mes.situacaoMatriculaSerie.id IN ( 2, 3, 1, 7, 8, 10,-1 )
ORDER BY mes.id DESC

SELECT * FROM matricula.solicitacao_transferencia st WHERE st.id_matricula_discente_serie= 1541421 ;

SELECT * FROM basico.calendario_escolar ce ;

SELECT * FROM matricula.vaga_serie_movimentacao vsm WHERE vsm.id_solicitacao_transferencia = 59989058;

SELECT * FROM matricula.solicitacao_transferencia_opcao_escola stoe WHERE  stoe.id_solicitacao    = 59989058;

SELECT * FROM matricula.solicitacao_transferencia_processamento stp WHERE stp.id_solicitacao_transferencia  = 59989058;

BEGIN;

ROLLBACK;


DELETE FROM matricula.vaga_serie_movimentacao
WHERE id_vaga_serie_movimentacao=2260987;
DELETE FROM matricula.vaga_serie_movimentacao
WHERE id_vaga_serie_movimentacao=2260988;

DELETE FROM matricula.solicitacao_transferencia_processamento
WHERE id_solicitacao_transferencia_processamento=59989060;

DELETE FROM matricula.solicitacao_transferencia_opcao_escola
WHERE id_solicitacao_transferencia_opcao_escola=59989059;

DELETE FROM matricula.solicitacao_transferencia
WHERE id_solicitacao_transferencia=59989058;

COMMIT;




