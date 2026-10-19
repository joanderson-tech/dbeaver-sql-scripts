SELECT base.id_matricula_discente_serie, base.componente, base.categoria, rac.id_matricula_componente , base.id_matricula_componente, CASE WHEN EVERY(CASE 
    WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 
    AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 
    AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE ELSE FALSE END) THEN 'concluído'
ELSE 'pendente' END AS apontamento
--INTO lev_relatorios_avaliacao_temp_1784051414523
FROM matriculas_componentes_avaliacao_temp_1784051414523 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
ra.id_matricula_discente_serie = base.id_matricula_discente_serie
AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
AND rac.id_matricula_componente = base.id_matricula_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE(base.tipo_diario IN (54)
    OR (base.tipo_diario IN (51, 52, 53)
        AND base.tipo_diario_diversificado IS NOT NULL
        AND base.categoria = 2))
AND (base.id_solicitacao_dispensa_estudante IS NULL
    OR base.id_solicitacao_dispensa_estudante_componente IS NULL
    OR base.id_dispensa_unidade_relatorio IS NULL)
AND base.id_matricula_discente_serie IN (1655363, 1650714)
GROUP BY base.id_matricula_discente_serie, base.componente, rac.id_matricula_componente , base.id_matricula_componente, base.categoria;

SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_matricula_estudante_serie = 1655363
AND mc.id_matricula_componente IN (20947081, 20947084, 20947082, 20947083);

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio_componente IN (361, 358, 364, 367);

SELECT base.id_componente, ra.id_relatorio_avaliativo, rac.id_matricula_componente, rac.id_relatorio_avaliativo, rac.id_matricula_componente , base.id_matricula_componente
FROM matriculas_componentes_avaliacao_temp_1784051414523 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
    ra.id_matricula_discente_serie = base.id_matricula_discente_serie
AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
    rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
--AND rac.id_matricula_componente = base.id_matricula_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
    rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
    rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
    crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE(base.tipo_diario IN (54)
    OR (base.tipo_diario IN (51, 52, 53)
        AND base.tipo_diario_diversificado IS NOT NULL
        AND base.categoria = 2))
AND (base.id_solicitacao_dispensa_estudante IS NULL
    OR base.id_solicitacao_dispensa_estudante_componente IS NULL
    OR base.id_dispensa_unidade_relatorio IS NULL)
AND base.id_matricula_discente_serie IN (1655363);

SELECT ma.id_matricula_discente_serie, ma.id_estudante, ma.turma AS turma_serie, ma.id_escola, ma.serie, ma.tipo_diario, ma.tipo_diario_diversificado, 
mc.id_turma AS turma, mc.id_matricula_componente, mc.id_componente_curricular AS id_componente, cc.nome AS componente, t.id_categoria_componente AS categoria,
cc.id_tipo_componente AS tipo_componente, sde.id_solicitacao_dispensa_estudante, sdec.id_solicitacao_dispensa_estudante_componente, 
sdeu.id_solicitacao_dispensa_estudante_unidade AS id_dispensa_unidade_ativa, sdeu_relatorio.id_solicitacao_dispensa_estudante_unidade AS id_dispensa_unidade_relatorio 
--INTO matriculas_componentes_avaliacao_temp_1784051414523
FROM matriculas_ativas_avaliacao_temp_1784051414523 ma
JOIN ensino.matricula_componente mc ON
mc.id_discente = ma.id_estudante
JOIN ensino.turma t ON
t.id_turma = mc.id_turma
AND t.id_turma_serie = ma.id_turma_serie
JOIN ensino.componente_curricular cc ON
cc.id_componente_curricular = mc.id_componente_curricular
LEFT JOIN ensino.solicitacao_dispensa_estudante sde ON
sde.id_matricula_estudante_serie = ma.id_matricula_discente_serie
AND sde.id_status_solicitacao_dispensa_estudante = 2
AND sde.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_componente sdec ON
sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
AND sdec.id_componente_curricular = mc.id_componente_curricular
AND sdec.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu ON
sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
AND sdeu.unidade = 2
AND sdeu.ativo
LEFT JOIN ensino.solicitacao_dispensa_estudante_unidade sdeu_relatorio ON
sdeu_relatorio.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
AND sdeu_relatorio.unidade = 2
WHERE mc.ano = 2026
AND mc.id_situacao_matricula NOT IN ( 7, 3, 9, 4, 11 )
AND t.id_disciplina <> 220
AND t.tipo <> 4
AND t.ano = 2026
AND t.id_situacao_turma <> 4
AND ma.id_estudante IN (1388821)
AND mc.id_matricula_componente IN (20947081, 20947084, 20947082, 20947083);

SELECT * FROM ensino_infantil.relatorio_avaliativo_componente rac WHERE rac.id_relatorio_avaliativo = 150818;
-- rac.id_matricula_componente IN (20947081, 20947084, 20947082, 20947083);

SELECT rac -- ra.id_relatorio_avaliativo, rac.id_matricula_componente, rac.id_matricula_componente , base.id_matricula_componente
FROM matriculas_componentes_avaliacao_temp_1784051414523 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON ra.id_matricula_discente_serie = base.id_matricula_discente_serie
--AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON  rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
--AND rac.id_matricula_componente = base.id_matricula_componente
WHERE  base.id_matricula_componente IN (20947081, 20947084, 20947082, 20947083);

