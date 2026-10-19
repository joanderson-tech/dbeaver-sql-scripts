BEGIN;

DELETE FROM ensino_infantil.opcao_grupo_avaliacao_relatorio
WHERE id_opcao_grupo_avaliacao_relatorio IN (17, 21);
UPDATE ensino_infantil.opcao_grupo_avaliacao_relatorio
SET descricao = 'PROCESSO EM DESENVOLVIMENTO', sigla = 'PD', ordem = 0
WHERE id_opcao_grupo_avaliacao_relatorio IN (18, 22);
UPDATE ensino_infantil.opcao_grupo_avaliacao_relatorio
SET ordem = 1
WHERE id_opcao_grupo_avaliacao_relatorio IN (19, 23);
UPDATE ensino_infantil.opcao_grupo_avaliacao_relatorio
SET ordem = 2
WHERE id_opcao_grupo_avaliacao_relatorio IN (20, 24);
COMMIT;