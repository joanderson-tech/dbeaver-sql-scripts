SELECT base.* FROM matriculas_componentes_avaliacao_temp_1784051414523 base
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
WHERE base.id_matricula_discente_serie IN (1655363, 1650714);


SELECT * FROM ensino.matricula_componente mc WHERE  mc.id_matricula_componente IN (20940482, 20940482, 20940482, 20940482, 20940482, 20940482, 20940482, 20940482, 20940482, 20940479, 20940479, 20940479, 20940479, 20940479, 20940479, 20940479, 20940479, 20940479, 20940480, 20940480, 20940480, 20940480, 20940480, 20940480, 20940480, 20940480, 20940481, 20940481, 20940481, 20940481, 20940481, 20940481, 20940481, 20940481, 20940481)
