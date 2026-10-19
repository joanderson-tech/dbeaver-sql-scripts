select * from ensino_infantil.configuracao_relatorio cr where cr.id_configuracao_relatorio = 7;
select * from ensino_infantil.configuracao_relatorio_componente crc where crc.id_configuracao_relatorio = 7;

begin;

DELETE FROM ensino_infantil.configuracao_relatorio_componente WHERE id_configuracao_relatorio_componente in (35,36,37,38,39);
DELETE FROM ensino_infantil.configuracao_relatorio WHERE id_configuracao_relatorio=7;

commit;

INSERT INTO ensino_infantil.configuracao_relatorio (id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo) VALUES(7, 51880803, 4, 6, true, 'AI1_INT', 5622651, NULL, '2025-05-16 18:07:10.766', NULL, false);

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(35, 7, 518, 1, 9999, true, 5622651, NULL, '2025-05-16 18:07:10.765', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(36, 7, 517, 1, 9999, true, 5622651, NULL, '2025-05-16 18:07:10.765', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(37, 7, 515, 1, 9999, true, 5622651, NULL, '2025-05-16 18:07:10.765', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(38, 7, 471, 1, 9999, true, 5622651, NULL, '2025-05-16 18:07:10.765', NULL, false, false);
INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES(39, 7, 516, 1, 9999, true, 5622651, NULL, '2025-05-16 18:07:10.765', NULL, false, false);

