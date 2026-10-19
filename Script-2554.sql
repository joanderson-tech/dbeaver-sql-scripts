SELECT 
    base.id_matricula_discente_serie, 
    base.componente, 
    base.categoria,
    base.id_solicitacao_dispensa_estudante, 
base.id_solicitacao_dispensa_estudante_componente, base.id_dispensa_unidade_relatorio,
    -- Aqui vemos o resultado individual de cada avaliação/habilidade:
    CASE 
        WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN 'OK (Tipo 2)'
        WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN 'OK (Tipo 1)'
        ELSE 'PENDENTE' 
    END AS avaliacao_individual,
    -- Trazemos também os IDs para ver o que está vazio
    crc.id_tipo_avaliacao_componente_relatorio,
    rahr.id_opcao_grupo_avaliacao_relatorio,
    rac.avaliacao_descritiva 
FROM matriculas_componentes_avaliacao_temp_1784051414523 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
    ra.id_matricula_discente_serie = base.id_matricula_discente_serie AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
    rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo AND rac.id_matricula_componente = base.id_matricula_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
    rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
    rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
    crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE (base.tipo_diario IN (54) OR (base.tipo_diario IN (51, 52, 53) AND base.tipo_diario_diversificado IS NOT NULL AND base.categoria = 2))
  AND (base.id_solicitacao_dispensa_estudante IS NULL OR base.id_solicitacao_dispensa_estudante_componente IS NULL OR base.id_dispensa_unidade_relatorio IS NULL)
  AND base.id_matricula_discente_serie IN (1655363);
  
  
  
  
  -- Auto-generated SQL script #202607141859
UPDATE ensino_infantil.relatorio_avaliativo_componente
    SET avaliacao_descritiva = NULL,
    parecer_final_descritivo = null
    WHERE id_relatorio_avaliativo_componente IN (926525, 926525, 926525, 926525, 926525, 926525, 926525, 926525, 926526, 926526, 926526, 926526, 926526, 926526, 926526, 926526, 926526, 926524, 926524, 926524, 926524, 926524, 926524, 926524, 926524, 926524, 926527, 926527, 926527, 926527, 926527, 926527, 926527, 926527, 926527);

  UPDATE ensino_infantil.relatorio_avaliativo_componente
SET avaliacao_descritiva = 'Durante este período letivo, o(a) estudante demonstrou um excelente desenvolvimento nas atividades propostas. No aspeto socioemocional, revelou-se participativo(a), colaborando ativamente com os colegas e respeitando as regras de convivência do grupo. Demonstra segurança ao expressar as suas ideias e sentimentos. No desenvolvimento cognitivo e motor, apresenta boa coordenação motora fina nas atividades de desenho e escrita, além de demonstrar raciocínio lógico em evolução através de jogos de associação.',
parecer_final_descritivo = 'Durante este período letivo, o(a) estudante demonstrou um excelente desenvolvimento nas atividades propostas. No aspeto socioemocional, revelou-se participativo(a), colaborando ativamente com os colegas e respeitando as regras de convivência do grupo. Demonstra segurança ao expressar as suas ideias e sentimentos. No desenvolvimento cognitivo e motor, apresenta boa coordenação motora fina nas atividades de desenho e escrita, além de demonstrar raciocínio lógico em evolução através de jogos de associação.'
WHERE id_relatorio_avaliativo_componente IN (926524, 926525, 926526, 926527);
  
  SELECT * FROM  ensino_infantil.relatorio_avaliativo_componente
    WHERE id_relatorio_avaliativo_componente IN (926525, 926525, 926525, 926525, 926525, 926525, 926525, 926525, 926526, 926526, 926526, 926526, 926526, 926526, 926526, 926526, 926526, 926524, 926524, 926524, 926524, 926524, 926524, 926524, 926524, 926524, 926527, 926527, 926527, 926527, 926527, 926527, 926527, 926527, 926527);

  
SELECT rac.* FROM  ensino_infantil.relatorio_avaliativo ra 
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE ra.id_matricula_discente_serie IN (1655363);


SELECT 
    base.componente,
    rah.id_relatorio_avaliativo_habilidade AS id_habilidade,
    crc.id_tipo_avaliacao_componente_relatorio AS tipo_relatorio,
    rahr.id_opcao_grupo_avaliacao_relatorio AS resposta_opcao,
    rac.avaliacao_descritiva,
    -- Validação idêntica à tua:
    CASE 
        WHEN crc.id_tipo_avaliacao_componente_relatorio = 2 AND rahr.id_opcao_grupo_avaliacao_relatorio IS NOT NULL THEN 'TRUE (OK)'
        WHEN crc.id_tipo_avaliacao_componente_relatorio = 1 AND (rac.avaliacao_descritiva <> '' AND rac.avaliacao_descritiva IS NOT NULL) THEN 'TRUE (OK)'
        ELSE 'FALSE (PENDENTE)' 
    END AS status_da_linha
FROM matriculas_componentes_avaliacao_temp_1784051414523 base
LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON
    ra.id_matricula_discente_serie = base.id_matricula_discente_serie AND ra.ativo
LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
    rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo AND rac.id_matricula_componente = base.id_matricula_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
    rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON
    rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade AND rahr.periodo = 2
LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON
    crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE base.id_matricula_discente_serie = 1655363;


