--##############################################################################

SELECT 'UPDATE basico.curriculo_basico_componente SET ch_semana=' || cbc.ch_semana || ', ch_ano=' || cbc.ch_ano || ', permite_alocacao_adjunto = ' 
|| cbc.permite_alocacao_adjunto || ' WHERE id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' AS backup
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
AND cbc.id_componente_curricular = 293;
-- BLOCK 1: Atualiza o componente 293
UPDATE basico.curriculo_basico_componente
SET
ch_semana = 24, ch_ano = 800, permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
AND id_componente_curricular = 293;
--backup

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 20, ch_ano = 800, permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente = 52553572;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 20, ch_ano = 800, permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente = 52553649;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 20, ch_ano = 800, permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente = 52553660;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 20, ch_ano = 800, permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente = 52553671;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 20, ch_ano = 800, permite_alocacao_adjunto = TRUE
WHERE id_curriculo_basico_componente = 52553704;
--##############################################################################

SELECT 'UPDATE basico.curriculo_basico_componente SET ch_semana=' || cbc.ch_semana || ', ch_ano=' || cbc.ch_ano || ' WHERE id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' AS backup
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
AND cbc.id_componente_curricular IN ( 507, 508, 509, 510, 511);
-- BLOCK 2: Atualiza os componentes 507 a 511
UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
AND id_componente_curricular IN (507, 508, 509, 510, 511);
--backup
UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553563;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553564;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 5, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553565;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553566;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553567;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553640;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553641;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 5, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553642;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553643;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553644;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553651;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553652;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 5, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553653;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553654;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553655;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553662;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553663;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 5, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553664;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553665;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553666;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553695;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553696;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 5, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553697;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553698;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 4, ch_ano = 160
WHERE id_curriculo_basico_componente = 52553699;
--##############################################################################

SELECT 'UPDATE basico.curriculo_basico_componente SET ch_semana=' || cbc.ch_semana || ', ch_ano=' || cbc.ch_ano || ' WHERE id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' AS backup
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
AND cbc.id_componente_curricular IN ( 229, 500, 520, 521)
-- BLOCK 3: Atualiza os componentes 229, 500, 520 e 521
UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
AND id_componente_curricular IN (229, 500, 520, 521);
--backup

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553568;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553569;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 3, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553570;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553571;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553645;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553646;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 3, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553647;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553648;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553656;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553657;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 3, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553658;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553659;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553667;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553668;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 3, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553669;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553670;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553700;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553701;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 3, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553702;

UPDATE basico.curriculo_basico_componente
SET
ch_semana = 2, ch_ano = 80
WHERE id_curriculo_basico_componente = 52553703;
--##############################################################################

