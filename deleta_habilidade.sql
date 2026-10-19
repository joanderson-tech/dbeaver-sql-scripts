SELECT DISTINCT hr.*
--INTO TEMP insert_habilidade_resposta
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON
hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (4, 6)
AND ra.id_relatorio_avaliativo in (9347, 7206)
AND hr.periodo = 12;

SELECT
    'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta ' ||
    '(id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES (' ||
    id_relatorio_avaliativo_habilidade_resposta || ', ' ||
    id_relatorio_avaliativo_habilidade || ', ' ||
    COALESCE(id_opcao_grupo_avaliacao_relatorio::text, 'NULL') || ', ' ||
    periodo ||
    ');'
FROM insert_habilidade_resposta;

SELECT  'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta where id_relatorio_avaliativo_habilidade_resposta IN ( ' || string_agg(id_relatorio_avaliativo_habilidade_resposta::TEXT,',') || ');'
FROM insert_habilidade_resposta;


