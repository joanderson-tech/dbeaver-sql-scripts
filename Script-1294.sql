SELECT DISTINCT 1
FROM basico.turma_serie ts
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
WHERE ts.id_curriculo_medio = 51895123
AND t.id_situacao_turma <> 4
AND t.id_disciplina = 293;

SELECT t.id_turma, t.codigo, t.id_turma_serie
FROM ensino.turma t
WHERE t.id_turma_serie IN (51895467, 51895839, 51895647, 51895125)
AND t.id_disciplina = 220

SELECT *
FROM tc_para_adicionar;

SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '%EVERARDO JOSÉ RODRIGUES%';

SELECT ts.*
FROM basico.turma_serie ts
JOIN escola.escola e ON
e.id_escola = ts.id_escola
WHERE ts.id_curriculo_medio = 51895123
AND ts.ativo ;

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN(51895839) ;

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_matricula_estudante_serie = 1317192
AND mc.id_situacao_matricula = 2;

SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%HENRIQUE ALVES BATISTA%';
-- 51877817

SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%EVERARDO JOSE RODRIGUES%';
-- 51877804

SELECT *
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico_componente = (
    SELECT cbc.id_curriculo_basico_componente
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_componente_curricular = 293
AND cbc.id_curriculo_basico = 51895123
);

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_componente_curricular = 293
AND cbc.id_curriculo_basico = 51895123;

SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente rac
WHERE rac.id_matricula_componente IN(17005203, 17007145);

SELECT *
FROM ensino_infantil.configuracao_relatorio cr;

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_matricula_estudante_serie = 1317216
AND mc.id_situacao_matricula = 2;

SELECT *
FROM ensino_infantil.parecer_descritivo_individual
WHERE id_matricula_discente_serie = 1317192;

SELECT *
FROM ensino_infantil.relatorio_avaliativo ra;
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo_componente = ra.id_relatorio_avaliativo
WHERE ra.id_configuracao_relatorio = 7;

]

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc;
WHERE crc.id_configuracao_relatorio = 7
AND crc.id_componente_curricular = 293;

SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente rac;
WHERE rac.id_configuracao_relatorio_componente = 41;

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente;
WHERE id_relatorio_avaliativo = 7;

SELECT DISTINCT ra.id_relatorio_avaliativo AS id_relatorio, ra.id_configuracao_relatorio AS id_configuracao, cr.possui_parecer_descritivo AS possui_parecer_descritivo, ra.id_matricula_discente_serie AS id_mes, mes.id_turma_serie, mes.id_turma_serie_multisseriado, ra.id_situacao_relatorio_avaliativo AS id_situacao_relatorio, ra.ativo AS ativo_relatorio, ra.id_parecer_descritivo_individual AS id_parecer, pdi.ativo AS ativo_parecer , ra.situacao AS relatorio_situacao, ra.justificativa_situacao AS relatorio_justificativa_situacao, cb.possui_parte_diversificada, cb.tipo_diario, cb.tipo_diario_diversificado, rac.id_configuracao_relatorio_componente AS id_configuracao_componente, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, rac.id_relatorio_avaliativo_componente AS id_relatorio_componente, rac.parecer_final_fixo, rac.parecer_final_descritivo, mc.id_matricula_componente AS id_matricula_componente, rac.avaliacao_descritiva AS avaliacao_descritiva, rac.id_situacao_relatorio_avaliativo_componente AS situacao_componente, rac.avaliacao_descritiva_2 AS avaliacao_descritiva_2, rac.avaliacao_descritiva_3 AS avaliacao_descritiva_3, rac.avaliacao_descritiva_4 AS avaliacao_descritiva_4, rah.id_relatorio_avaliativo_habilidade AS id_relatorio_habilidade, rah.id_configuracao_relatorio_componente_habilidade AS id_configuracao_habilidade, crch.ativo AS configuracao_habilidade_ativo, rahr.id_relatorio_avaliativo_habilidade_resposta AS id_relatorio_resposta, rahr.id_opcao_grupo_avaliacao_relatorio AS id_opcao_resposta, rahr.periodo AS resposta_periodo, pdi.descricao AS parecer_descricao, pdi.descricao_medial AS parecer_descricao_medial, pdi.descricao_final AS parecer_descricao_final, p.nome AS pessoa_nome, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, d.matricula AS matricula, sms.descricao AS situacao_descricao, pr.id_periodicidade_relatorio AS periodicidade_relatorio, pr.descricao AS periodicidade_descricao, pr.quantidade_repeticoes AS periodicidade_qtd_repeticoes, pr.unidade_descricao AS unidade_descricao, tacr.id_tipo_avaliacao_componente_relatorio AS id_tipo_avaliacao, ogar.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ogar.sigla AS opcao_sigla, ogar.descricao AS opcao_descricao, cc.nome AS componente_nome, cc.id_componente_curricular AS id_componente_curricular, ac.descricao AS area_conhecimento_descricao, hc.id_habilidade_competencia AS id_habilidade_competencia, hc.descricao AS habilidade_descricao, crc.maximo_caracteres_relatorio, t.id_categoria_componente
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
AND mes.id_matricula_discente_serie = 973552
--AND mc.id_matricula_componente = 17005203
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 );

