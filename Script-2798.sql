SELECT DISTINCT crch.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
WHERE crc.id_configuracao_relatorio IN (1,5,6,4)
AND crc.ativo ;


--DESATIVA AS HABILIDADE ANTIGA 
SELECT COUNT(crch.id_configuracao_relatorio_componente_habilidade) AS quantidade_registros, 
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=true  WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
WHERE crc.id_configuracao_relatorio IN (5,6,1,4);



-- Auto-generated SQL script #202610051012
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS solucao,

'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4  WHERE id_relatorio_avaliativo IN ( '|| string_agg(crch.id_relatorio_avaliativo::TEXT, ', ') || ');' AS solucao,


SELECT COUNT(ra.id_relatorio_avaliativo) AS quantidade_registros, 
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4  WHERE id_relatorio_avaliativo IN ( '|| string_agg(ra.id_relatorio_avaliativo::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo= '|ra.ativo|' , id_situacao_relatorio_avaliativo= '|ra.id_situacao_relatorio_avaliativo|'  WHERE id_relatorio_avaliativo IN ( '|| string_agg(ra.id_relatorio_avaliativo::TEXT, ', ') || ');' AS baclup
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (1,5,6,4);




SELECT 
    COUNT(DISTINCT ra.id_relatorio_avaliativo) AS quantidade_registros,
    'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo IN (' || string_agg(DISTINCT ra.id_relatorio_avaliativo::TEXT, ', ')  || ');' AS solucao,
    'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=' || ra.ativo::TEXT || ', id_situacao_relatorio_avaliativo=' || ra.id_situacao_relatorio_avaliativo::TEXT || ' WHERE id_relatorio_avaliativo IN (' || string_agg(DISTINCT ra.id_relatorio_avaliativo::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (1, 5, 6, 4)
GROUP BY ra.ativo, ra.id_situacao_relatorio_avaliativo;