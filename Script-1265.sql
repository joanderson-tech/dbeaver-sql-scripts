SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico IN (53140828,53140733,53140859,53140870,53140904) AND cr.ativo;


BEGIN;
-- Auto-generated SQL script #202510060957
UPDATE ensino_infantil.configuracao_relatorio SET ativo=FALSE WHERE id_configuracao_relatorio IN (42,43,44,45,46);


UPDATE ensino_infantil.configuracao_relatorio SET ativo=TRUE WHERE id_configuracao_relatorio IN (42,43,44,45,46);

ROLLBACK ;

COMMIT;