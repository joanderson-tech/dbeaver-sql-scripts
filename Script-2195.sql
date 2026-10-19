SELECT t.id_turma_serie,*
FROM ensino.turma t
WHERE t.id_turma_serie = 52535980;

SELECT * --'UPDATE ensino.horario_turma SET id_horario= '|| novo id ||'	WHERE id_horario_turma=1426436';
FROM ensino.horario_turma ht
WHERE ht.id_turma IN (689747, 689746, 690136)
AND ht.id_horario IN (52535175, 52535176, 52544820, 52544822, 52544823, 52544824, 52544907)
AND ht.ativo ;




id_horario
52535175 vai ser 52544896
52535176 vai ser 52544897
52544820 vai ser 52544898
52544822 vai ser 52544899
52544823 vai ser 52544901
52544824 vai ser 52544902

SELECT *
FROM ensino.horario h ;

SELECT *
FROM ensino.horario
WHERE id_horario IN (52535175, 52535176, 52544820, 52544822, 52544823, 52544824, 52544907)
ORDER BY ordem;

SELECT *
FROM ensino.horario h
WHERE h.ano_entrada_vigor = 2026
AND h.id_unidade = 2641
AND h.ativo
ORDER BY h.ordem


SELECT *
FROM ensino.horario_turma ht
WHERE ht.id_horario IN (52535175, 52535176, 52544820, 52544822, 52544823, 52544824, 52544907);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52535175, '07:00:00', 2641, '08:00:00', FALSE, 'B', 1, 0, NULL, 2026);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52535176, '08:00:00', 2641, '09:00:00', FALSE, 'B', 1, 2, NULL, 2026);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52544820, '09:30:00', 2641, '10:10:00', FALSE, 'B', 1, 4, NULL, 2026);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52544822, '11:30:00', 2641, '12:00:00', FALSE, 'B', 1, 5, NULL, 2026);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52544823, '12:00:00', 2641, '13:00:00', FALSE, 'B', 1, 7, NULL, 2026);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52544824, '10:10:00', 2641, '11:00:00', FALSE, 'B', 1, 8, NULL, 2026);

INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor)
VALUES(52544907, '15:00:00', 2641, '16:00:00', FALSE, 'B', 1, 16, NULL, 2026);

DELETE
FROM ensino.horario
WHERE id_horario = 52535175;

DELETE
FROM ensino.horario
WHERE id_horario = 52535176;

DELETE
FROM ensino.horario
WHERE id_horario = 52544820;

DELETE
FROM ensino.horario
WHERE id_horario = 52544822;

DELETE
FROM ensino.horario
WHERE id_horario = 52544823;

DELETE
FROM ensino.horario
WHERE id_horario = 52544824;

DELETE
FROM ensino.horario
WHERE id_horario = 52544907;

