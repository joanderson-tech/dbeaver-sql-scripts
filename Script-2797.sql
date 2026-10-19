--DESATIVA AS HABILIDADE ANTIGA 
SELECT COUNT(crch.id_configuracao_relatorio_componente_habilidade) AS quantidade_registros, 
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=true  WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
WHERE crc.id_configuracao_relatorio IN (5,6,1,4);