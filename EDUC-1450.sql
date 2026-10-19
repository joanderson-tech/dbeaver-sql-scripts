SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo = 'EIP5';

ROLLBACK;


SELECT DISTINCT t.*  FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio = 51895123
AND t.id_situacao_turma =1;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51895123;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_componente_curricular = 293;

SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico = 51895123;

select * FROM ensino_infantil.configuracao_relatorio_componente crc WHERE crc.id_configuracao_relatorio  = 7; AND crc.id_componente_curricular = 293;

INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 7, 293, 1, 9000, true, null, null, now(), null, false, false);

SELECT DISTINCT t.* FROM basico.turma_serie ts 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
WHERE ts.id_curriculo_medio = 51895123;

ROLLBACK;

/*CMPEX02 - CORPO, GESTOS E MOVIMENTOS / 200h  /	5h  -- 507
CMPEX03 - TRAÇOS, SONS, CORES E FORMAS	/ 150h	/ 5h  --508
CMPEX01 - O EU, O OUTRO E O NÓS / 150h	/ 5h		--506
CMPEX04 - ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO	/ 150h / 5h -- 509
CMPEX05 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES / 150h / 5h -- 510
Atividade polivalente B / 800h / 20h*/

BEGIN;

--solução
UPDATE basico.curriculo_basico_componente SET ch_ano=200 WHERE id_curriculo_basico_componente=51913149;
UPDATE basico.curriculo_basico_componente SET ch_ano=150 WHERE id_curriculo_basico_componente IN (51913150,51913151,51913152,51913153);

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), 51895123, 293, 800, NULL, NULL, now(), TRUE, NULL, 20, NULL, 5, TRUE, NULL, FALSE, 1, FALSE, FALSE);

--
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 7, 293, 1, 9000, true, null, null, now(), null, false, false);


ROLLBACK;

Foi ajustado a carga horaria dessa configuração EIP5  tambem foi criado o componente Atividade Polivalente B NO curriculo que estava faltando , tambem foi criado na configurção DO relatorio componente 
que estava faltando apos isso foram criadas AS turmas pra essa estrutura e tbm feita AS matricula componente de cada estudante.  




SELECT * FROM matricula.tipo_documento_matricula;

BEGIN;

--solução
UPDATE basico.curriculo_basico_componente SET ch_ano=200 WHERE id_curriculo_basico_componente=51913149;
UPDATE basico.curriculo_basico_componente SET ch_ano=150 WHERE id_curriculo_basico_componente IN (51913150,51913151,51913152,51913153);

INSERT INTO basico.curriculo_basico_componente
(id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), 51895123, 293, 800, NULL, NULL, now(), TRUE, NULL, 20, NULL, 5, FALSE, NULL, FALSE, 1, FALSE, FALSE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 7, 293, 1, 9000, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE);


----- ============================================
----- CRIAÇÃO DE TURMA COMPONENTE
----- ============================================

--drop table tc_para_adicionar;

-- #1 select das turmas para adicionar turma -
SELECT DISTINCT 
	nextval('ensino.turma_seq') id_turma, tsa.ano, tsa.periodo, 1 id_situacao_turma,
-- ABERTA
tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, cbc.id_categoria_componente
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
-- tsa: Turma Serie Adicionar
JOIN basico.curriculo_basico_componente cbc ON
cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293;

SELECT * FROM tc_para_adicionar;

-- #2 insert das turmas 
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente 
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro::timestamp, id_turma_serie, ordem, id_categoria_componente
FROM tc_para_adicionar;

-- ## Criação de Novas Matrículas Componentes
WITH criar_MC AS (
 SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente, CASE 
               WHEN mes.id_situacao_matricula_serie = 1 THEN 2
WHEN mes.id_situacao_matricula_serie = 2 THEN 5
WHEN mes.id_situacao_matricula_serie = 3 THEN 6
WHEN mes.id_situacao_matricula_serie = 4
OR mes.id_situacao_matricula_serie = 9 THEN 4
WHEN mes.id_situacao_matricula_serie = 5 THEN 3
WHEN mes.id_situacao_matricula_serie = 6 THEN 9
ELSE 2
           END AS id_situacao_matricula, ts.id_turma, ts.id_disciplina AS id_componente_curricular, mes.id_estudante AS id_discente, ts.ano, ts.periodo, ts.id_turma_serie, mes.id_matricula_discente_serie id_matricula_estudante_serie
FROM tc_para_adicionar ts
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
WHERE 1 = 1
AND ts.id_situacao_turma <> 4)
    SELECT DISTINCT *
    INTO TEMP novas_mc
FROM criar_MC tm
WHERE NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = tm.id_turma
AND mc.ano = tm.ano
AND mc.id_situacao_matricula = tm.id_situacao_matricula
AND mc.id_discente = tm.id_discente
);

--insert das Novas Matrículas Componentes
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo, id_matricula_estudante_serie
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = tm.id_turma
AND mc.ano = tm.ano
AND mc.id_situacao_matricula = tm.id_situacao_matricula
AND mc.id_discente = tm.id_discente
);

-- #1 backup  das turmas 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar;
-- #2 backup Matrículas Componentes
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM novas_mc mc;


COMMIT;
--=========================================--
--backup da ch_ano
UPDATE basico.curriculo_basico_componente SET ch_ano=400 WHERE id_curriculo_basico_componente=51913149;
UPDATE basico.curriculo_basico_componente SET ch_ano=300 WHERE id_curriculo_basico_componente IN (51913150,51913151,51913152,51913153);

--backup 
DELETE
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico_componente = (
    SELECT cbc.id_curriculo_basico_componente
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_componente_curricular = 293
AND cbc.id_curriculo_basico = 51895123
);

--backup
UPDATE ensino_infantil.configuracao_relatorio_componente
SET
ativo = FALSE
WHERE id_configuracao_relatorio_componente = (SELECT id_configuracao_relatorio_componente
FROM ensino_infantil.configuracao_relatorio_componente crc
WHERE crc.id_configuracao_relatorio = 7
AND crc.id_componente_curricular = 293
);
