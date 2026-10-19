SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET id_configuracao_relatorio = 77 WHERE id_relatorio_avaliativo = ' || ra.id_relatorio_avaliativo || ';' AS SOLUÇÃO,
'UPDATE ensino_infantil.relatorio_avaliativo SET id_configuracao_relatorio = 64 WHERE id_relatorio_avaliativo = ' || ra.id_relatorio_avaliativo || ';' AS BACKUP
FROM ensino_infantil.relatorio_avaliativo ra
WHERE ra.id_configuracao_relatorio IN (64)
AND ra.ativo;