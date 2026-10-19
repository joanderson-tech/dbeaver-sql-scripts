begin;

update ensino_infantil.configuracao_relatorio_componente_habilidade set id_habilidade_competencia=464 where id_configuracao_relatorio_componente_habilidade in (145, 274);
update ensino_infantil.configuracao_relatorio_componente_habilidade set ativo=false where id_configuracao_relatorio_componente_habilidade in (146, 275);

commit;