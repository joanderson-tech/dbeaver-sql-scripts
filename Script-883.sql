--Solução
UPDATE basico.curriculo_basico SET tipo_diario=31 WHERE id_curriculo_basico in (51880803,51881158,35497185,51880539);
UPDATE basico.turma_serie SET tipo_diario=31 WHERE id_turma_serie in (51882083, 51881578, 51881579, 51882829, 51882085, 51882086, 51889641, 51889642);


--backup
UPDATE basico.curriculo_basico SET tipo_diario=35 WHERE id_curriculo_basico in (51880803,51881158,35497185,51880539)
UPDATE basico.turma_serie SET tipo_diario=35 WHERE id_turma_serie in (51882083, 51881578, 51881579, 51882829, 51882085, 51882086, 51889641, 51889642);


select * from basico.turma_serie ts where ts.id_curriculo_medio  in (51880803,51881158,35497185,51880539)  and ativo;

select * from ensino_infantil.relatorio_avaliativo_componente cbb where cbb.id_relatorio_avaliativo = 7;

select * from ensino_infantil.configuracao_relatorio_componente;

SELECT cr.* FROM ensino_infantil.configuracao_relatorio AS cr where cr.id_configuracao_relatorio = 7; 51880803 , 51880803

select string_agg(id_relatorio_avaliativo_habilidade:: varchar , ', ')  from ensino_infantil.relatorio_avaliativo_habilidade where id_relatorio_avaliativo_componente in (34,31,35,32,33);

select *
from ensino_infantil.relatorio_avaliativo_habilidade_resposta where id_relatorio_avaliativo_habilidade in (193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224)




begin;
rollback;

commit;

INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, parecer_final_fixo, parecer_final_descritivo) VALUES(34, 7, 17001921, 14, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, parecer_final_fixo, parecer_final_descritivo) VALUES(31, 7, 17001940, 15, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, parecer_final_fixo, parecer_final_descritivo) VALUES(35, 7, 17001959, 16, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, parecer_final_fixo, parecer_final_descritivo) VALUES(32, 7, 17001978, 17, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, avaliacao_descritiva, id_situacao_relatorio_avaliativo_componente, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, avaliacao_descritiva_2, avaliacao_descritiva_3, avaliacao_descritiva_4, parecer_final_fixo, parecer_final_descritivo) VALUES(33, 7, 17001997, 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);




INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(193, 31, 82);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(194, 31, 83);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(195, 31, 84);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(196, 31, 85);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(197, 31, 81);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(198, 32, 89);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(199, 32, 90);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(200, 32, 91);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(201, 32, 93);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(202, 32, 92);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(203, 32, 94);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(204, 32, 95);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(205, 32, 96);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(206, 32, 97);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(207, 33, 98);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(208, 33, 99);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(209, 33, 100);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(210, 33, 101);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(211, 33, 102);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(212, 33, 103);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(213, 33, 104);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(214, 33, 105);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(215, 34, 74);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(216, 34, 80);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(217, 34, 75);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(218, 34, 76);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(219, 34, 77);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(220, 34, 78);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(221, 34, 79);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(222, 35, 86);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(223, 35, 87);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES(224, 35, 88);




INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(769, 193, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(770, 193, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(771, 193, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(772, 193, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(773, 194, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(774, 194, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(775, 194, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(776, 194, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(777, 195, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(778, 195, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(779, 195, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(780, 195, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(781, 196, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(782, 196, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(783, 196, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(784, 196, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(785, 197, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(786, 197, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(787, 197, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(788, 197, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(789, 198, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(790, 198, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(791, 198, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(792, 198, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(793, 199, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(794, 199, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(795, 199, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(796, 199, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(797, 200, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(798, 200, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(799, 200, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(800, 200, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(801, 201, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(802, 201, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(803, 201, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(804, 201, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(805, 202, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(806, 202, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(807, 202, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(808, 202, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(809, 203, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(810, 203, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(811, 203, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(812, 203, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(813, 204, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(814, 204, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(815, 204, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(816, 204, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(817, 205, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(818, 205, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(819, 205, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(820, 205, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(821, 206, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(822, 206, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(823, 206, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(824, 206, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(825, 207, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(826, 207, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(827, 207, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(828, 207, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(829, 208, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(830, 208, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(831, 208, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(832, 208, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(833, 209, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(834, 209, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(835, 209, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(836, 209, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(837, 210, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(838, 210, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(839, 210, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(840, 210, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(841, 211, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(842, 211, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(843, 211, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(844, 211, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(845, 212, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(846, 212, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(847, 212, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(848, 212, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(849, 213, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(850, 213, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(851, 213, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(852, 213, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(853, 214, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(854, 214, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(855, 214, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(856, 214, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(857, 215, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(858, 215, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(859, 215, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(860, 215, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(861, 216, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(862, 216, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(863, 216, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(864, 216, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(865, 217, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(866, 217, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(867, 217, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(868, 217, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(869, 218, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(870, 218, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(871, 218, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(872, 218, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(873, 219, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(874, 219, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(875, 219, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(876, 219, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(877, 220, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(878, 220, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(879, 220, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(880, 220, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(881, 221, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(882, 221, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(883, 221, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(884, 221, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(885, 222, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(886, 222, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(887, 222, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(888, 222, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(889, 223, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(890, 223, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(891, 223, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(892, 223, NULL, 4);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(893, 224, 17, 1);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(894, 224, 18, 2);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(895, 224, NULL, 3);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES(896, 224, NULL, 4);
