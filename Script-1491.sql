SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_configuracao_relatorio IN (1,2,3,4,5,6,10,13,14);


-- Auto-generated SQL script #202512051012
UPDATE ensino_infantil.configuracao_relatorio	SET possui_parecer_descritivo=FALSE WHERE id_configuracao_relatorio IN (1,2,3,4,5,6,10,13,14);


UPDATE ensino_infantil.configuracao_relatorio	SET possui_parecer_descritivo=TRUE WHERE id_configuracao_relatorio IN (1,2,3,4,5,6,10,13,14);


