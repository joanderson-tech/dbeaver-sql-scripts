SELECT cb.id_curriculo_basico ,s.descricao, cb.codigo
FROM basico.curriculo_basico cb
JOIN basico.serie s ON s.id_serie = cb.id_serie
WHERE cb.ano_entrada_vigor = 2025 
AND cb.id_turno = 1
AND s.descricao ILIKE '%NÍVEL%'
ORDER BY descricao;



SELECT * FROM basico.serie WHERE descricao ILIKE '%NÍVEL%'


SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico IN (53140828,53140733,53140859,53140870,53140904) AND cr.ativo;


BEGIN;
-- Auto-generated SQL script #202510060957
UPDATE ensino_infantil.configuracao_relatorio SET ativo=FALSE WHERE id_configuracao_relatorio IN (42,43,44,45,46);


UPDATE ensino_infantil.configuracao_relatorio SET ativo=TRUE WHERE id_configuracao_relatorio IN (42,43,44,45,46);

ROLLBACK ;