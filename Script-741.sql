DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = 854;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = 73897;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = 292685;


begin;

DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta in (2199264, 2199261, 2199262, 2199263, 2199284, 2199281, 2199282, 2199283, 2199300, 2199297, 2199298, 2199299, 2199320, 2199317, 2199319, 2199318, 2200280, 2200277, 2200278, 2200279, 2200297, 2200298, 2200299, 2200300, 2200438, 2200440, 2200437, 2200439, 2200457, 2200459, 2200458, 2200460, 2200580, 2200579, 2200577, 2200578, 2200597, 2200598, 2200599, 2200600, 2202339, 2202340, 2202337, 2202338, 2202359, 2202360, 2202358, 2202357, 2202869, 2202870, 2202872, 2202871, 2202889, 2202890, 2202892, 2202891, 2203148, 2203147, 2203145, 2203146, 2203167, 2203168, 2203165, 2203166, 2204189, 2204192, 2204191, 2204190, 2204209, 2204212, 2204211, 2204210, 2204381, 2204384, 2204383, 2204382, 2204401, 2204404, 2204402, 2204403, 2204937, 2204940, 2204939, 2204938, 2204960, 2204957, 2204958, 2204959, 2204996, 2204994, 2204993, 2204995, 2205016, 2205014, 2205013, 2205015, 2205205, 2205206, 2205207, 2205208, 2205227, 2205225, 2205226, 2205228, 2205444, 2205442, 2205443, 2205441, 2205462, 2205463, 2205464, 2205461, 2600832, 2600829, 2600830, 2600831, 2600852, 2600849, 2600850, 2600851, 2695797, 2695798, 2695799, 2695800, 2695817, 2695818, 2695820, 2695819);
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade in (549816, 549821, 549825, 549830, 550070, 550075, 550110, 550115, 550145, 550150, 550585, 550590, 550718, 550723, 550787, 550792, 551048, 551053, 551096, 551101, 551235, 551240, 551249, 551254, 551302, 551307, 551361, 551366, 650208, 650213, 673950, 673955);

rollback;

Erro SQL [23503]: ERROR: update or delete on table "relatorio_avaliativo_habilidade" violates foreign key constraint "relatorio_avaliativo_habilidade_fk" on table "relatorio_avaliativo_habilidade_resposta"
  Detalhe: Key (id_relatorio_avaliativo_habilidade)=(2199261) is still referenced from table "relatorio_avaliativo_habilidade_resposta".


commit;

INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(549816, 58315, 1006);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(549821, 58315, 998);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(549825, 58316, 1035);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(549830, 58316, 1040);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550070, 58336, 1074);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550075, 58336, 1081);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550110, 58338, 1022);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550115, 58338, 1027);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550145, 58341, 1011);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550150, 58342, 1087);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550585, 58376, 247);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550590, 58376, 252);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550718, 58392, 1211);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550723, 58392, 1207);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550787, 58400, 258);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(550792, 58401, 271);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551048, 58423, 883);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551053, 58423, 888);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551096, 58425, 863);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551101, 58425, 868);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551235, 58437, 1041);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551240, 58438, 1096);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551249, 58439, 986);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551254, 58439, 995);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551302, 58440, 1068);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551307, 58440, 1069);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551361, 58447, 246);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(551366, 58447, 251);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(650208, 67124, 962);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(650213, 67124, 980);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(673950, 69040, 790);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(673955, 69040, 784);




INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199264, 549816, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199261, 549816, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199262, 549816, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199263, 549816, 33, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199284, 549821, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199281, 549821, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199282, 549821, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199283, 549821, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199300, 549825, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199297, 549825, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199298, 549825, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199299, 549825, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199320, 549830, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199317, 549830, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199319, 549830, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2199318, 549830, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200280, 550070, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200277, 550070, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200278, 550070, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200279, 550070, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200297, 550075, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200298, 550075, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200299, 550075, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200300, 550075, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200438, 550110, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200440, 550110, 34, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200437, 550110, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200439, 550110, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200457, 550115, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200459, 550115, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200458, 550115, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200460, 550115, 34, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200580, 550145, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200579, 550145, 34, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200577, 550145, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200578, 550145, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200597, 550150, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200598, 550150, 31, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200599, 550150, 31, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2200600, 550150, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202339, 550585, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202340, 550585, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202337, 550585, 26, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202338, 550585, 26, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202359, 550590, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202360, 550590, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202358, 550590, 26, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202357, 550590, 26, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202869, 550718, 31, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202870, 550718, 31, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202872, 550718, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202871, 550718, 31, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202889, 550723, 31, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202890, 550723, 31, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202892, 550723, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2202891, 550723, 31, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203148, 550787, 25, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203147, 550787, 25, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203145, 550787, 26, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203146, 550787, 26, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203167, 550792, 25, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203168, 550792, 25, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203165, 550792, 26, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2203166, 550792, 26, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204189, 551048, 41, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204192, 551048, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204191, 551048, 41, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204190, 551048, 41, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204209, 551053, 41, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204212, 551053, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204211, 551053, 41, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204210, 551053, 41, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204381, 551096, 41, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204384, 551096, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204383, 551096, 40, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204382, 551096, 41, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204401, 551101, 41, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204404, 551101, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204402, 551101, 41, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204403, 551101, 41, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204937, 551235, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204940, 551235, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204939, 551235, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204938, 551235, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204960, 551240, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204957, 551240, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204958, 551240, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204959, 551240, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204996, 551249, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204994, 551249, 33, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204993, 551249, 33, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2204995, 551249, 33, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205016, 551254, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205014, 551254, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205013, 551254, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205015, 551254, 34, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205205, 551302, 34, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205206, 551302, 34, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205207, 551302, 33, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205208, 551302, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205227, 551307, 32, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205225, 551307, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205226, 551307, 32, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205228, 551307, 32, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205444, 551361, 25, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205442, 551361, 26, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205443, 551361, 26, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205441, 551361, 26, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205462, 551366, 26, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205463, 551366, 26, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205464, 551366, 26, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2205461, 551366, 26, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600832, 650208, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600829, 650208, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600830, 650208, 31, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600831, 650208, 31, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600852, 650213, 31, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600849, 650213, 32, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600850, 650213, 31, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2600851, 650213, 31, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695797, 673950, 41, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695798, 673950, 41, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695799, 673950, 41, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695800, 673950, 41, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695817, 673955, 41, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695818, 673955, 41, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695820, 673955, 41, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(2695819, 673955, 41, 3);




with turma_serie as (
select
	id_turma_serie
from
	basico.turma_serie ts
join basico.serie s on
	s.id_serie = ts.id_serie
where
	ts.ano = 2025
	and s.id_serie <> 58413194
	and s.id_etapa_ensino <> 14
	and ts.id_escola = 61364023 ),
datas_calendario as (
select
	1 as bimestre,
	ce.inicio_bim_1 as inicio_bim,
	ce.fim_bim_1 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo
union
select
	2 as bimestre,
	ce.inicio_bim_2 as inicio_bim,
	ce.fim_bim_2 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo
union
select
	3 as bimestre,
	ce.inicio_bim_3 as inicio_bim,
	ce.fim_bim_3 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo
union
select
	4 as bimestre,
	ce.inicio_bim_4 as inicio_bim,
	ce.fim_bim_4 as fim_bim
from
	basico.calendario_escolar ce
where
	ce.ano = 2025
	and ativo ),
alocacoes_ativas as (
select
	dt.id_turma,
	dt.id_docente,
	dt.id_docente_turma,
	p.nome as professor
from
	ensino.docente_turma dt
join rh.servidor s on
	s.id_servidor = dt.id_docente
join comum.pessoa p on
	p.id_pessoa = s.id_pessoa
where
	dt.ativo
	and not dt.finalizada
	and dt.data_inicio <= current_date
	and current_date <= dt.data_fim ),
