SELECT mes
FROM basico.matricula_estudante_serie mes
LEFT OUTER JOIN basico.turma_serie turmaserie1_ ON
mes.id_turma_serie = turmaserie1_.id_turma_serie, basico.estudante estudante2_, discente discente3_, comum.pessoa pessoa4_, escola.escola_etapa_ensino_serie escolaetap7_, basico.serie serie9_, basico.etapa_ensino etapaensin12_
INNER JOIN basico.forma_organizacao_etapa formaorgan29_ ON
etapaensin12_.id_forma_organizacao_Etapa = formaorgan29_.id_forma_organizacao_etapa, escola.escola escola15_, ensino.turno turno17_, basico.situacao_matricula_serie situacaoma35_
WHERE mes.id_estudante = estudante2_.id_estudante
AND estudante2_.id_estudante = discente3_.id_discente
AND discente3_.id_pessoa = pessoa4_.id_pessoa
AND mes.id_serie_escola = escolaetap7_.id_escola_etapa_ensino_serie
AND escolaetap7_.id_serie = serie9_.id_serie
AND serie9_.id_etapa_ensino = etapaensin12_.id_etapa_ensino
AND escolaetap7_.id_escola = escola15_.id_escola
AND mes.id_turno = turno17_.id_turno
AND mes.id_situacao_matricula_serie = situacaoma35_.id_situacao_matricula_serie
AND mes.id_estudante = 976633
AND mes.ano_calendario = 2026
AND turmaserie1_.id_escola = 51877785
AND (mes.id_situacao_matricula_serie IN (2 , 3 , 1 , 7 , 8 , 10 ,-1 , 6))
ORDER BY mes.id_matricula_discente_serie DESC;

SELECT fa.*
FROM ensino.frequencia_aluno fa, ensino.turma t, ensino.componente_curricular componente3_, discente d, comum.pessoa p
WHERE fa.id_turma = t.id_turma
AND t.id_disciplina = componente3_.id_componente_curricular
AND fa.id_discente = d.id_discente
AND d.id_pessoa = p.id_pessoa
AND fa.id_discente =976633
AND t.ano =2026
AND fa.ativo = TRUE
ORDER BY componente3_.nome ASC, fa.data ASC, fa.frequencia DESC
