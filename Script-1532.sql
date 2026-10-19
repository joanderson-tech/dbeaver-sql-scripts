begin;
--solucao
UPDATE ensino_infantil.configuracao_relatorio SET possui_parecer_descritivo=false WHERE id_configuracao_relatorio in (7, 8, 9);


COMMIT;