professor_turma as (
select
	t.id_turma,
	dt.id_turma as turma,
	dt.id_docente_turma as alocacao,
	dt_polivalente.id_turma as turma_polivalente,
	dt_polivalente.id_docente_turma as alocacao_polivalente,
	dt_multi.id_docente_turma as alocacao_multi,
	dt_multi.id_turma as turma_multi,
	dt_multi_polivalente.id_docente_turma as alocacao_multi_polivalente,
	dt_multi_polivalente.id_turma as turma_multi_polivalente,
	coalesce(dt.professor, dt_polivalente.professor, dt_multi.professor, dt_multi_polivalente.professor) as professor
from
	ensino.turma t
join basico.turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
left join ensino.turma t_multi on
	t_multi.id_turma_serie = ts.id_turma_serie_agrupadora
	and t_multi.id_disciplina = t.id_disciplina
left join alocacoes_ativas dt on
	dt.id_turma = t.id_turma
left join alocacoes_ativas dt_polivalente on
	dt_polivalente.id_turma = t.id_turma_agrupadora
left join alocacoes_ativas dt_multi on
	dt_multi.id_turma = t_multi.id_turma
left join alocacoes_ativas dt_multi_polivalente on
	dt_multi_polivalente.id_turma = t_multi.id_turma_agrupadora
where
	t.id_situacao_turma <> 4
	and t.ano = 2025 ),
notas as (
select
	mc.id_turma as turma,
	nu.nota as nota
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
join turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join basico.matricula_estudante_serie mes on
	mes.id_estudante = mc.id_discente
	and coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie) = t.id_turma_serie
left join ensino.nota_unidade nu on
	nu.id_matricula_componente = mc.id_matricula_componente
		and nu.ativo
		and nu.id_descricao_nota = 21
		and nu.unidade = 2
	left join ensino.solicitacao_dispensa_estudante sde on
		sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		and sde.id_status_solicitacao_dispensa_estudante = 2
		and sde.ativo
	left join ensino.solicitacao_dispensa_estudante_componente sdec on
		sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
		and sdec.id_componente_curricular = mc.id_componente_curricular
		and sdec.ativo
	left join ensino.solicitacao_dispensa_estudante_unidade sdeu on
		sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
		and sdeu.unidade = 2
		and sdeu.ativo
	where
		true
		and mc.ano = 2025
		and mc.id_situacao_matricula not in ( 7, 3, 9, 4, 11 )
			and t.id_disciplina <> 220
			and t.tipo <> 4
			and t.ano = 2025
			and t.id_situacao_turma <> 4
			and mes.ano_calendario = 2025
			and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
				and coalesce(mes.data_matricula_turma, mes.data_cadastro) <= (
				select
					distinct fim_bim
				from
					datas_calendario
				where
					bimestre = 2)
				and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
					and (sde.id_solicitacao_dispensa_estudante is null
						or sdec.id_solicitacao_dispensa_estudante_componente is null
						or sdeu.id_solicitacao_dispensa_estudante_unidade is null)),
relatorios_avaliativos as (
select
	mc.id_turma as turma,
	rahr.id_opcao_grupo_avaliacao_relatorio as resposta
from
	ensino.matricula_componente mc
join ensino.turma t on
	t.id_turma = mc.id_turma
join turma_serie ts on
	ts.id_turma_serie = t.id_turma_serie
join basico.matricula_estudante_serie mes on
	mes.id_estudante = mc.id_discente
	and coalesce(mes.id_turma_serie_multisseriado, mes.id_turma_serie) = t.id_turma_serie
left join ensino_infantil.relatorio_avaliativo_componente rac on
	rac.id_matricula_componente = mc.id_matricula_componente
left join ensino_infantil.relatorio_avaliativo ra on
	ra.id_relatorio_avaliativo = rac.id_relatorio_avaliativo
left join ensino_infantil.relatorio_avaliativo_habilidade rah on
	rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
left join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on
	rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
		and rahr.periodo = 2
	left join ensino.solicitacao_dispensa_estudante sde on
		sde.id_matricula_estudante_serie = mes.id_matricula_discente_serie
		and sde.id_status_solicitacao_dispensa_estudante = 2
		and sde.ativo
	left join ensino.solicitacao_dispensa_estudante_componente sdec on
		sdec.id_solicitacao_dispensa_estudante = sde.id_solicitacao_dispensa_estudante
		and sdec.id_componente_curricular = mc.id_componente_curricular
		and sdec.ativo
	left join ensino.solicitacao_dispensa_estudante_unidade sdeu on
		sdeu.id_solicitacao_dispensa_estudante_componente = sdec.id_solicitacao_dispensa_estudante_componente
		and sdeu.unidade = 2
		and sdeu.ativo
	where
		true
		and mc.ano = 2025
		and ra.ativo
		and mc.id_situacao_matricula not in ( 7, 3, 9, 4, 11 )
			and t.id_disciplina <> 220
			and t.tipo <> 4
			and t.ano = 2025
			and t.id_situacao_turma <> 4
			and mes.ano_calendario = 2025
			and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
				and coalesce(mes.data_matricula_turma, mes.data_cadastro) <= (
				select
					distinct fim_bim
				from
					datas_calendario
				where
					bimestre = 2)
				and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 )
					and (sde.id_solicitacao_dispensa_estudante is null
						or sdec.id_solicitacao_dispensa_estudante_componente is null
						or sdeu.id_solicitacao_dispensa_estudante_unidade is null)),
