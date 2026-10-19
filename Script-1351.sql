SELECT ts.*
FROM basico.turma_serie ts
--JOIN basico.matricula_estudante_serie mes ON
/*mes.id_turma_serie = ts.id_turma_serie
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
LEFT JOIN ensino_infantil.configuracao_relatorio cr ON
cr.id_configuracao_relatorio = ra.id_configuracao_relatorio*/
--LEFT JOIN ensino_infantil.configuracao_relatorio cr2 ON cr2.id_curriculo_basico = ts.id_curriculo_medio AND cr2.ativo
WHERE ts.id_turma_serie = 83942198;
--51876318

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (72759224, 83942950);

SELECT * FROM ensino_infantil.relatorio_avaliativo_componente rac WHERE rac.id_relatorio_avaliativo =113970;113968

SELECT *
FROM basico.turma_serie ts
WHERE id_turma_serie = 72424877;

--Solução Trocar estrutura da turma EICM2INT para EMEITIG3 a nova
UPDATE basico.turma_serie SET id_curriculo_medio = 83942950 WHERE id_turma_serie = 72424877;

--Mudando a relação do relatorio avaliativa para ter relação com a nova configuração
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo
     SET id_configuracao_relatorio = ' ||
     (
        SELECT cr.id_configuracao_relatorio
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico IN (83942950)
LIMIT 1
     ) ||
     ' WHERE id_relatorio_avaliativo IN (' ||
     string_agg(ra.id_relatorio_avaliativo::text, ', ') ||
     ');' AS solucao, 'UPDATE ensino_infantil.relatorio_avaliativo
     SET id_configuracao_relatorio = 64
     WHERE id_relatorio_avaliativo IN (' ||
     string_agg(ra.id_relatorio_avaliativo::text, ', ') ||
     ');' AS backup
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_configuracao_relatorio = 64
AND ra.ativo;





SELECT cr2.id_configuracao_relatorio, cr.id_configuracao_relatorio, ts.id_curriculo_medio
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
WHERE mes.id_matricula_discente_serie = 1572204
AND ra.ativo;

SELECT cr.id_configuracao_relatorio
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico IN ( 83942950);

SELECT *
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_configuracao_relatorio IN (64);








BEGIN;
--PASSO 01
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 72759158, 4, 5, TRUE, 'EMEITIRB1', NULL, NULL, now(), NULL, FALSE),(nextval('ensino_infantil.configuracao_relatorio_seq'), 83942950, 4, 5, TRUE, 'EMEITIG3', NULL, NULL, now(), NULL, FALSE);
--PASSO 02
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(
    id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo
)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq') AS id_configuracao_relatorio_componente, cr.id_configuracao_relatorio, foo.id_componente_curricular, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN 1
ELSE 2
    END AS id_tipo_avaliacao_componente_relatorio, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN 9999
ELSE NULL
    END AS maximo_caracteres_relatorio, TRUE AS ativo, NULL AS id_registro_cadastro, NULL AS id_registro_atualizacao, current_date AS data_cadastro, NULL AS data_alteracao, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN FALSE
ELSE TRUE
    END AS possui_parecer_final_fixo, TRUE AS possui_parecer_final_descritivo
FROM ensino_infantil.configuracao_relatorio cr
CROSS JOIN
    UNNEST(ARRAY[283, 513, 514, 515, 516, 517, 518, 519, 520]) AS foo (id_componente_curricular)
WHERE cr.id_curriculo_basico IN (72759158, 83942950)
ORDER BY
    cr.id_configuracao_relatorio, foo.id_componente_curricular;
--PASSO 03
WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch
JOIN ensino_infantil.configuracao_relatorio_componente crc
	USING(id_configuracao_relatorio_componente)
JOIN ensino_infantil.configuracao_relatorio cr
	USING(id_configuracao_relatorio)
WHERE cr.id_configuracao_relatorio IN (43, 45)
	AND crch.ativo
ORDER BY 
		crc.id_configuracao_relatorio = 45, crc.id_configuracao_relatorio = 43, crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
), curriculo_associacao AS (
	SELECT *
FROM(
VALUES
		(72759158, 61640504), --EMEITIB1
		(83942950, 61639553)--EMEITIM2
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio = cr.id_configuracao_relatorio
JOIN curriculo_associacao ca ON
ca.id_cb_alvo = cr.id_curriculo_basico
JOIN configuracao_relatorio_referencia crr ON
crr.id_curriculo_basico = ca.id_cb_referencia
AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (72759158, 83942950);

COMMIT ;

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
AND mes.id_matricula_discente_serie = 1572204
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 4, 11 );





