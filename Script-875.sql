SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico = 1012879;  

SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (1012879) ; 

select * from basico.turma_serie ts where ts.id_curriculo_medio  = 1012879 and ativo;


select * from ensino.turma t where t.id_turma_serie  = 51883636;

SELECT cr.* FROM ensino_infantil.configuracao_relatorio AS cr where cr.id_curriculo_basico = 51881158;


SELECT cr.* FROM ensino_infantil.configuracao_relatorio AS cr
WHERE id_configuracao_relatorio = 7; 

51880803
UPDATE ensino_infantil.configuracao_relatorio SET id_curriculo_basico=51880803, id_periodicidade_relatorio=4, id_grupo_avaliacao_relatorio=5, ativo=true, codigo='EIP2', id_registro_cadastro=5622650, id_registro_atualizacao=5622655, data_cadastro='2025-05-16 16:59:02.178', data_alteracao='2025-05-19 10:07:20.850', possui_parecer_descritivo=true WHERE id_configuracao_relatorio=5;

-- 1 ano
UPDATE basico.curriculo_basico
SET tipo_diario = 31, tipo_diario_diversificado = NULL, possui_parte_diversificada = FALSE 
WHERE id_curriculo_basico = 53468223;

UPDATE basico.turma_serie
SET tipo_diario = 31
WHERE id_turma_serie = 53468262;

UPDATE ensino.turma
SET id_turma_agrupadora = 709158
WHERE id_turma IN (709169, 709168, 709170, 709171, 709166, 709172, 709173, 709174, 709175, 709176, 709177, 709178, 709179);

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES 
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 229, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 223, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 238, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 230, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 225, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 224, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 221, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 41, 222, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE);

INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, id_situacao_relatorio_avaliativo_componente)
SELECT nextval('ensino_infantil.relatorio_avaliativo_componente_seq'), ra.id_relatorio_avaliativo, mc.id_matricula_componente, crc.id_configuracao_relatorio_componente, 1
FROM ensino_infantil.relatorio_avaliativo ra 
JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio 
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	AND crc.id_componente_curricular IN (229, 223, 238, 230, 225, 224, 221, 222)
JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = ra.id_matricula_discente_serie 
JOIN ensino.turma t ON t.id_turma_serie = mes.id_turma_serie AND t.id_disciplina = crc.id_componente_curricular
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma AND mc.id_discente = mes.id_estudante AND mc.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_configuracao_relatorio IN (41);

-- 2 ano
UPDATE basico.curriculo_basico
SET tipo_diario = 31, tipo_diario_diversificado = NULL, possui_parte_diversificada = FALSE 
WHERE id_curriculo_basico = 53468323;

UPDATE basico.turma_serie
SET tipo_diario = 31
WHERE id_turma_serie = 53469156;

UPDATE ensino.turma
SET id_turma_agrupadora = 709292
WHERE id_turma IN (709303, 709304, 709305, 709306, 709307, 709308, 709313, 709302, 709300, 709309, 709310, 709312, 709311);

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES 
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 229, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 223, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 238, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 230, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 225, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 224, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 221, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 42, 222, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE);

INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, id_situacao_relatorio_avaliativo_componente)
SELECT nextval('ensino_infantil.relatorio_avaliativo_componente_seq'), ra.id_relatorio_avaliativo, mc.id_matricula_componente, crc.id_configuracao_relatorio_componente, 1
FROM ensino_infantil.relatorio_avaliativo ra 
JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio 
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	AND crc.id_componente_curricular IN (229, 223, 238, 230, 225, 224, 221, 222)
JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = ra.id_matricula_discente_serie 
JOIN ensino.turma t ON t.id_turma_serie = mes.id_turma_serie AND t.id_disciplina = crc.id_componente_curricular
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma AND mc.id_discente = mes.id_estudante AND mc.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_configuracao_relatorio IN (42);

-- 3 ano
UPDATE basico.curriculo_basico
SET tipo_diario = 31, tipo_diario_diversificado = NULL, possui_parte_diversificada = FALSE 
WHERE id_curriculo_basico = 53468345;

UPDATE basico.turma_serie
SET tipo_diario = 31
WHERE id_turma_serie = 53470779;

UPDATE ensino.turma
SET id_turma_agrupadora = 710046
WHERE id_turma IN (710067, 710056, 710057, 710058, 710059, 710054, 710060, 710061, 710062, 710063, 710064, 710066, 710065);

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo) VALUES 
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 229, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 223, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 238, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 230, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 225, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 224, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 221, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE),
(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 43, 222, 1, 9999, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE);

INSERT INTO ensino_infantil.relatorio_avaliativo_componente (id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente, id_configuracao_relatorio_componente, id_situacao_relatorio_avaliativo_componente)
SELECT nextval('ensino_infantil.relatorio_avaliativo_componente_seq'), ra.id_relatorio_avaliativo, mc.id_matricula_componente, crc.id_configuracao_relatorio_componente, 1
FROM ensino_infantil.relatorio_avaliativo ra 
JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio 
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
	AND crc.id_componente_curricular IN (229, 223, 238, 230, 225, 224, 221, 222)
JOIN basico.matricula_estudante_serie mes ON mes.id_matricula_discente_serie = ra.id_matricula_discente_serie 
JOIN ensino.turma t ON t.id_turma_serie = mes.id_turma_serie AND t.id_disciplina = crc.id_componente_curricular
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma AND mc.id_discente = mes.id_estudante AND mc.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_configuracao_relatorio IN (43);