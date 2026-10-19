SELECT DISTINCT mes
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
AND rac.id_matricula_componente IN ( 17069269, 17069268, 17069278, 17069277, 17069287, 17069286, 17069296, 17069295, 17069305, 17069304, 17069314, 17069313, 17069323, 17069322, 17069332, 17069331, 17069341, 17069340, 17069350, 17069349, 17069359, 17069358, 17069368, 17069367, 17069377, 17069376, 17069386, 17069385 )
AND mc.id_matricula_componente IN ( 17069269, 17069268, 17069278, 17069277, 17069287, 17069286, 17069296, 17069295, 17069305, 17069304, 17069314, 17069313, 17069323, 17069322, 17069332, 17069331, 17069341, 17069340, 17069350, 17069349, 17069359, 17069358, 17069368, 17069367, 17069377, 17069376, 17069386, 17069385 )
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8 );

SELECT *
FROM ensino_infantil.relatorio_avaliativo r
WHERE r.id_configuracao_relatorio = 4
AND r.id_matricula_discente_serie IN (1324857, 1324858, 1324869, 1324873, 1324874, 1324893, 1324901, 1324902, 1324903, 1324909, 1324913, 1324915, 1324922, 1324940)


1324857, 1324858, 1324869, 1324873, 1324874, 1324893, 1324901, 1324902, 1324903, 1324909, 1324913, 1324915, 1324922, 1324940

SELECT *
FROM BASICO.matricula_estudante_serie mes
WHERE MES.id_turma_serie = 51902033;

SELECT *
FROM ENSINO.turma t
WHERE T.id_turma_serie = 51902033;


SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie = 51902033;



-- Auto-generated SQL script #202601081102
UPDATE ensino.turma
	SET id_situacao_turma=1
	WHERE id_turma=686767;
