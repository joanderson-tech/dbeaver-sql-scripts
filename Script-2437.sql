SELECT ra.id_relatorio_avaliativo AS id_relatorio, ra.id_configuracao_relatorio AS id_configuracao, cr.possui_parecer_descritivo AS possui_parecer_descritivo, ra.id_matricula_discente_serie AS id_mes, mes.id_turma_serie, mes.id_turma_serie_multisseriado, ra.id_situacao_relatorio_avaliativo AS id_situacao_relatorio, ra.ativo AS ativo_relatorio, ra.id_parecer_descritivo_individual AS id_parecer, pdi.ativo AS ativo_parecer , ra.situacao AS relatorio_situacao, ra.justificativa_situacao AS relatorio_justificativa_situacao, cb.possui_parte_diversificada, cb.tipo_diario, cb.tipo_diario_diversificado, rac.id_configuracao_relatorio_componente AS id_configuracao_componente, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, rac.id_relatorio_avaliativo_componente AS id_relatorio_componente, rac.parecer_final_fixo, rac.parecer_final_descritivo, mc.id_matricula_componente AS id_matricula_componente, rac.avaliacao_descritiva AS avaliacao_descritiva, rac.id_situacao_relatorio_avaliativo_componente AS situacao_componente, rac.avaliacao_descritiva_2 AS avaliacao_descritiva_2, rac.avaliacao_descritiva_3 AS avaliacao_descritiva_3, rac.avaliacao_descritiva_4 AS avaliacao_descritiva_4, rah.id_relatorio_avaliativo_habilidade AS id_relatorio_habilidade, rah.id_configuracao_relatorio_componente_habilidade AS id_configuracao_habilidade, crch.ativo AS configuracao_habilidade_ativo, rahr.id_relatorio_avaliativo_habilidade_resposta AS id_relatorio_resposta, rahr.id_opcao_grupo_avaliacao_relatorio AS id_opcao_resposta, rahr.periodo AS resposta_periodo, pdi.descricao AS parecer_descricao, pdi.descricao_medial AS parecer_descricao_medial, pdi.descricao_final AS parecer_descricao_final, p.nome AS pessoa_nome, p.nome_social AS nome_social, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, d.matricula AS matricula, sms.descricao AS situacao_descricao, pr.id_periodicidade_relatorio AS periodicidade_relatorio, pr.descricao AS periodicidade_descricao, pr.quantidade_repeticoes AS periodicidade_qtd_repeticoes, pr.unidade_descricao AS unidade_descricao, tacr.id_tipo_avaliacao_componente_relatorio AS id_tipo_avaliacao, ogar.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ogar.sigla AS opcao_sigla, ogar.descricao AS opcao_descricao, cc.nome AS componente_nome, cc.id_componente_curricular AS id_componente_curricular, ac.descricao AS area_conhecimento_descricao, hc.id_habilidade_competencia AS id_habilidade_competencia, hc.descricao AS habilidade_descricao, crc.maximo_caracteres_relatorio, t.id_categoria_componente
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
JOIN basico.situacao_matricula_serie sms ON
sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
JOIN ensino_infantil.relatorio_avaliativo ra ON
mes.id_matricula_discente_serie = ra.id_matricula_discente_serie
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON
pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON
cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
LEFT JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON
gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON
ogar.id_grupo_avaliacao_relatorio = gar.id_grupo_avaliacao_relatorio
LEFT JOIN ensino_infantil.periodicidade_relatorio pr ON
pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio
LEFT JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tacr ON
tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio
LEFT JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = crc.id_componente_curricular
LEFT JOIN ensino_infantil.area_conhecimento ac ON
ac.id_area_conhecimento = cc.id_area_conhecimento
LEFT JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON
crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
LEFT JOIN ensino_infantil.habilidade_competencia hc ON
hc.id_habilidade_competencia = crch.id_habilidade_competencia
LEFT JOIN ensino.turma t ON
t.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
AND t.id_disciplina = crc.id_componente_curricular
AND t.id_situacao_turma <> 4
LEFT JOIN ensino.matricula_componente mc ON
mc.id_discente = d.id_discente
AND mc.id_componente_curricular = crc.id_componente_curricular
AND mc.id_turma = t.id_turma
LEFT JOIN basico.curriculo_basico cb ON
cb.id_curriculo_basico = cr.id_curriculo_basico
WHERE ra.ativo
AND crc.ativo
AND ((cr.possui_parecer_descritivo
	AND pdi.ativo)
OR NOT cr.possui_parecer_descritivo)
AND d.status <> 2
AND ((ra.id_situacao_relatorio_avaliativo <> 4
	AND rac.id_situacao_relatorio_avaliativo_componente <> 4)
OR (mes.id_situacao_matricula_serie = 4
	AND ( SELECT count(*)
FROM basico.movimentacao_estudante me
WHERE me.id_discente = mc.id_discente
	AND me.ativo
	AND me.id_tipo_movimentacao_estudante = 3
	AND ano_escolar = mes.ano_calendario ) > 0) )
AND mes.id_matricula_discente_serie = 1608486
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 )



SELECT crc.* FROM ensino_infantil.configuracao_relatorio_componente AS crc
WHERE id_configuracao_relatorio = 47;

