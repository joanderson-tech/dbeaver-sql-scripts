SELECT t
FROM ensino.turma t
INNER JOIN ensino.situacao_turma st ON
t.id_situacao_turma = st.id_situacao_turma
INNER JOIN ensino.componente_curricular cc ON
t.id_disciplina = cc.id_componente_curricular
LEFT OUTER JOIN basico.modulo modulo3_ ON
t.id_modulo = modulo3_.id_modulo
WHERE st.id_situacao_turma <> 4
AND t.id_turma_serie = 97008002
AND t.ano = 2026
ORDER BY t.periodo, modulo3_.denominacao, cc.nome;

SELECT mc.*
FROM ensino.matricula_componente mc, ensino.turma t
WHERE mc.id_turma = t.id_turma
AND mc.id_discente = 1442248
AND t.id_turma_serie = 95789031;

SELECT *
FROM ensino.turma
WHERE id_turma_serie = 95789031;

SELECT curriculoc3_
FROM basico.curriculo_basico curriculob0_
INNER JOIN basico.serie serie1_ ON
    curriculob0_.id_serie = serie1_.id_serie
INNER JOIN basico.etapa_ensino etapaensin2_ ON
    serie1_.id_etapa_ensino = etapaensin2_.id_etapa_ensino
LEFT OUTER JOIN basico.curriculo_basico_componente curriculoc3_ ON
    curriculob0_.id_curriculo_basico = curriculoc3_.id_curriculo_basico
LEFT OUTER JOIN basico.curriculo_basico_serie_multisseriada curriculos4_ ON
    curriculob0_.id_curriculo_basico = curriculos4_.id_curriculo_basico
LEFT OUTER JOIN basico.curriculo_basico curriculob5_ ON
    curriculos4_.id_curriculo_basico_serie_associada = curriculob5_.id_curriculo_basico
    AND (curriculob5_.ativo)
LEFT OUTER JOIN basico.curriculo_basico_componente_escola curriculoc6_ ON
    curriculob0_.id_curriculo_basico = curriculoc6_.id_curriculo_basico
    AND (curriculoc6_.ativo)
WHERE curriculob0_.id_curriculo_basico = 95781650
ORDER BY curriculob5_.id_serie ASC;