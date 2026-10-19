SELECT * FROM ensino_infantil.configuracao_relatorio cr 
WHERE id_configuracao_relatorio = 12;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 52210466;


SELECT * -- string_agg(id_relatorio_avaliativo :: varchar , ', ') 
FROM ensino_infantil.relatorio_avaliativo cr WHERE id_configuracao_relatorio = 12;

SELECT p.nome FROM ensino_infantil.relatorio_avaliativo cr
JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = cr.id_matricula_discente_serie 
JOIN discente d ON d.id_discente = mes.id_estudante 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE id_configuracao_relatorio = 12;


-- Auto-generated SQL script #202509291618
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=FALSE WHERE id_relatorio_avaliativo IN (1926, 1927, 1928, 1929, 1930, 1931);
