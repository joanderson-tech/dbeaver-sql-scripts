SELECT ts.* FROM basico.turma_serie ts
LEFT OUTER JOIN basico.tipo_turma_serie tipoturmas1_ ON
ts.id_tipo_turma_serie = tipoturmas1_.id_tipo_turma_serie
LEFT OUTER JOIN basico.curriculo_basico curriculob2_ ON
ts.id_curriculo_medio = curriculob2_.id_curriculo_basico
INNER JOIN escola.escola escola3_ ON
ts.id_escola = escola3_.id_escola
INNER JOIN comum.municipio municipio5_ ON
escola3_.id_municipio = municipio5_.id_municipio
INNER JOIN comum.unidade unidade7_ ON
escola3_.id_regional_ensino = unidade7_.id_unidade
INNER JOIN basico.serie serie8_ ON
ts.id_serie = serie8_.id_serie
INNER JOIN basico.etapa_ensino etapaensin10_ ON
serie8_.id_etapa_ensino = etapaensin10_.id_etapa_ensino
INNER JOIN basico.modalidade_ensino_basico modalidade13_ ON
etapaensin10_.id_modalidade = modalidade13_.id_modalidade_ensino_basico
INNER JOIN basico.nivel_etapa_ensino niveletapa16_ ON
etapaensin10_.id_nivel_etapa = niveletapa16_.id_nivel_etapa_ensino
INNER JOIN basico.forma_organizacao_etapa formaorgan42_ ON
etapaensin10_.id_forma_organizacao_Etapa = formaorgan42_.id_forma_organizacao_etapa
LEFT OUTER JOIN basico.turma_serie turmaserie17_ ON
ts.id_turma_serie_agrupadora = turmaserie17_.id_turma_serie
INNER JOIN ensino.turno turno19_ ON
ts.id_turno = turno19_.id_turno

SELECT * FROM basico.turma_serie ts 
WHERE ts.id_turma_serie = 52346560;

AND ts.atividade_complementar = TRUE;


