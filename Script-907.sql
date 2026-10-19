select id_municipio, * from escola.escola e ;

select * from ensino_infantil.opcao_grupo_avaliacao_relatorio ogar 

INSERT INTO ensino_infantil.opcao_grupo_avaliacao_relatorio (id_opcao_grupo_avaliacao_relatorio, descricao, sigla, ordem, ativo, id_grupo_avaliacao_relatorio) VALUES(nextval('ensino_infantil.opcao_grupo_avaliacao_relatorio_seq'), 'NÃO TRABALHADO', 'NT', 4, true, 6);

DELETE FROM ensino_infantil.opcao_grupo_avaliacao_relatorio WHERE id_opcao_grupo_avaliacao_relatorio= select * from nsino_infantil.opcao_grupo_avaliacao_relatorio r where r.id_grupo_avaliacao_relatorio = 6 and r.descricao = 'NÃO TRABALHADO';


DELETE FROM ensino_infantil.opcao_grupo_avaliacao_relatorio WHERE id_grupo_avaliacao_relatorio = 6 AND descricao = 'NÃO TRABALHADO';