BEGIN 

DELETE
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (SELECT id_configuracao_relatorio
FROM ensino_infantil.configuracao_relatorio
WHERE id_curriculo_basico = 51899742)
AND id_componente_curricular <> 293;

SELECT id_configuracao_relatorio
FROM ensino_infantil.configuracao_relatorio
WHERE id_curriculo_basico = 51899742;
AND id_componente_curricular <> 293;


COMMIT;

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(2, 1, 506, 1, 9999, true, NULL, NULL, '2026-06-29 09:37:40.511', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(3, 1, 507, 1, 9999, true, NULL, NULL, '2026-06-29 09:37:40.511', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(4, 1, 508, 1, 9999, true, NULL, NULL, '2026-06-29 09:37:40.511', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(5, 1, 509, 1, 9999, true, NULL, NULL, '2026-06-29 09:37:40.511', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(6, 1, 510, 1, 9999, true, NULL, NULL, '2026-06-29 09:37:40.511', NULL, false, false);

