SELECT * FROM basico.turma_serie ts WHERE id_turma_serie = 83942197;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 83942198;

(283, 518, 519, 520)


BEGIN;

--PASSO 01

/*DROP TABLE tc_para_adicionar;
DROP TABLE novas_mc;*/

--PASSO 02 ----- CRIAÇÃO DE TURMA COMPONENTE
SELECT DISTINCT 
    nextval('ensino.turma_seq') id_turma,( SELECT t.id_turma
FROM ensino.turma t
WHERE t.id_turma_serie = tsa.id_turma_serie
AND t.id_disciplina = 220
LIMIT 1) AS id_turma_agrupadora, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, null observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, null
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON
    cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND tsa.id_turma_serie in(83942198) 
AND cbc.id_componente_curricular IN (283, 518, 519, 520)
WHERE tsa.ativo;

-- #2 insert das TURMAS COMPONENTE 
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora,processada, processada_rematricula
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), id_turma_serie, ordem, null, id_turma_agrupadora, FALSE, false
FROM tc_para_adicionar;

SELECT * FROM tc_para_adicionar;

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

SELECT * FROM novas_mc;

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

/*--PASSO 04
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
FROM rac_para_adicionar;*/


---BACKUP
-- #2 backup  das turmas 
SELECT 'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar;

-- #3 backup Matrículas Componentes
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM novas_mc mc;

/*-- #4 backup Matrículas Componentes
SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente = ' || rac.id_relatorio_avaliativo_componente || ';'
FROM rac_para_adicionar rac;*/

ROLLBACK;

COMMIT;



UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908059;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908060;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908061;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908062;



UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134801;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134802;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134803;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134804;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134805;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134806;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134807;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134808;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134809;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134810;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134811;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134812;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134813;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134814;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134815;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134816;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134817;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134818;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134819;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134820;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134821;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134822;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134823;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134824;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134825;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134826;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134827;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134828;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134829;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134830;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134831;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134832;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134833;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134834;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134835;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134836;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134837;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134838;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134839;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134840;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134841;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134842;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134843;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134844;