SELECT mc.id_matricula_componente, COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltas, mc.id_discente, mc.id_componente_curricular
FROM ensino.matricula_componente mc
JOIN ensino.frequencia_aluno fa ON
fa.id_discente = mc.id_discente
AND fa.id_turma = mc.id_turma
JOIN ensino.turma t ON
t.id_turma = mc.id_turma
WHERE mc.id_turma = 683406
AND fa.id_turma = 683406
AND fa.ativo = trueValue()
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8 )
GROUP BY mc.id_matricula_componente;

SELECT(cr2.id_configuracao_relatorio = cr.id_configuracao_relatorio) AS configuracao_igual
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON
ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON
cr.id_configuracao_relatorio = ra.id_configuracao_relatorio
LEFT JOIN ensino_infantil.configuracao_relatorio cr2 ON
cr2.id_curriculo_basico = ts.id_curriculo_medio
AND cr2.ativo
WHERE mes.id_matricula_discente_serie = 1317201
AND ra.ativo;

SELECT DISTINCT ra.id_relatorio_avaliativo AS id_relatorio, ra.id_configuracao_relatorio AS id_configuracao, cr.possui_parecer_descritivo AS possui_parecer_descritivo, ra.id_matricula_discente_serie AS id_mes, mes.id_turma_serie, mes.id_turma_serie_multisseriado, ra.id_situacao_relatorio_avaliativo AS id_situacao_relatorio, ra.ativo AS ativo_relatorio, ra.id_parecer_descritivo_individual AS id_parecer, pdi.ativo AS ativo_parecer , ra.situacao AS relatorio_situacao, ra.justificativa_situacao AS relatorio_justificativa_situacao, cb.possui_parte_diversificada, cb.tipo_diario, cb.tipo_diario_diversificado, rac.id_configuracao_relatorio_componente AS id_configuracao_componente, crc.possui_parecer_final_fixo, crc.possui_parecer_final_descritivo, rac.id_relatorio_avaliativo_componente AS id_relatorio_componente, rac.parecer_final_fixo, rac.parecer_final_descritivo, mc.id_matricula_componente AS id_matricula_componente, rac.avaliacao_descritiva AS avaliacao_descritiva, rac.id_situacao_relatorio_avaliativo_componente AS situacao_componente, rac.avaliacao_descritiva_2 AS avaliacao_descritiva_2, rac.avaliacao_descritiva_3 AS avaliacao_descritiva_3, rac.avaliacao_descritiva_4 AS avaliacao_descritiva_4, rah.id_relatorio_avaliativo_habilidade AS id_relatorio_habilidade, rah.id_configuracao_relatorio_componente_habilidade AS id_configuracao_habilidade, crch.ativo AS configuracao_habilidade_ativo, rahr.id_relatorio_avaliativo_habilidade_resposta AS id_relatorio_resposta, rahr.id_opcao_grupo_avaliacao_relatorio AS id_opcao_resposta, rahr.periodo AS resposta_periodo, pdi.descricao AS parecer_descricao, pdi.descricao_medial AS parecer_descricao_medial, pdi.descricao_final AS parecer_descricao_final, p.nome AS pessoa_nome, p.nome_mae AS nome_mae, p.nome_pai AS nome_pai, d.matricula AS matricula, sms.descricao AS situacao_descricao, pr.id_periodicidade_relatorio AS periodicidade_relatorio, pr.descricao AS periodicidade_descricao, pr.quantidade_repeticoes AS periodicidade_qtd_repeticoes, pr.unidade_descricao AS unidade_descricao, tacr.id_tipo_avaliacao_componente_relatorio AS id_tipo_avaliacao, ogar.id_opcao_grupo_avaliacao_relatorio AS opcao_id, ogar.sigla AS opcao_sigla, ogar.descricao AS opcao_descricao, cc.nome AS componente_nome, cc.id_componente_curricular AS id_componente_curricular, ac.descricao AS area_conhecimento_descricao, hc.id_habilidade_competencia AS id_habilidade_competencia, hc.descricao AS habilidade_descricao, crc.maximo_caracteres_relatorio, t.id_categoria_componente
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
AND mes.id_matricula_discente_serie = 1317208
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 );




