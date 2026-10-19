SELECT * FROM  basico.turma_serie  WHERE id_turma_serie = 83942241;  83942241


--backup EICM2INT
UPDATE basico.turma_serie SET id_curriculo_medio = 72759224 WHERE id_turma_serie = 72424877;



UPDATE basico.turma_serie SET id_curriculo_medio = 83942950 WHERE id_turma_serie = 83942241;

UPDATE basico.turma_serie SET id_curriculo_medio = 51876684 WHERE id_turma_serie = 83942241;

SET id_curriculo_medio = 83942950;


SELECT * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico  = 51876684;

--o curriculo tem essa escola EMEITI NOSSA INFANCIA RUI AMORIM 

SELECT ts.* FROM basico.curriculo_basico cb 
JOIN basico.turma_serie ts ON ts.id_curriculo_medio = cb.id_curriculo_basico 
WHERE cb.id_curriculo_basico = 51876684 AND cb.ativo; AND ts.id_turma_serie = 83942241;


SELECT * FROM escola.escola e WHERE e.nome ILIKE '%NOSSA INFANCIA JOANA LIMA%';


SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico = 51876684 ,83942950

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico IN (51876684 ,83942950);


BEGIN;
--PASSO 01
INSERT INTO ensino_infantil.configuracao_relatorio
(id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
VALUES
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 72759158, 4, 5, TRUE, 'EMEITIRB1', NULL, NULL, now(), NULL, FALSE),
	(nextval('ensino_infantil.configuracao_relatorio_seq'), 83942950, 4, 5, TRUE, 'EMEITIG3', NULL, NULL, now(), NULL, FALSE);


--PASSO 02
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(
    id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio, maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo
)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_seq') AS id_configuracao_relatorio_componente, cr.id_configuracao_relatorio, foo.id_componente_curricular, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN 1
ELSE 2
    END AS id_tipo_avaliacao_componente_relatorio, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN 9999
ELSE NULL
    END AS maximo_caracteres_relatorio, TRUE AS ativo, NULL AS id_registro_cadastro, NULL AS id_registro_atualizacao, current_date AS data_cadastro, NULL AS data_alteracao, CASE
        WHEN foo.id_componente_curricular IN (519, 520) THEN FALSE
ELSE TRUE
    END AS possui_parecer_final_fixo, TRUE AS possui_parecer_final_descritivo
FROM ensino_infantil.configuracao_relatorio cr
CROSS JOIN
    UNNEST(ARRAY[283, 513, 514, 515, 516, 517, 518, 519, 520]) AS foo (id_componente_curricular)
WHERE  cr.id_curriculo_basico IN (72759158,83942950)
ORDER BY
    cr.id_configuracao_relatorio, foo.id_componente_curricular;

--PASSO 03
WITH configuracao_relatorio_referencia AS (
	SELECT cr.id_curriculo_basico, crc.id_configuracao_relatorio, crc.id_componente_curricular, crch.id_configuracao_relatorio_componente, crch.id_habilidade_competencia
FROM ensino_infantil.configuracao_relatorio_componente_habilidade crch
JOIN ensino_infantil.configuracao_relatorio_componente crc
	USING(id_configuracao_relatorio_componente)
JOIN ensino_infantil.configuracao_relatorio cr
	USING(id_configuracao_relatorio)
WHERE cr.id_configuracao_relatorio IN (43, 45)
	AND crch.ativo
ORDER BY 
		crc.id_configuracao_relatorio = 45, crc.id_configuracao_relatorio = 43, crch.id_configuracao_relatorio_componente, crch.id_configuracao_relatorio_componente_habilidade
), curriculo_associacao AS (
	SELECT *
FROM(
VALUES
		(72759158, 61640504), --EMEITIB1
		(83942950, 61639553)--EMEITIM2
	) AS foo (id_cb_alvo, id_cb_referencia)
)
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo)
SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), crc.id_configuracao_relatorio_componente, crr.id_habilidade_competencia, TRUE
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio = cr.id_configuracao_relatorio
JOIN curriculo_associacao ca ON
ca.id_cb_alvo = cr.id_curriculo_basico
JOIN configuracao_relatorio_referencia crr ON
crr.id_curriculo_basico = ca.id_cb_referencia
AND crr.id_componente_curricular = crc.id_componente_curricular
WHERE cr.id_curriculo_basico IN (72759158, 83942950);


--===========PARTE QUE MUDA A PARA A NOVA CONFIGURAÇÃO ===============
--Solução Trocar estrutura da turma EICM2INT para EMEITIG3 a nova
UPDATE basico.turma_serie SET id_curriculo_medio = 83942950 WHERE id_turma_serie = 83942241;


/*DROP TABLE tc_para_adicionar;
DROP TABLE novas_mc;*/

--PASSO 01 ----- CRIAÇÃO DE TURMA COMPONENTE
SELECT DISTINCT 
    nextval('ensino.turma_seq') id_turma,( SELECT t.id_turma
FROM ensino.turma t
WHERE t.id_turma_serie = tsa.id_turma_serie
AND t.id_disciplina = 220
LIMIT 1) AS id_turma_agrupadora, tsa.ano, tsa.periodo, 1 id_situacao_turma, tsa.capacidade_aluno, cbc.id_componente_curricular id_disciplina, tsa.nome codigo, NULL observacao, 1 tipo, tsa.data_cadastro, tsa.id_turma_serie, cbc.ordem, NULL
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON
    cbc.id_curriculo_basico = tsa.id_curriculo_medio
AND tsa.id_turma_serie IN(83942241)
AND cbc.id_componente_curricular IN (283, 518, 519, 520)
WHERE tsa.ativo;

---BACKUP
-- #1 backup  das TURMA COMPONENTE
SELECT 'UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar;


-- #1 insert das TURMAS COMPONENTE 
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora,processada, processada_rematricula
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), id_turma_serie, ordem, null, id_turma_agrupadora, FALSE, false
FROM tc_para_adicionar;


-- --PASSO 02 Criação de Novas Matrículas Componentes
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

-- #2 backup Matrículas Componentes
SELECT 'UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = ' || mc.id_matricula_componente || ';'
FROM novas_mc mc;

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

--ROLLBACK;

COMMIT;