levantamento_turmas as (
select
	e.codigo_inep as codigo,
	e.nome as escola,
	ee.denominacao as curso,
	s.descricao as serie,
	ts.nome as turma,
	pt.professor,
	case
		when (2 = 1
			and 2025 = 2023
			and e.id_escola in (53279324, 52927029))
			or ee.id_etapa_ensino in (51876105, 51876110, 51876139) then 'concluído'
			when ts.tipo_diario = 11
				or turma.id_disciplina = 220 then 'turma agrupadora'
				when (case
					when cbc.id_categoria_componente = 2
						and cb.possui_parte_diversificada then cb.tipo_diario_diversificado
						else cb.tipo_diario
					end) in (51, 52, 53) then (
				select
					case
						when coalesce(every(nota is not null), true) then 'concluído'
						else 'pendente'
					end as situacao
				from
					notas n
				where
					n.turma = turma.id_turma )
				when (case
					when cbc.id_categoria_componente = 2
						and cb.possui_parte_diversificada then cb.tipo_diario_diversificado
						else cb.tipo_diario
					end) in (54) then (
				select
					case
						when coalesce(every(resposta is not null), true) then 'concluído'
						else 'pendente'
					end as situacao
				from
					relatorios_avaliativos r
				where
					r.turma = turma.id_turma )
			end as apontamento_desempenho_concluido,
			ts.id_turno,
			turma.id_disciplina,
			ts.id_turma_serie,
			e.id_escola
		from
			escola.escola e
		join basico.turma_serie ts on
			ts.id_escola = e.id_escola
		join ensino.turma turma on
			turma.id_turma_serie = ts.id_turma_serie
		join professor_turma pt on
			pt.id_turma = turma.id_turma
			and pt.professor is not null
		join basico.serie s on
			s.id_serie = ts.id_serie
		join basico.etapa_ensino ee on
			ee.id_etapa_ensino = s.id_etapa_ensino
		join basico.curriculo_basico cb on
			cb.id_curriculo_basico = ts.id_curriculo_medio
		join basico.curriculo_basico_componente cbc on
			cbc.id_curriculo_basico = cb.id_curriculo_basico
			and cbc.id_componente_curricular = turma.id_disciplina
		where
			ts.ativo
			and ts.id_tipo_turma_serie <> 3
			and ts.ano = 2025
			and turma.id_situacao_turma <> 4
			and turma.id_disciplina <> 220 )
select
	distinct lt.codigo,
	lt.escola,
	lt.curso,
	lt.serie,
	lt.turma,
	t.descricao as turno,
	cc.nome as componente_curricular,
	lt.professor,
	2 || ' bim' as apontamento,
	lt.apontamento_desempenho_concluido,
	'' as monitoramento_conteudos,
	'' as situacao_didatica,
	'' as aprovacao_professor,
	'' as aprovacao_coordenador,
	'' as aprovacao_gestor
from
	levantamento_turmas lt
join ensino.turno t on
	t.id_turno = lt.id_turno
join ensino.componente_curricular cc on
	cc.id_componente_curricular = lt.id_disciplina
where
	true
	and lt.apontamento_desempenho_concluido <> 'concluído'
	and exists (
	select
		1
	from
		basico.matricula_estudante_serie mes
	where
		(mes.id_turma_serie = lt.id_turma_serie
			or mes.id_turma_serie_multisseriado = lt.id_turma_serie)
		and mes.ano_calendario = 2025
		and mes.id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 ))
	and lt.id_escola = 61364023
order by
	lt.escola,
	lt.turma,
	lt.curso,
	lt.serie,
	cc.nome; 
