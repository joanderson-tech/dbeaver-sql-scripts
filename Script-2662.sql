SELECT ccm.id_configuracao_conteudo_ministrado, cccm.nome AS nomeCampo,(cccm.tipo_campo = 'TEXTO_DESCRITIVO') AS textoDescritivo,(cccm.tipo_campo = 'MULTISSELECAO') AS multisselecao, cccmtd.minimo_caracteres AS qtdMinimaCaracteres, cccmtd.maximo_caracteres AS qtdMaximaCaracteres, cccm.ordem, string_agg(DISTINCT concat(hc.id_habilidade_competencia, '@', hc.descricao), '#') AS habilidadesLista, cccm.destino_persistencia
FROM diario.campo_configuracao_conteudo_ministrado cccm
JOIN diario.configuracao_conteudo_ministrado ccm ON
ccm.id_configuracao_conteudo_ministrado = cccm.id_configuracao_conteudo_ministrado
LEFT JOIN diario.campo_configuracao_conteudo_ministrado_texto_descritivo cccmtd ON
cccmtd.id_campo_configuracao_conteudo_ministrado_texto_descritivo = cccm.id_campo_configuracao_conteudo_ministrado
LEFT JOIN diario.campo_configuracao_conteudo_ministrado_multisselecao cccmm ON
cccmm.id_campo_configuracao_conteudo_ministrado_multisselecao = cccm.id_campo_configuracao_conteudo_ministrado
LEFT JOIN diario.opcoes_campo_configuracao_conteudo_ministrado_multisselecao omm ON
omm.id_campo_configuracao_conteudo_ministrado_multisselecao = cccmm.id_campo_configuracao_conteudo_ministrado_multisselecao
LEFT JOIN ensino_infantil.habilidade_competencia hc ON
hc.id_habilidade_competencia = omm.id_habilidade_competencia
LEFT JOIN diario.configuracao_conteudo_ministrado_etapa_ensino ccmee ON
ccmee.id_configuracao_conteudo_ministrado = ccm.id_configuracao_conteudo_ministrado
LEFT JOIN diario.configuracao_conteudo_ministrado_serie ccms ON
ccms.id_configuracao_conteudo_ministrado = ccm.id_configuracao_conteudo_ministrado
LEFT JOIN diario.configuracao_conteudo_ministrado_componente_curricular ccmcc ON
ccmcc.id_configuracao_conteudo_ministrado = ccm.id_configuracao_conteudo_ministrado
WHERE ccm.ativo
AND ccm.data_fim IS NULL
AND ccmee.id_etapa_ensino = 3
AND ccms.id_serie = 1005222
AND ccmcc.id_componente_curricular = 220
GROUP BY ccm.id_configuracao_conteudo_ministrado, cccm.nome, cccm.tipo_campo, cccmtd.minimo_caracteres, cccmtd.maximo_caracteres, cccm.ordem, cccm.destino_persistencia
ORDER BY ccm.id_configuracao_conteudo_ministrado, cccm.ordem
