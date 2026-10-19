SELECT base.id_matricula_discente_serie, base.componente, base.categoria,     
    CASE WHEN EVERY(CASE        
        WHEN crc.id_tipo_avaliacao_componente_relatorio IS NULL THEN
            CASE 
                WHEN 2 = 4 THEN FALSE 
                WHEN 2 IN (1, 2, 3) THEN TRUE 
                ELSE FALSE
            END
        WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN TRUE        
        WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 THEN
            CASE 
                WHEN 2 = 4 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN TRUE
                WHEN 2 IN (1, 2, 3) THEN TRUE
                ELSE FALSE
            END
        ELSE FALSE 
    END) THEN 'concluído' ELSE 'pendente' END AS apontamento  
--INTO lev_relatorios_avaliacao_temp_1784051414523 
FROM matriculas_componentes_avaliacao_temp_1784051414523 base  
LEFT JOIN ensino_infantil.relatorio_avaliativo ra     
    ON ra.id_matricula_discente_serie = base.id_matricula_discente_serie AND ra.ativo  
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac     
    ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo     
    AND rac.id_matricula_componente = base.id_matricula_componente  
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah 
    ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente  
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr     
    ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade     
    AND rahr.periodo = 2  -- <<< Bimestre analisado atualmente
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc 
    ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente  
WHERE (base.tipo_diario IN (54)     
    OR (base.tipo_diario IN (51, 52, 53) AND base.tipo_diario_diversificado IS NOT NULL        
        AND base.categoria = 2))     
    AND (base.id_solicitacao_dispensa_estudante IS NULL        
        OR base.id_solicitacao_dispensa_estudante_componente IS NULL        
        OR base.id_dispensa_unidade_relatorio IS NULL)  
        AND base.id_matricula_discente_serie IN (1655363, 1650714)
GROUP BY base.id_matricula_discente_serie, base.componente, base.categoria;
