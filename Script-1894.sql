SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo = 'AI1INT'

SELECT CB.codigo, cb.ano_entrada_vigor, cb.ativo 
FROM basico.curriculo_basico cb
WHERE cb.ano_entrada_vigor  = 2025
AND cb.ativo  = FALSE;


-- Auto-generated SQL script #202603021728
UPDATE ensino_infantil.configuracao_relatorio
	SET ativo=true
	WHERE id_configuracao_relatorio=9;

