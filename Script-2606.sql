SELECT pae.id_plano_anual_ensino, pae.id_turma, pae.referencia, pae.id_situacao_acompanhamento_pedagogico, pae.corrigir_referencia, pae.parecer_supervisor, paec.id_plano_anual_ensino_categoria, paec.unidade_tematica, paec.objeto_conhecimento, paec.habilidade, paec.abordagem_metodologica, paec.avaliacao, paec.unidade_tematica_corrigir, paec.objeto_conhecimento_corrigir, paec.habilidade_corrigir, paec.abordagem_metodologica_corrigir, paec.avaliacao_corrigir, paec.bimestre, pae.mensagem_devolutiva
FROM ava.plano_anual_ensino pae
JOIN ava.plano_anual_ensino_categoria paec ON
paec.id_plano_anual_ensino = pae.id_plano_anual_ensino
WHERE pae.id_turma = 684332
AND (paec.bimestre, paec.id_plano_anual_ensino_categoria) IN ( SELECT paec_sub.bimestre, MIN(paec_sub.id_plano_anual_ensino_categoria) AS id_plano_anual_ensino_categoria
FROM ava.plano_anual_ensino_categoria paec_sub
WHERE paec_sub.id_plano_anual_ensino = pae.id_plano_anual_ensino
GROUP BY paec_sub.bimestre )
ORDER BY paec.bimestre;


SELECT DISTINCT t.* 
FROM ensino.turma t 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
JOIN escola.escola e ON ts.id_escola = e.id_escola 
WHERE --e.nome ILIKE '%ESCOLA MUNICIPAL MANOEL VENANCIO DE PONTES%';
e.id_escola = 1346
AND ts.nome = 'EJAF1VEJAMA'