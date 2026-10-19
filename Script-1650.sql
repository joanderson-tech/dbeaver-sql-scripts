BEGIN;

UPDATE ensino_infantil.configuracao_relatorio	SET ativo=false	WHERE id_configuracao_relatorio=42;
UPDATE ensino_infantil.configuracao_relatorio_componente 	SET ativo=false	WHERE id_configuracao_relatorio_componente IN (83,84,85,86,87,88,89,90,91);

COMMIT;