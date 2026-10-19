BEGIN;

INSERT INTO basico.serie_equivalencia (id_serie_equivalencia, id_serie, id_serie_equivalente, id_unidade, data_cadastro, id_registro_cadastro) VALUES(550, 51869714, 51880694, 605, '2026-02-20 11:58:19.882', 5646558);


DELETE FROM basico.serie_equivalencia WHERE id_serie_equivalencia=548;

ROLLBACK ;

SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 2429
AND vs.ano_letivo = 2026;


SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_serie = 51869714;

SELECT e.*
FROM escola.escola AS e
WHERE id_escola = 2429;

SELECT s.*
FROM basico.serie AS s
WHERE id_serie = 51869714;

SELECT *
FROM basico.serie_equivalencia se
WHERE se.id_serie = 51869714;

SELECT DISTINCT escola1_.id_escola AS col_0_0_, escola1_.endereco AS col_1_0_, escola1_.codigo_inep AS col_2_0_, escola1_.nome AS col_3_0_
FROM matricula.vaga_serie vagaserie0_
INNER JOIN escola.escola escola1_ ON vagaserie0_.id_escola = escola1_.id_escola
INNER JOIN comum.municipio municipio5_ ON escola1_.id_municipio = municipio5_.id_municipio
LEFT OUTER JOIN escola.bairro_escola bairroesco6_ ON escola1_.id_bairro_escola = bairroesco6_.id_bairro_escola
INNER JOIN comum.unidade unidade7_ ON escola1_.id_unidade_escola = unidade7_.id_unidade
INNER JOIN basico.serie serie2_ ON vagaserie0_.id_serie = serie2_.id_serie
INNER JOIN basico.etapa_ensino etapaensin3_ ON serie2_.id_etapa_ensino = etapaensin3_.id_etapa_ensino
INNER JOIN basico.modalidade_ensino_basico modalidade4_ ON etapaensin3_.id_modalidade = modalidade4_.id_modalidade_ensino_basico
WHERE municipio5_.id_municipio =2401305
AND (vagaserie0_.vagas_validadas>vagaserie0_.vagas_ocupadas
	OR vagaserie0_.vagas_validadas>0
	AND (vagaserie0_.vagas_ocupadas IS NULL))
AND escola1_.id_situacao_funcionamento = 1
--AND bairroesco6_.id_bairro_escola =?
AND (vagaserie0_.id_serie =51869714
	OR vagaserie0_.id_serie IN (SELECT serieequiv8_.id_serie_equivalente
FROM basico.serie_equivalencia serieequiv8_
WHERE serieequiv8_.id_serie =51869714))
ORDER BY escola1_.nome ASC