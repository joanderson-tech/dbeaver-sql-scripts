SELECT mes.*
FROM basico.matricula_estudante_serie mes
WHERE(mes.id_estudante IN (1011982))
AND mes.ano_calendario = 2025
--AND (mes.id_situacao_matricula_serie IN (? ,? ,? ,? ,? ,? ,?))
ORDER BY mes.id_matricula_discente_serie DESC

SELECT *
FROM basico.modalidade_ensino_basico;

SELECT *
FROM basico.etapa_ensino;

SELECT mes.*
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
JOIN basico.serie s ON
s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
WHERE mes.id_estudante IN (1011982)
AND mes.ano_calendario = 2025
ORDER BY mes.id_matricula_discente_serie DESC



SELECT *
FROM basico.serie s ;

SELECT * FROM basico.situacao_matricula_serie ;

SELECT *
FROM basico.matricula_estudante_serie matriculae0_
INNER JOIN basico.turma_serie turmaserie1_ ON
matriculae0_.id_turma_serie = turmaserie1_.id_turma_serie
INNER JOIN basico.serie serie2_ ON
turmaserie1_.id_serie = serie2_.id_serie
INNER JOIN basico.etapa_ensino etapaensin3_ ON
serie2_.id_etapa_ensino = etapaensin3_.id_etapa_ensino
WHERE(matriculae0_.id_estudante IN (987645))
AND matriculae0_.ano_calendario =2025
--AND (matriculae0_.id_situacao_matricula_serie IN (? ,? ,? ,? ,? ,? ,?))
AND (etapaensin3_.id_modalidade <> 2 OR etapaensin3_.id_modalidade = 2 AND serie2_.id_serie <> 1)
ORDER BY matriculae0_.id_matricula_discente_serie DESC




SELECT * FROM discente d WHERE d.matricula = '202330031378'