DELETE
FROM ensino.horario_turma
WHERE id_horario_turma IN (1426423, 1426424, 1426425, 1426426, 1426427, 1426428, 1426429, 1426430, 1426431, 1426432, 1426433, 1426434, 1426435, 1426436, 1426437, 1426438, 1426439, 1426440, 1426441, 1426442, 1426448, 1426449, 1426450, 1426451, 1426452, 1426453, 1426454, 1426455, 1426456, 1426457);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424577, 689746, 1, 52535178, '6', '10:30:00', '11:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424576, 689746, 1, 52535178, '5', '10:30:00', '11:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424575, 689746, 1, 52535178, '4', '10:30:00', '11:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424574, 689746, 1, 52535178, '3', '10:30:00', '11:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424573, 689746, 1, 52535178, '2', '10:30:00', '11:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424572, 689746, 1, 52535177, '6', '09:30:00', '10:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424571, 689746, 1, 52535177, '5', '09:30:00', '10:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424570, 689746, 1, 52535177, '4', '09:30:00', '10:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424569, 689746, 1, 52535177, '3', '09:30:00', '10:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424582, 689746, 1, 52535179, '6', '13:00:00', '14:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424568, 689746, 1, 52535177, '2', '09:30:00', '10:30:00', '2026-02-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424581, 689746, 1, 52535179, '5', '13:00:00', '14:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424558, 689746, 1, 52535175, '2', '07:00:00', '08:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424559, 689746, 1, 52535175, '3', '07:00:00', '08:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424560, 689746, 1, 52535175, '4', '07:00:00', '08:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424561, 689746, 1, 52535175, '5', '07:00:00', '08:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424562, 689746, 1, 52535175, '6', '07:00:00', '08:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424563, 689746, 1, 52535176, '2', '08:00:00', '09:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424564, 689746, 1, 52535176, '3', '08:00:00', '09:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424565, 689746, 1, 52535176, '4', '08:00:00', '09:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424566, 689746, 1, 52535176, '5', '08:00:00', '09:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424567, 689746, 1, 52535176, '6', '08:00:00', '09:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424578, 689746, 1, 52535179, '2', '13:00:00', '14:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424579, 689746, 1, 52535179, '3', '13:00:00', '14:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1424580, 689746, 1, 52535179, '4', '13:00:00', '14:00:00', '2026-02-09', '2026-04-09', NULL, NULL, NULL, FALSE, '2026-04-09 10:32:44.000', NULL, NULL, 75503);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426446, 690136, 1, 52544821, '5', '11:00:00', '11:30:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426445, 690136, 1, 52544821, '4', '11:00:00', '11:30:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426444, 690136, 1, 52544821, '3', '11:00:00', '11:30:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426443, 690136, 1, 52544821, '2', '11:00:00', '11:30:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426462, 690136, 1, 52535179, '6', '13:00:00', '14:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426461, 690136, 1, 52535179, '5', '13:00:00', '14:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426460, 690136, 1, 52535179, '4', '13:00:00', '14:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426459, 690136, 1, 52535179, '3', '13:00:00', '14:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426458, 690136, 1, 52535179, '2', '13:00:00', '14:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426447, 690136, 1, 52544821, '6', '11:00:00', '11:30:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, FALSE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426423, 689746, 1, 52535175, '2', '07:00:00', '08:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426424, 689746, 1, 52535175, '3', '07:00:00', '08:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426425, 689746, 1, 52535175, '4', '07:00:00', '08:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426426, 689746, 1, 52535175, '5', '07:00:00', '08:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426427, 689746, 1, 52535175, '6', '07:00:00', '08:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426428, 689746, 1, 52535176, '2', '08:00:00', '09:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426429, 689746, 1, 52535176, '3', '08:00:00', '09:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426430, 689746, 1, 52535176, '4', '08:00:00', '09:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426431, 689746, 1, 52535176, '5', '08:00:00', '09:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426432, 689746, 1, 52535176, '6', '08:00:00', '09:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426433, 689746, 1, 52544820, '2', '09:30:00', '10:10:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426434, 689746, 1, 52544820, '3', '09:30:00', '10:10:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426435, 689746, 1, 52544820, '4', '09:30:00', '10:10:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426436, 689746, 1, 52544820, '5', '09:30:00', '10:10:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426437, 689746, 1, 52544820, '6', '09:30:00', '10:10:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426438, 689746, 1, 52544824, '2', '10:10:00', '11:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426439, 689746, 1, 52544824, '3', '10:10:00', '11:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426440, 689746, 1, 52544824, '4', '10:10:00', '11:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426441, 689746, 1, 52544824, '5', '10:10:00', '11:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426442, 689746, 1, 52544824, '6', '10:10:00', '11:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426448, 690136, 1, 52544822, '2', '11:30:00', '12:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426449, 690136, 1, 52544822, '3', '11:30:00', '12:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426450, 690136, 1, 52544822, '4', '11:30:00', '12:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426451, 690136, 1, 52544822, '5', '11:30:00', '12:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426452, 690136, 1, 52544822, '6', '11:30:00', '12:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426453, 690136, 1, 52544823, '2', '12:00:00', '13:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426454, 690136, 1, 52544823, '3', '12:00:00', '13:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426455, 690136, 1, 52544823, '4', '12:00:00', '13:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426456, 690136, 1, 52544823, '5', '12:00:00', '13:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);

INSERT INTO ensino.horario_turma (id_horario_turma, id_turma, tipo, id_horario, dia, hora_inicio, hora_fim, data_inicio, data_fim, codmergpa, codmergpapos, codmerg, ativo, data_alteracao, data_cadastro, altaracao_horario, id_registro_entrada)
VALUES(1426457, 690136, 1, 52544823, '6', '12:00:00', '13:00:00', '2026-04-09', '2026-12-18', NULL, NULL, NULL, TRUE, NULL, NULL, NULL, 78085);
