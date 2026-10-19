SELECT DISTINCT config
FROM ConfiguracaoRelatorio config
JOIN config.curriculoBasico curr
JOIN config.grupoAvaliacaoRelatorio gr
JOIN gr.opcoesGrupoAvaliacaoRelatorio
JOIN config.configuracaoRelatorioComponentes comps
JOIN comps.tipoAvaliacaoComponenteRelatorio
JOIN comps.componenteCurricular
LEFT JOIN comps.configuracaoRelatorioComponentesHabilidades habs
LEFT JOIN habs.habilidadeCompetencia
WHERE 1 = 1
AND config.ativo = TRUE
AND comps.ativo = TRUE
AND (comps.tipoAvaliacaoComponenteRelatorio = 1
	OR (comps.tipoAvaliacaoComponenteRelatorio = 2
		AND habs.ativo = TRUE))
AND curr.id = 




SELECT DISTINCT cr
FROM ensino_infantil.configuracao_relatorio cr
INNER JOIN basico.curriculo_basico cb ON  cr.id_curriculo_basico = cb.id_curriculo_basico
INNER JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON cr.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
--INNER JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio og ON gar.id_grupo_avaliacao_relatorio = og.id_grupo_avaliacao_relatorio
/*INNER JOIN ensino_infantil.configuracao_relatorio_componente crc ON cr.id_configuracao_relatorio = crc.id_configuracao_relatorio
AND (crc.ativo)*/
--INNER JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tipoavalia5_ ON crc.id_tipo_avaliacao_componente_relatorio = tipoavalia5_.id_tipo_avaliacao_componente_relatorio
/*INNER JOIN ensino.componente_curricular cc ON crc.id_componente_curricular = cc.id_componente_curricular
LEFT OUTER JOIN ensino_infantil.configuracao_relatorio_componente_habilidade rch ON crc.id_configuracao_relatorio_componente = rch.id_configuracao_relatorio_componente
AND (rch.ativo)*/
--LEFT OUTER JOIN ensino_infantil.habilidade_competencia habilidade8_ ON rch.id_habilidade_competencia = habilidade8_.id_habilidade_competencia
WHERE 1 = 1
AND cr.ativo = TRUE
--AND crc.ativo = TRUE
--AND (crc.id_tipo_avaliacao_componente_relatorio = 1	OR crc.id_tipo_avaliacao_componente_relatorio = 2	AND rch.ativo = TRUE)
AND cb.id_curriculo_basico = 51880535;


SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico = 51880535

SELECT * FROM ensino_infantil.opcao_grupo_avaliacao_relatorio ;


SELECT DISTINCT gar
FROM ensino_infantil.configuracao_relatorio cr
INNER JOIN basico.curriculo_basico cb ON  cr.id_curriculo_basico = cb.id_curriculo_basico
INNER JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON cr.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
--INNER JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio og ON gar.id_grupo_avaliacao_relatorio = og.id_grupo_avaliacao_relatorio
WHERE 1 = 1
AND cb.id_curriculo_basico = 51880535;
