SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.codigo ILIKE 'AI4';
-- 5    51880535

SELECT *
FROM ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ;

BEGIN;

-- Cria uma tabela temporária para armazenar os registros gerados
CREATE TEMP TABLE tmp_opcao_grupo_avaliacao_relatorio AS
SELECT nextval('ensino_infantil.opcao_grupo_avaliacao_relatorio_seq') AS id_opcao_grupo_avaliacao_relatorio, descricao, sigla, ordem, TRUE AS ativo, 5 AS id_grupo_avaliacao_relatorio
FROM(
VALUES
        ('NÃO TRABALHADO', 'NT', 1),('EM CONSTRUÇÃO', 'EC', 2),('CONSTRUÍDO', 'C', 3)
) AS t(descricao, sigla, ordem);

--backup
SELECT 'DELETE FROM ensino_infantil.opcao_grupo_avaliacao_relatorio WHERE id_opcao_grupo_avaliacao_relatorio = ' || id_opcao_grupo_avaliacao_relatorio || ';'
FROM tmp_opcao_grupo_avaliacao_relatorio;

-- Agora, você pode inserir na tabela real usando os dados temporários
INSERT INTO ensino_infantil.opcao_grupo_avaliacao_relatorio
SELECT *
FROM tmp_opcao_grupo_avaliacao_relatorio;

COMMIT ;

ROLLBACK;

