SELECT solicitaca0_.id_solicitacao_transferencia_opcao_escola AS col_0_0_, solicitaca0_.id_solicitacao AS col_1_0_, solicitaca1_.numero AS col_2_0_, pessoa12_.nome AS col_3_0_, escola7_.nome AS col_4_0_, solicitaca0_.ordem AS col_5_0_, escola15_.nome AS col_6_0_, tiposolici14_.denominacao AS col_7_0_, municipio16_.nome AS col_8_0_, unidade18_.nome AS col_9_0_, statussoli20_.denominacao AS col_10_0_, solicitaca1_.visto_escola AS col_11_0_
FROM matricula.solicitacao_transferencia_opcao_escola solicitaca0_
INNER JOIN matricula.solicitacao_transferencia solicitaca1_ ON
solicitaca0_.id_solicitacao = solicitaca1_.id_solicitacao_transferencia
INNER JOIN basico.matricula_estudante_serie matriculae3_ ON
solicitaca1_.id_matricula_discente_serie = matriculae3_.id_matricula_discente_serie
LEFT OUTER JOIN escola.escola_etapa_ensino_serie escolaetap6_ ON
matriculae3_.id_serie_escola = escolaetap6_.id_escola_etapa_ensino_serie
LEFT OUTER JOIN escola.escola escola7_ ON
escolaetap6_.id_escola = escola7_.id_escola
INNER JOIN basico.estudante estudante10_ ON
matriculae3_.id_estudante = estudante10_.id_estudante
INNER JOIN discente discente11_ ON
estudante10_.id_estudante = discente11_.id_discente
INNER JOIN comum.pessoa pessoa12_ ON
discente11_.id_pessoa = pessoa12_.id_pessoa
INNER JOIN matricula.tipo_solicitacao_transferencia tiposolici14_ ON
solicitaca1_.id_tipo = tiposolici14_.id_tipo_solicitacao_transferencia
INNER JOIN matricula.status_solicitacao_transferencia statussoli20_ ON
solicitaca1_.id_status = statussoli20_.id_status_solicitacao_transferencia
INNER JOIN escola.escola escola15_ ON
solicitaca0_.id_escola = escola15_.id_escola
INNER JOIN comum.municipio municipio16_ ON
escola15_.id_municipio = municipio16_.id_municipio
INNER JOIN comum.unidade unidade18_ ON
escola15_.id_regional_ensino = unidade18_.id_unidade
WHERE 1 = 1
AND solicitaca1_.ano_escolar = 2026
AND (upper(pessoa12_.nome) LIKE upper('MARIA CECILIA CLARES DA SILVA'))
AND (upper(escola7_.nome) LIKE upper('%ESCOLA MUNICIPAL JOSE BENJAMIM%'))
ORDER BY solicitaca1_.numero DESC, solicitaca0_.ordem;

se