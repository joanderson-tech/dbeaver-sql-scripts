SELECT *
FROM comum.recurso_avaliacao_nee
WHERE;

SELECT *
FROM comum.pessoa_recurso_avaliacao_nee pran ;

SELECT ran.*
FROM comum.recurso_avaliacao_nee AS ran
WHERE ran.descricao ILIKE '%Transtorno do espectro autista%';


SELECT * FROM comum.tipo_necessidade_especial tne WHERE tne.descricao ILIKE '%Transtorno do espectro autista%';


SELECT sne.* FROM comum.subtipo_necessidade_especial AS sne
WHERE id_subtipo_necessidade_especial IN (53937841,8);

SELECT ee.id_etapa_ensino AS id_Etapa_Ensino, ee.denominacao AS ee_Denominacao, serie.id_serie AS id_Serie, serie.descricao AS serie_Descricao,( SELECT count(DISTINCT pCount.nome)
FROM basico.matricula_estudante_serie mesCount
LEFT JOIN basico.turma_serie tsCount ON
tsCount.id_turma_serie = mesCount.id_turma_serie
INNER JOIN escola.escola_etapa_ensino_serie eeesCount ON
eeesCount.id_escola_etapa_ensino_serie = mesCount.id_serie_escola
INNER JOIN basico.serie serieCount ON
serieCount.id_serie = eeesCount.id_serie
INNER JOIN basico.etapa_ensino eeCount ON
eeCount.id_etapa_ensino = serieCount.id_etapa_ensino
INNER JOIN public.discente dCount ON
dCount.id_discente = mesCount.id_estudante
INNER JOIN comum.pessoa pCount ON
dCount.id_pessoa = pCount.id_pessoa
INNER JOIN comum.pessoa_necessidade_especial pneCount ON
pneCount.id_pessoa = dCount.id_pessoa
AND pneCount.id_necessidade_especial = pne.id_necessidade_especial
WHERE serieCount.id_serie = serie.id_serie
AND eeesCount.id_escola = eees.id_escola
AND eeCount.id_etapa_ensino = serieCount.id_etapa_ensino
AND pCount.id_pessoa = p.id_pessoa
AND mesCount.ano_calendario = 2026
AND (mesCount.id_turma_serie = mes.id_turma_serie
    OR (mesCount.id_turma_serie IS NULL
        AND mes.id_turma_serie IS NULL))
AND (mesCount.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
    OR mes.id_situacao_matricula_serie = 11) ) AS qdt_Estudantes, p.cid AS cid, escola.id_escola AS id_Escola, escola.nome AS nome_Escola, mun.id_municipio, mun.nome AS nome_Municipio, dired.id_unidade AS id_Unidade, dired.nome AS nome_Dired, tne.id_tipo_necessidade_especial, tne.descricao, ts.nome AS nome_Turma
FROM basico.matricula_estudante_serie mes
LEFT JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
INNER JOIN escola.escola_etapa_ensino_serie eees ON
eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN escola.escola escola ON
eees.id_escola = escola.id_escola
INNER JOIN comum.unidade dired ON
dired.id_unidade = escola.id_regional_ensino
INNER JOIN comum.municipio mun ON
mun.id_municipio = escola.id_municipio
LEFT JOIN basico.serie serie ON
serie.id_serie = eees.id_serie
LEFT JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = serie.id_etapa_ensino
INNER JOIN public.discente d ON
d.id_discente = mes.id_estudante
INNER JOIN comum.pessoa p ON
d.id_pessoa = p.id_pessoa
INNER JOIN comum.pessoa_necessidade_especial pne ON
pne.id_pessoa = d.id_pessoa
INNER JOIN comum.tipo_necessidade_especial tne ON
pne.id_necessidade_especial = tne.id_tipo_necessidade_especial
AND tne.ativo
WHERE mes.ano_calendario = 2026
AND (mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
    OR mes.id_situacao_matricula_serie = 11)
ORDER BY tne.descricao , ee.id_etapa_ensino, ee.denominacao, serie.descricao, ts.nome, p.nome