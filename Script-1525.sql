begin;

UPDATE ensino_infantil.configuracao_relatorio_componente SET possui_parecer_final_descritivo=true,possui_parecer_final_fixo=true WHERE id_configuracao_relatorio_componente in (515, 516, 506, 507);


COMMIT;