--SELECIONA POR TURMA  EFAIV23A
select * 
from ensino.docente_turma dt
where dt.id_turma = 683403;

--SELECIONA POR TURMA  EFAIV23B
select * 
from ensino.docente_turma dt
where dt.id_turma = 683413;

--683211


--SOLUÇÃO EFAIV23A 
-- Auto-generated SQL script #202308311550
UPDATE ensino.docente_turma
	SET finalizada=false,ativo=false
	WHERE id_docente_turma=51992099;

--BACKUP EFAIV23A 
UPDATE ensino.docente_turma
	SET finalizada=true,ativo=true
	WHERE id_docente_turma=51992099;


--BACKUP EFAIV23B
UPDATE ensino.docente_turma
	SET ativo=true,finalizada=true
	WHERE id_docente_turma in (51992100, 52391560, 52391566, 52415109);



--BACKUP EFAIV23B
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1869, 51992100, 683413, NULL, NULL, NULL, '2023-05-12 16:24:55.942', NULL, true, '2023-03-15 00:00:00.000', '2023-03-15 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'TÉRMINO DO CONTRATO DA PROFEESSORA..', 5637347, 5692873, '2023-08-30 09:58:25.511', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1275, 51955199, 683413, NULL, NULL, NULL, '2023-04-27 10:04:51.745', NULL, false, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', NULL, NULL, false, false, false, false, NULL, false, NULL, NULL, 5630696, 5637347, '2023-05-12 16:24:21.000', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1960, 52391560, 683413, NULL, NULL, NULL, '2023-08-03 15:34:50.117', NULL, true, '2023-12-23 00:00:00.000', '2023-12-22 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'TÉRMINO DO CONTRATO DA PROFEESSORA..', 5675574, 5675574, '2023-08-03 15:42:54.845', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1869, 52391566, 683413, NULL, NULL, NULL, '2023-08-03 15:44:43.462', NULL, true, '2023-12-24 00:00:00.000', '2023-12-22 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'TÉRMINO DO CONTRATO DA PROFEESSORA..', 5675574, 5675574, '2023-08-03 15:45:42.900', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1869, 52393061, 683413, NULL, NULL, NULL, '2023-08-04 13:47:23.731', NULL, false, '2023-12-25 00:00:00.000', '2023-12-22 00:00:00.000', NULL, NULL, false, false, false, false, NULL, false, NULL, NULL, 5676478, 5676478, '2023-08-04 13:48:07.000', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1869, 52393070, 683413, NULL, NULL, NULL, '2023-08-04 13:51:49.758', NULL, false, '2023-12-25 00:00:00.000', '2023-12-22 00:00:00.000', NULL, NULL, false, false, false, false, NULL, false, NULL, 'cadastrada errado', 5676478, 5685702, '2023-08-18 15:48:56.000', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(18, 1869, 52415109, 683413, NULL, NULL, NULL, '2023-08-18 15:56:10.038', NULL, true, '2023-03-15 00:00:00.000', '2023-03-15 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'TROCAR A PROFESSORA DE TURMA NA MESMA ESCOLA.', 5685702, 5692873, '2023-08-30 09:57:11.350', NULL, NULL, NULL, false);

--EFAIV23B
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=51992100;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=51955199;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=52391560;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=52391566;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=52393061;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=52393070;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=52415109;



select * from ensino.docente_turma_alteracao
where id_docente_turma in (51992100,51955199,52391560,52391566,52393061,52393070,52415109);


INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52374687, 51992100, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', 104974, '2023-07-25 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52391559, 51992100, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', 104974, '2023-08-03 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52391564, 52391560, '2023-12-23 00:00:00.000', '2023-12-22 00:00:00.000', 104974, '2023-08-03 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52391568, 52391566, '2023-12-24 00:00:00.000', '2023-12-24 00:00:00.000', 104974, '2023-08-03 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52437944, 52415109, '2023-12-25 00:00:00.000', '2023-12-22 00:00:00.000', 104935, '2023-08-30 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52437946, 52415109, '2023-03-15 00:00:00.000', '2023-03-15 00:00:00.000', 104935, '2023-08-30 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52437947, 51992100, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', 104935, '2023-08-30 00:00:00.000');

-- SOLUÇÃO
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52374687;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52391559;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52391564;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52391568;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52437944;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52437946;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52437947;

-----------------------------

INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(17, 1671, 51955205, 683403, NULL, NULL, NULL, '2023-04-27 10:09:13.813', NULL, false, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', NULL, NULL, false, false, false, false, NULL, false, NULL, NULL, 5630696, 5637347, '2023-05-12 16:19:32.000', NULL, NULL, NULL, false);
INSERT INTO ensino.docente_turma
(ch_dedicada_periodo, id_docente, id_docente_turma, id_turma, id_docente_externo, docext, nova, data_cadastro, codigo_rh, ativo, data_inicio, data_fim, id_turma_auxiliar, tipo_participacao, suplementar, finalizada, complementar, auxiliar, justificativa_ch_alternativa, ch_alternativa, id_afastamento, justificativa_cancelamento, id_registro_cadastro, id_registro_atualizacao, data_alteracao, id_atividade_ape, id_encaminhamento_candidato_escola, justificativa_alocacao, regra_excecao_validacao_regras_alocacao_qualificacao)
VALUES(17, 1960, 51992099, 683403, NULL, NULL, NULL, '2023-05-12 16:20:03.729', NULL, true, '2023-03-15 00:00:00.000', '2023-03-15 00:00:00.000', NULL, NULL, false, true, false, false, NULL, false, NULL, 'TÉRMINO DO CONTRATO DA PROFESSORA NA ESCOLA.. ', 5637347, 5690248, '2023-08-25 12:06:14.614', NULL, NULL, NULL, false);


DELETE FROM ensino.docente_turma
WHERE id_docente_turma=51955205;
DELETE FROM ensino.docente_turma
WHERE id_docente_turma=51992099;

select * from ensino.docente_turma_alteracao
where id_docente_turma in (51992099,51955205);


INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52374808, 51992099, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', 104974, '2023-07-25 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52391563, 51992099, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', 104974, '2023-08-03 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52427104, 51992099, '2023-03-15 00:00:00.000', '2023-12-22 00:00:00.000', 104935, '2023-08-25 00:00:00.000');
INSERT INTO ensino.docente_turma_alteracao
(id_docente_turma_alteracao, id_docente_turma, data_inicio, data_fim, id_usuario, data_cadastro)
VALUES(52427107, 51992099, '2023-03-15 00:00:00.000', '2023-03-15 00:00:00.000', 104935, '2023-08-25 00:00:00.000');


DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52374808;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52391563;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52427104;
DELETE FROM ensino.docente_turma_alteracao
WHERE id_docente_turma_alteracao=52427107;




begin; 

commit;

rollback;



