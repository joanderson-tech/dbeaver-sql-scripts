
BEGIN;

--1º Patrícia Silva Santos 
UPDATE ava.aula_extra SET id_servidor=54387259 WHERE id=53982091;
UPDATE ensino.docente_turma	SET id_docente=54387259 WHERE id_docente_turma in (51980255,52873785,53941880);
UPDATE pessoas.historico_servidor_terceirizado SET id_servidor=54387259 WHERE id_historico_servidor_terceirizado in (54492313,54492315);

DELETE FROM rh.servidor WHERE id_servidor=1734;

--2º Maria da Conceição Santos Araújo da Silva 
UPDATE ensino.docente_turma SET id_docente=54389192 WHERE id_docente_turma=51927806;
UPDATE rh.historico_transferencia_servidores SET id_servidor=54389192 WHERE id_historico_transferencia_servidor=52420900;
DELETE FROM rh.servidor WHERE id_servidor=1090;

--3º -Amanda Fernandes Lima
DELETE FROM rh.servidor WHERE id_servidor=54386368;

--4º Ana Lucia de Santana Santos 
UPDATE ensino.docente_turma SET id_docente=54387604 WHERE id_docente_turma in (51959118,52426334,52710211);
DELETE FROM rh.servidor WHERE id_servidor=1718;

--5º Luana de Jesus Santos 
UPDATE ensino.docente_turma SET id_docente=54389113 WHERE id_docente_turma in (52973939, 52973940, 53031045, 53031121, 52973933, 52973934, 52973936, 52973937);
UPDATE pessoas.historico_servidor_terceirizado SET id_servidor=54389113 WHERE id_historico_servidor_terceirizado in (53047465);
UPDATE rh.historico_transferencia_servidores SET id_servidor=54389113 WHERE id_historico_transferencia_servidor=52952404;

DELETE FROM rh.servidor WHERE id_servidor=2836;


ROLLBACK;

--BANCO COMUM
--2º Maria da Conceição Santos Araújo da Silva 
DELETE FROM rh.servidor WHERE id_servidor=1090;
--4º Ana Lucia de Santana Santos 
DELETE FROM rh.servidor WHERE id_servidor=1718;
--5º Luana de Jesus Santos 
DELETE FROM rh.servidor WHERE id_servidor=2836;


INSERT INTO rh.servidor
(id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, siape_antiga, id_entrada)
VALUES(1090, '01980', 752855, NULL, '2', NULL, NULL, 1, 1, 2874, NULL, NULL, '2023-04-25 10:55:44.124', 0.00, NULL, 605, NULL, 25, false, '3', NULL, NULL, NULL, NULL, NULL, '2023-04-25 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO rh.servidor
(id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, siape_antiga, id_entrada)
VALUES(1718, '19301', 754721, NULL, '9', NULL, NULL, 1, 1, 2889, NULL, NULL, '2023-04-28 10:42:07.512', 0.00, NULL, 605, NULL, 24, false, '3', NULL, NULL, NULL, NULL, NULL, '2023-04-28 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO rh.servidor
(id_servidor, siape, id_pessoa, id_atividade, digito_siape, id_escolaridade, id_ativo, id_situacao, id_categoria, id_cargo, uorg, lotacao, ultima_atualizacao, auxilio_transporte, uorgsiapecad, id_unidade, id_formacao, regime_trabalho, dedicacao_exclusiva, tipo_vinculo, id_foto, id_perfil, id_pessoa_transferencia, data_desligamento, id_classe_funcional, admissao, referencia_nivel_padrao, id_unidade_lotacao, matricula_interna, nome_identificacao, id_unidade_pagadora, siape_antiga, id_entrada)
VALUES(2836, '502697', 51953602, NULL, '3', NULL, NULL, 1, 1, 2948, NULL, NULL, '2024-04-30 08:34:10.347', 0.00, NULL, 605, NULL, 24, false, '8', NULL, NULL, NULL, NULL, NULL, '2024-04-08 00:00:00.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

