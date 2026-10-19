

begin;

rollback;

---SOLUCAO


DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta in (2026, 2027, 2028, 2025, 2214, 2215, 2216, 2213, 2402, 2403, 2404, 2401, 2590, 2591, 2592, 2589, 2778, 2779, 2780, 2777, 2966, 2967, 2968, 2965, 3154, 3155, 3156, 3153, 3342, 3343, 3344, 3341, 3530, 3531, 3532, 3529);

DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade in (507, 554, 601, 648, 695, 742, 789, 836, 883);

DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade=251;


commit;



--BACKUP

INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES(251, 43, 51870142, true);

INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(507, 83, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(554, 92, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(601, 101, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(648, 110, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(695, 119, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(742, 128, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(789, 137, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(836, 146, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(883, 155, 251);


INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2026, 507, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2027, 507, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2028, 507, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2025, 507, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2214, 554, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2215, 554, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2216, 554, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2213, 554, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2402, 601, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2403, 601, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2404, 601, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2401, 601, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2590, 648, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2591, 648, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2592, 648, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2589, 648, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2778, 695, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2779, 695, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2780, 695, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2777, 695, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2966, 742, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2967, 742, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2968, 742, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2965, 742, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3154, 789, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3155, 789, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3156, 789, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3153, 789, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3342, 836, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3343, 836, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3344, 836, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3341, 836, 21, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3530, 883, NULL, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3531, 883, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3532, 883, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(3529, 883, 21, 1);
