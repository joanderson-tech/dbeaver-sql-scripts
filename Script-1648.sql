SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.codigo = 'AI3INT';

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente crc 
WHERE crc.id_configuracao_relatorio = 42;


SELECT * FROM ensino.turma t 
WHERE t.id_turma_serie = 51881107;

UPDATE ensino_infantil.configuracao_relatorio	SET ativo=false	WHERE id_configuracao_relatorio=42;
UPDATE ensino_infantil.configuracao_relatorio_componente 	SET ativo=false	WHERE id_configuracao_relatorio_componente IN (83,84,85,86,87,88,89,90,91);

83,84,85,86,87,88,89,90,91