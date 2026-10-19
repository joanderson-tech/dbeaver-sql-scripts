SELECT DISTINCT hr.*
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON
hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (4)
AND ra.id_relatorio_avaliativo = 9347;


SELECT DISTINCT hr.*
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON
hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (4)
AND ra.id_relatorio_avaliativo = 8954
