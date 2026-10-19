SELECT hr.*, ra.id_relatorio_avaliativo
--INTO TEMP insert_habilidade_resposta
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON
hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (4, 6)
AND ra.id_relatorio_avaliativo in ( 7206)
AND hr.periodo = 12
ORDER BY ra.id_relatorio_avaliativo;