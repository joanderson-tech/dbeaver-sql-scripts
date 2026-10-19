SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo = '4PN';

SELECT t.* FROM ensino.turno AS t;

BEGIN;

UPDATE basico.curriculo_basico 	SET id_turno=519283270 	WHERE id_curriculo_basico=35558311;
UPDATE basico.turma_serie SET id_turno=519283270 WHERE id_turma_serie IN (51878600, 51924842);
UPDATE basico.matricula_estudante_serie SET id_turno=519283270 	WHERE id_matricula_discente_serie IN (1318607,1318767,1318386,1317631,1317636,1317639,1317630,1317632,1317633,1317634,1317635,1317637,1317638,1318524,1318372,1318374,1318390,1318375,1318376,1318377,1318378,1318379,1318381,1318382,1318383,1318384,1318385,1318373,1318380,1318605,1318620,1318619,1318606);

COMMIT;
SELECT 'UPDATE basico.turma_serie SET id_turno=519283270 WHERE id_turma_serie IN (' || STRING_AGG(ts.id_turma_serie::text, ', ') || ');' AS solucao, 
			 'UPDATE basico.turma_serie SET id_turno=5 WHERE id_turma_serie IN (' || STRING_AGG(ts.id_turma_serie::text, ', ') || ');' AS backup
 FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 35558311 AND ts.ativo AND ts.id_turno = 5;



SELECT * --string_agg(id_matricula_discente_serie::varchar, ',')
FROM basico.matricula_estudante_serie mes WHERE mes.id_turno = 5 AND mes.id_turma_serie IN (51878600, 51924842);

1318607,1318767,1318386,1317631,1317636,1317639,1317630,1317632,1317633,1317634,1317635,1317637,1317638,1318524,1318372,1318374,1318390,1318375,1318376,1318377,1318378,1318379,1318381,1318382,1318383,1318384,1318385,1318373,1318380,1318605,1318620,1318619,1318606


-- mes.id_turma_serie IN (51878600,
51924842,
51942906)


SELECT *
FROM basico.turma_serie
WHERE id_escola = 1414
AND ano = 2026;


SELECT cb
FROM basico.curriculo_basico cb
LEFT OUTER JOIN escola.escola e ON cb.id_escola = e.id_escola
LEFT OUTER JOIN escola.bairro_escola bairroesco4_ ON e.id_bairro_escola = bairroesco4_.id_bairro_escola
LEFT OUTER JOIN comum.municipio municipio5_ ON bairroesco4_.id_municipio = municipio5_.id_municipio
LEFT OUTER JOIN comum.unidade_federativa unidadefed6_ ON municipio5_.id_unidade_federativa = unidadefed6_.id_unidade_federativa
LEFT OUTER JOIN comum.municipio municipio7_ ON unidadefed6_.id_capital = municipio7_.id_municipio
LEFT OUTER JOIN comum.pais pais8_ ON unidadefed6_.id_pais = pais8_.id_pais
LEFT OUTER JOIN comum.conta_bancaria contabanca9_ ON e.id_conta = contabanca9_.id_conta_bancaria
LEFT OUTER JOIN comum.banco banco10_ ON contabanca9_.id_banco = banco10_.id_banco
LEFT OUTER JOIN escola.dependencia_administrativa_escola dependenci11_ ON e.id_dependencia_administrativa = dependenci11_.id_dependencia_administrativa_escola
LEFT OUTER JOIN comum.unidade unidade12_ ON e.id_drae = unidade12_.id_unidade
LEFT OUTER JOIN escola.localizacao_zona localizaca13_ ON e.id_localizacao_zona = localizaca13_.id_localizacao_zona
LEFT OUTER JOIN comum.municipio municipio14_ ON e.id_municipio = municipio14_.id_municipio
LEFT OUTER JOIN comum.unidade unidade15_ ON e.id_regional_ensino = unidade15_.id_unidade
LEFT OUTER JOIN escola.situacao_funcionamento situacaofu16_ ON e.id_situacao_funcionamento = situacaofu16_.id_situacao_funcionamento
LEFT OUTER JOIN escola.tipo_unidade_escolar tipounidad17_ ON e.id_tipo_unidade_escolar = tipounidad17_.id_tipo_unidade_escolar
LEFT OUTER JOIN comum.unidade unidade18_ ON e.id_unidade_escola = unidade18_.id_unidade
LEFT OUTER JOIN comum.zona_municipal zonamunici19_ ON e.id_zona_municipal = zonamunici19_.id_zona_municipal
LEFT OUTER JOIN comum.municipio municipio20_ ON zonamunici19_.id_municipio = municipio20_.id_municipio
LEFT OUTER JOIN basico.escola_curriculo ec1_ ON cb.id_curriculo_basico = ec1_.id_curriculo_basico
LEFT OUTER JOIN escola.escola escola22_ ON ec1_.id_escola = escola22_.id_escola
INNER JOIN basico.serie serie23_ ON cb.id_serie = serie23_.id_serie
LEFT OUTER JOIN basico.etapa_ensino etapaensin24_ ON serie23_.id_etapa_ensino = etapaensin24_.id_etapa_ensino
LEFT OUTER JOIN basico.forma_organizacao_etapa formaorgan25_ ON etapaensin24_.id_forma_organizacao_Etapa = formaorgan25_.id_forma_organizacao_etapa
LEFT OUTER JOIN comum.unidade unidade26_ ON formaorgan25_.id_unidade = unidade26_.id_unidade
LEFT OUTER JOIN basico.local_oferta localofert27_ ON etapaensin24_.id_local_oferta = localofert27_.id_local_oferta
LEFT OUTER JOIN basico.modalidade_ensino_basico modalidade28_ ON etapaensin24_.id_modalidade = modalidade28_.id_modalidade_ensino_basico
LEFT OUTER JOIN comum.unidade unidade29_ ON modalidade28_.id_unidade = unidade29_.id_unidade
LEFT OUTER JOIN basico.nivel_etapa_ensino niveletapa30_ ON etapaensin24_.id_nivel_etapa = niveletapa30_.id_nivel_etapa_ensino
LEFT OUTER JOIN comum.unidade unidade31_ ON niveletapa30_.id_unidade = unidade31_.id_unidade
LEFT OUTER JOIN basico.situacao_etapa_ensino situacaoet32_ ON etapaensin24_.id_situacao = situacaoet32_.id_situacao
LEFT OUTER JOIN comum.unidade unidade33_ ON etapaensin24_.id_unidade = unidade33_.id_unidade
LEFT OUTER JOIN comum.unidade unidade34_ ON serie23_.id_unidade = unidade34_.id_unidade
LEFT OUTER JOIN ensino.turno turno35_ ON cb.id_turno = turno35_.id_turno
LEFT OUTER JOIN comum.unidade unidade36_ ON cb.id_unidade = unidade36_.id_unidade
WHERE cb.ativo 
AND cb.id_serie =15290011
AND cb.ano_entrada_vigor =null
--AND cb.id_turno =2
--AND (cb.id_escola =null 	OR (ec1_.id_escola = null AND ec1_.ativo =true))
ORDER BY cb.ano_entrada_vigor DESC, cb.id_escola DESC, cb.id_turno DESC, cb.id_curriculo_basico DESC
LIMIT 1;