SELECT DISTINCT 
	 tsa.ano, tsa.periodo, 1 id_situacao_turma,
--t.id_turma_agrupadora,
-- ABERTA
tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, cbc.id_categoria_componente
--INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN ensino.turma t ON
t.id_turma_serie = tsa.id_turma_serie
-- tsa: Turma Serie Adicionar
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293
AND tsa.ativo;
AND t.id_turma_agrupadora IS NOT NULL;
---

SELECT *
--string_agg(id_relatorio_avaliativo_componente :: varchar ,',') 
FROM ensino_infantil.relatorio_avaliativo_componente
WHERE id_configuracao_relatorio_componente = 43;

SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente rac
WHERE rac.id_relatorio_avaliativo = 7;

SELECT DISTINCT rac.*
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio = ra.id_configuracao_relatorio
AND crc.id_componente_curricular = 293
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo_componente = ra.id_relatorio_avaliativo
--JOIN novas_mc mc ON mc.id_matricula_estudante_serie = ra.id_matricula_discente_serie
WHERE crc.id_configuracao_relatorio_componente = 43;
-- Auto-generated SQL script #202510101016
SELECT *
FROM ensino_infantil.relatorio_avaliativo_componente
WHERE id_relatorio_avaliativo_componente IN (889, 897, 883, 884, 890, 880, 879, 896, 887, 895, 891, 888, 882, 894, 892, 881, 885, 893, 886);

SELECT DISTINCT tsa.id_turma_serie, nextval('ensino.turma_seq') id_turma, tsa.ano, tsa.periodo, 1 id_situacao_turma,
-- ABERTA
tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, cbc.ordem, cbc.id_categoria_componente
--, t.id_turma_agrupadora 
--INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN ensino.turma t ON
t.id_turma_serie = tsa.id_turma_serie
-- tsa: Turma Serie Adicionar
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293
AND tsa.ativo;
AND t.id_turma_agrupadora IS NOT NULL;

SELECT *
FROM rac_para_adicionar rac;

SELECT mc.*
FROM basico.matricula_estudante_serie mes
JOIN ensino.matricula_componente mc ON
mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE mes.id_turma_serie = 51895839
AND mc.id_situacao_matricula <> 7;

SELECT DISTINCT nextval('ensino.turma_seq') id_turma, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, cbc.id_categoria_componente
--INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
--JOIN ensino.turma t ON t.id_turma_serie = tsa.id_turma_serie 
JOIN basico.curriculo_basico_componente cbc ON
    cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293
-- INÍCIO DA CLÁUSULA WHERE (onde o filtro deve estar)
WHERE tsa.ativo
AND t.id_turma_agrupadora IS NOT NULL
-- AQUI ESTÁ O FILTRO PARA PEGAR APENAS DUAS TURMAS:
AND tsa.id_turma_serie IN (51895647, 51895839);
-- <== SUBSTITUA PELOS IDs REAIS!

    
    
    
    
SELECT DISTINCT 
    nextval('ensino.turma_seq') id_turma,( SELECT t.id_turma
FROM ensino.turma t
WHERE t.id_turma_serie = tsa.id_turma_serie
AND t.id_disciplina = 220
LIMIT 1) AS id_turma_agrupadora, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, cbc.id_categoria_componente
--INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON
    cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293
WHERE tsa.ativo;
AND tsa.id_turma_serie IN (51895647, 51895839);

17007189, 17007186, 17007181, 17007182, 17007202, 17007191, 17007212, 17007199, 17007192, 17007206, 17007203, 17007213, 17007196, 17007214, 17007205, 17007211, 17007183, 17007190, 17007185
