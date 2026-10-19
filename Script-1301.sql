BEGIN;

ROLLBACK;
--solução

--PASSO 01
UPDATE basico.curriculo_basico_componente SET ch_ano = 200 WHERE id_curriculo_basico_componente = 51913149;

UPDATE basico.curriculo_basico_componente SET ch_ano = 150 WHERE id_curriculo_basico_componente IN (51913150, 51913151, 51913152, 51913153);

INSERT INTO basico.curriculo_basico_componente (id_curriculo_basico_componente, id_curriculo_basico, id_componente_curricular, ch_ano, programa, id_registro_entrada, data_cadastro, obrigatoria, codigo_rh, ch_semana, id_modulo, ordem, permite_alocacao_adjunto, permite_contraturno, componente_eletivo, id_categoria_componente, optativa, permite_multiplos_professores)
VALUES(nextval('hibernate_sequence'), 51895123, 293, 800, NULL, NULL, now(), TRUE, NULL, 20, NULL, 5, TRUE, NULL, FALSE, 1, FALSE, FALSE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente (id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_seq'), 7, 293, 1, 9000, TRUE, NULL, NULL, now(), NULL, FALSE, FALSE);

/*DROP TABLE tc_para_adicionar;
DROP TABLE rac_para_adicionar;
DROP TABLE novas_mc;*/

--PASSO 02 ----- CRIAÇÃO DE TURMA COMPONENTE
SELECT DISTINCT 
    nextval('ensino.turma_seq') id_turma,( SELECT t.id_turma
FROM ensino.turma t
WHERE t.id_turma_serie = tsa.id_turma_serie
AND t.id_disciplina = 220
LIMIT 1) AS id_turma_agrupadora, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, 1 observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, cbc.id_categoria_componente
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON
    cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND cbc.id_curriculo_basico = 51895123
AND cbc.id_componente_curricular = 293
WHERE tsa.ativo;


-- #2 insert das TURMAS COMPONENTE 
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora
FROM tc_para_adicionar;

-- --PASSO 03 Criação de Novas Matrículas Componentes
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

--PASSO 04
SELECT DISTINCT 
	nextval('ensino_infantil.relatorio_avaliativo_componente_seq') id_relatorio_avaliativo_componente, crc.id_configuracao_relatorio_componente, ra.id_relatorio_avaliativo, mc.id_matricula_componente
INTO TEMP rac_para_adicionar
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio = ra.id_configuracao_relatorio
AND crc.id_componente_curricular = 293
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo_componente = ra.id_relatorio_avaliativo
JOIN novas_mc mc ON
mc.id_matricula_estudante_serie = ra.id_matricula_discente_serie
WHERE ra.id_configuracao_relatorio = 7;

--insert dos novos relatorio avaliativo
INSERT INTO ensino_infantil.relatorio_avaliativo_componente (
	id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente , id_configuracao_relatorio_componente, id_situacao_relatorio_avaliativo_componente, parecer_final_fixo
)
SELECT id_relatorio_avaliativo_componente, id_relatorio_avaliativo, id_matricula_componente , id_configuracao_relatorio_componente, 1 , 1
FROM rac_para_adicionar;


---BACKUP
-- #2 backup  das turmas 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar;

-- #3 backup Matrículas Componentes
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM novas_mc mc;
-- #4 backup Matrículas Componentes
SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = ' || rac.id_relatorio_avaliativo_componente || ';'
FROM rac_para_adicionar rac;

ROLLBACK;

COMMIT;


UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 682231;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 682232;

UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007075;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007103;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007095;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007094;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007077;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007080;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007102;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007087;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007076;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007107;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007074;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007092;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007078;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007093;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007088;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007072;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007098;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007090;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007073;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007099;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007106;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007084;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007082;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007101;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007105;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007104;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007097;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007083;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007081;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007091;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007079;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007096;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007086;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007085;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007089;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 17007100;


DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 841;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 858;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 855;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 842;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 845;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 851;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 856;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 844;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 859;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 843;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 854;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 849;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 846;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 852;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 848;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 857;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 850;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 853;
DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = 847;





SELECT *
FROM tc_para_adicionar;

SELECT *
FROM novas_mc mc;

SELECT *
FROM rac_para_adicionar rac;