BEGIN;
--##############################################################################
-- BLOCK 1: HORÁRIOS PARA A ETAPA CRECHE (id_etapa_ensino = 1)
INSERT INTO ensino.horario 
(id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao)
VALUES
(nextval('public.hibernate_sequence'), '07:00:00', 5847, '07:50:00', TRUE, 'B', 524350830, 1, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '07:00:00', 5847, '07:50:00', TRUE, 'B', 524350830, 2, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '07:50:00', 5847, '08:40:00', TRUE, 'B', 524350830, 3, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '07:50:00', 5847, '08:40:00', TRUE, 'B', 524350830, 4, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '08:40:00', 5847, '09:30:00', TRUE, 'B', 524350830, 5, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '08:40:00', 5847, '09:30:00', TRUE, 'B', 524350830, 6, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:45:00', 5847, '10:35:00', TRUE, 'B', 524350830, 7, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:45:00', 5847, '10:35:00', TRUE, 'B', 524350830, 8, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:35:00', 5847, '11:20:00', TRUE, 'B', 524350830, 9, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:35:00', 5847, '11:20:00', TRUE, 'B', 524350830, 10, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '12:20:00', 5847, '13:10:00', TRUE, 'B', 524350830, 11, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '12:20:00', 5847, '13:10:00', TRUE, 'B', 524350830, 12, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:10:00', 5847, '14:00:00', TRUE, 'B', 524350830, 13, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:10:00', 5847, '14:00:00', TRUE, 'B', 524350830, 14, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:00:00', 5847, '14:50:00', TRUE, 'B', 524350830, 15, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:00:00', 5847, '14:50:00', TRUE, 'B', 524350830, 16, 1, 2026, NULL, NULL, NULL, NULL);
--##############################################################################
-- BLOCK 2: HORÁRIOS PARA A ETAPA PRÉ-ESCOLA (id_etapa_ensino = 2)
INSERT INTO ensino.horario 
(id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao)
VALUES
(nextval('public.hibernate_sequence'), '07:00:00', 5847, '07:50:00', TRUE, 'B', 524350830, 1, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '07:00:00', 5847, '07:50:00', TRUE, 'B', 524350830, 2, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '07:50:00', 5847, '08:40:00', TRUE, 'B', 524350830, 3, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '07:50:00', 5847, '08:40:00', TRUE, 'B', 524350830, 4, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '08:40:00', 5847, '09:30:00', TRUE, 'B', 524350830, 5, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '08:40:00', 5847, '09:30:00', TRUE, 'B', 524350830, 6, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:45:00', 5847, '10:35:00', TRUE, 'B', 524350830, 7, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:45:00', 5847, '10:35:00', TRUE, 'B', 524350830, 8, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:35:00', 5847, '11:20:00', TRUE, 'B', 524350830, 9, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:35:00', 5847, '11:20:00', TRUE, 'B', 524350830, 10, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '12:20:00', 5847, '13:10:00', TRUE, 'B', 524350830, 11, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '12:20:00', 5847, '13:10:00', TRUE, 'B', 524350830, 12, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:10:00', 5847, '14:00:00', TRUE, 'B', 524350830, 13, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:10:00', 5847, '14:00:00', TRUE, 'B', 524350830, 14, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:00:00', 5847, '14:50:00', TRUE, 'B', 524350830, 15, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:00:00', 5847, '14:50:00', TRUE, 'B', 524350830, 16, 2, 2026, NULL, NULL, NULL, NULL);
--##############################################################################
-- BLOCK 1: HORÁRIOS INTEGRAL - V PARA A ETAPA CRECHE (id_etapa_ensino = 1)
INSERT INTO ensino.horario 
(id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao)
VALUES
(nextval('public.hibernate_sequence'), '09:00:00', 5847, '09:50:00', TRUE, 'B', 524350831, 1, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:00:00', 5847, '09:50:00', TRUE, 'B', 524350831, 2, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:50:00', 5847, '10:40:00', TRUE, 'B', 524350831, 3, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:50:00', 5847, '10:40:00', TRUE, 'B', 524350831, 4, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:40:00', 5847, '11:30:00', TRUE, 'B', 524350831, 5, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:40:00', 5847, '11:30:00', TRUE, 'B', 524350831, 6, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '11:30:00', 5847, '12:15:00', TRUE, 'B', 524350831, 7, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '11:30:00', 5847, '12:15:00', TRUE, 'B', 524350831, 8, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:00:00', 5847, '13:45:00', TRUE, 'B', 524350831, 9, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:00:00', 5847, '13:45:00', TRUE, 'B', 524350831, 10, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:45:00', 5847, '14:30:00', TRUE, 'B', 524350831, 11, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:45:00', 5847, '14:30:00', TRUE, 'B', 524350831, 12, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:30:00', 5847, '15:15:00', TRUE, 'B', 524350831, 13, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:30:00', 5847, '15:15:00', TRUE, 'B', 524350831, 14, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '15:30:00', 5847, '16:15:00', TRUE, 'B', 524350831, 15, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '15:30:00', 5847, '16:15:00', TRUE, 'B', 524350831, 16, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '16:15:00', 5847, '17:00:00', TRUE, 'B', 524350831, 17, 1, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '16:15:00', 5847, '17:00:00', TRUE, 'B', 524350831, 18, 1, 2026, NULL, NULL, NULL, NULL);
--##############################################################################
-- BLOCK 2: HORÁRIOS INTEGRAL - V PARA A ETAPA PRÉ-ESCOLA (id_etapa_ensino = 2)
INSERT INTO ensino.horario 
(id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao)
VALUES
(nextval('public.hibernate_sequence'), '09:00:00', 5847, '09:50:00', TRUE, 'B', 524350831, 1, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:00:00', 5847, '09:50:00', TRUE, 'B', 524350831, 2, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:50:00', 5847, '10:40:00', TRUE, 'B', 524350831, 3, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '09:50:00', 5847, '10:40:00', TRUE, 'B', 524350831, 4, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:40:00', 5847, '11:30:00', TRUE, 'B', 524350831, 5, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '10:40:00', 5847, '11:30:00', TRUE, 'B', 524350831, 6, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '11:30:00', 5847, '12:15:00', TRUE, 'B', 524350831, 7, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '11:30:00', 5847, '12:15:00', TRUE, 'B', 524350831, 8, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:00:00', 5847, '13:45:00', TRUE, 'B', 524350831, 9, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:00:00', 5847, '13:45:00', TRUE, 'B', 524350831, 10, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:45:00', 5847, '14:30:00', TRUE, 'B', 524350831, 11, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '13:45:00', 5847, '14:30:00', TRUE, 'B', 524350831, 12, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:30:00', 5847, '15:15:00', TRUE, 'B', 524350831, 13, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '14:30:00', 5847, '15:15:00', TRUE, 'B', 524350831, 14, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '15:30:00', 5847, '16:15:00', TRUE, 'B', 524350831, 15, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '15:30:00', 5847, '16:15:00', TRUE, 'B', 524350831, 16, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '16:15:00', 5847, '17:00:00', TRUE, 'B', 524350831, 17, 2, 2026, NULL, NULL, NULL, NULL),(nextval('public.hibernate_sequence'), '16:15:00', 5847, '17:00:00', TRUE, 'B', 524350831, 18, 2, 2026, NULL, NULL, NULL, NULL);
--##############################################################################


COMMIT;

ROLLBACK ;

SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%CRECHE PROINFÂNCIA MARIA DO SOCORRO DIAS%'

SELECT *
FROM comum.unidade u
WHERE u.id_unidade = 5847;

/*Adicionar o componente Atividade polivalente B 24 horas semanais e 800 anuais (precisa permitir professor adjunto)

Ajustar a CH dos seguintes componentes para 4 horas semanais e 160 anuais

2021 - CORPO, GESTOS E MOVIMENTOS
20200 - ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO
20214 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES
2021.1 - O EU, O OUTRO E O NÓS
00003 - TRAÇOS, SONS, CORES E FORMAS

Ajustar a CH dos seguintes componentes para 2 horas semanais e 80 anuais
10 - Arte
CULT - CULTURA
ESP - ESPORTE
0018 - MUSICA*/



INTEGRAL - V
--NV5-INTV --52553639
--NV4-INTV --52553650
--NV3-INTV --52553694

INTEGRAL - M
NV5-INTM
--NV4-INTM --52553661
--NV3-INTM --52553562

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.codigo ILIKE '%INTM%'

SELECT *
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico = 52553639;

SELECT DISTINCT t
FROM basico.curriculo_basico_componente cbc
JOIN basico.turma_serie ts ON
ts.id_curriculo_medio = cbc.id_curriculo_basico
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
WHERE cbc.id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562)
--AND cbc.id_componente_curricular = 293
AND t.id_disciplina = 293
AND ts.ativo ;

SELECT ts
FROM basico.turma_serie ts
--JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio IN (52553639, 52553650, 52553694, 52553661, 52553562);

SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico IN (52553639, 52553650, 52553694, 52553661, 52553562);

BEGIN;

ROLLBACK;

DELETE
FROM ensino.horario h
WHERE h.ano_entrada_vigor = 2026
AND h.id_unidade = 5847
AND h.tipo IN (524350830, 524350831)

SELECT *
FROM ensino.horario h
WHERE h.ano_entrada_vigor = 2026
AND h.id_unidade = 5847
AND h.tipo IN (524350830, 524350831)



INSERT INTO ensino.horario (id_horario, inicio, id_unidade, fim, ativo, nivel, tipo, ordem, id_etapa_ensino, ano_entrada_vigor, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao)
VALUES(52548132, '14:00:00', 5847, '14:50:00', TRUE, 'B', 524350830, 8, 2, 2026, NULL, NULL, NULL, NULL);
--id 1 EDUCAÇÃO INFANTIL - CRECHE
--id 2 EDUCAÇÃO INFANTIL - PRÉ-ESCOLA

SELECT *
FROM escola.escola
WHERE id_unidade_escola = 5847;

SELECT *
FROM basico.etapa_ensino ee;

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 51870405
AND ts.ativo
AND ts.ano = 2026;

SELECT ht.id_horario_turma, ht.id_turma, ht.id_horario, ht.dia, ht.ativo, ht.data_alteracao, h.id_horario, h.inicio, h.fim, t.codigo, t.periodo, t.id_disciplina
FROM ensino.horario_turma ht
JOIN ensino.turma t
	USING (id_turma)
JOIN ensino.horario h
	USING (id_horario)
WHERE t.id_turma_serie = 52563983
AND ht.ativo = trueValue()
ORDER BY ht.data_alteracao, ht.id_horario, dia;

SELECT DISTINCT horario.id_horario AS id_horario, horario.ano_entrada_vigor AS ano, horario.ativo AS ativo, horario.id_etapa_ensino AS id_etapa_ensino, horario.fim AS fim, horario.inicio AS inicio, horario.nivel AS nivel, horario.ordem AS ordem, horario.tipo AS tipo, horario.id_unidade AS id
FROM ensino.horario_turma ht
INNER JOIN ensino.turma t ON
ht.id_turma = t.id_turma
INNER JOIN basico.turma_serie ts ON
t.id_turma_serie = ts.id_turma_serie
INNER JOIN ensino.Horario horario ON
ht.id_horario = horario.id_horario
WHERE ts.id_turma_serie = 52563983
AND ht.ativo = TRUE
AND horario.ativo = TRUE
AND horario.tipo IN (524350830);
LIMIT ?


SELECT DISTINCT horario.id_horario AS id_horario, horario.ano_entrada_vigor AS ano, horario.ativo AS ativo, horario.id_etapa_ensino AS id_etapa_ensino, horario.fim AS fim, horario.inicio AS inicio, horario.nivel AS nivel, horario.ordem AS ordem, horario.tipo AS tipo, horario.id_unidade AS id
FROM ensino.horario_turma ht
INNER JOIN ensino.turma t ON ht.id_turma = t.id_turma
INNER JOIN basico.turma_serie ts ON t.id_turma_serie = ts.id_turma_serie
INNER JOIN ensino.Horario horario ON ht.id_horario = horario.id_horario
WHERE ts.id_turma_serie = 52563983
AND ht.ativo = TRUE
AND horario.ativo = TRUE
AND horario.tipo IN (524350830);
LIMIT ?;

SELECT *
FROM ensino.horario h
WHERE h.ano_entrada_vigor = 2026
AND h.id_unidade = 5847
AND h.tipo IN (524350830)
AND h.id_etapa_ensino = 1;

WITH dados_base AS (
    -- Passo 1: Filtra horários ativos do tipo específico e define prioridades para a etapa
    SELECT 
        h.*, 
        CASE 
            WHEN h.id_etapa_ensino = 1 THEN 1
            WHEN h.id_etapa_ensino IS NULL THEN 2
            ELSE 3 
        END AS prioridade_etapa
    FROM ensino.horario h
    WHERE h.ativo
      AND (h.id_etapa_ensino = 1 OR h.id_etapa_ensino IS NULL)
      AND h.tipo = 524350830
), 
unidade_escolhida AS (
    -- Passo 2: Decide qual unidade usar (se houver dados na unidade 5847, usa ela; senão, usa a 605)
    SELECT 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM dados_base 
                WHERE id_unidade = 5847
            ) THEN 5847
            ELSE 605 
        END AS id_unidade
), 
dados AS (
    -- Passo 3: Filtra os dados base apenas para a unidade escolhida e prioridades 1 ou 2
    SELECT db.*
    FROM dados_base db
    JOIN unidade_escolhida ue ON db.id_unidade = ue.id_unidade
    WHERE db.prioridade_etapa IN (1, 2)
), 
melhor_ano AS (
    -- Passo 4: Encontra o ano de entrada em vigor mais recente disponível
    SELECT ano_entrada_vigor
    FROM dados
    GROUP BY ano_entrada_vigor
    ORDER BY ano_entrada_vigor DESC NULLS LAST
    LIMIT 1
), 
melhor_etapa AS (
    -- Passo 5: Descobre qual é a maior prioridade disponível para esse melhor ano
    SELECT MIN(d.prioridade_etapa) AS prioridade
    FROM dados d
    JOIN melhor_ano ma ON d.ano_entrada_vigor IS NOT DISTINCT FROM ma.ano_entrada_vigor
)
-- Seleção Final: Junta tudo com as tabelas de suporte para trazer os nomes textuais
SELECT --DISTINCT ON (d.inicio, d.fim)
    d.id_horario, 
    d.inicio, 
    d.fim, 
    d.ano_entrada_vigor, 
    d.tipo, 
    d.ordem, 
    d.ativo, 
    u.id_unidade, 
    u.nome, 
    ee.id_etapa_ensino, 
    ee.denominacao, 
    t.descricao
FROM dados d
JOIN comum.unidade u ON u.id_unidade = d.id_unidade
JOIN ensino.turno t ON t.id_turno = d.tipo
LEFT JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = d.id_etapa_ensino
JOIN melhor_ano ma ON d.ano_entrada_vigor IS NOT DISTINCT FROM ma.ano_entrada_vigor
JOIN melhor_etapa me ON d.prioridade_etapa = me.prioridade
ORDER BY d.inicio, d.fim, d.prioridade_etapa;
