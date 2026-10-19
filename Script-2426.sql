
BEGIN;

DROP TABLE IF EXISTS tc_apagar;
DROP TABLE IF EXISTS tc_para_adicionar;
DROP TABLE IF EXISTS novas_mc;
DROP TABLE IF EXISTS mc_apagar;
DROP TABLE IF EXISTS turmas_agrupadora_e_associadas_sub;
DROP TABLE IF EXISTS novas_mc_sub;
DROP TABLE IF EXISTS turmas_serie_ativas_sub;

ROLLBACK ;

SELECT DISTINCT 
    nextval('ensino.turma_seq') AS id_turma,
    (
        SELECT t.id_turma
        FROM ensino.turma t
        WHERE t.id_turma_serie = tsa.id_turma_serie
          AND t.id_disciplina = 220
        LIMIT 1
    ) AS id_turma_agrupadora, 
    tsa.ano, 
    tsa.periodo, 
    1 AS id_situacao_turma, 
    tsa.capacidade_aluno,
    cbc.id_categoria_componente, 
    cbc.id_componente_curricular AS id_disciplina, 
    tsa.nome AS codigo, 
    NULL AS observacao, 
    1 AS tipo, 
    tsa.data_cadastro, 
    tsa.id_turma_serie, 
    cbc.ordem, 
    NULL
INTO TEMP tc_para_adicionar
FROM basico.turma_serie tsa
JOIN basico.curriculo_basico_componente cbc ON (
    -- Aqui fazemos a associação exata de cada par (Currículo -> Série)
    (cbc.id_curriculo_basico = 51876318 AND tsa.id_turma_serie = 84777071) OR
    (cbc.id_curriculo_basico = 87271650 AND tsa.id_turma_serie = 84777072) OR
    (cbc.id_curriculo_basico = 51876684 AND tsa.id_turma_serie = 84777073)
)
WHERE tsa.ativo
  AND NOT EXISTS (
      SELECT 1
      FROM ensino.turma t_existente
      WHERE t_existente.id_turma_serie = tsa.id_turma_serie
        AND t_existente.id_disciplina = cbc.id_componente_curricular
        AND t_existente.id_situacao_turma <> 4
  );

---03 BACKUP
SELECT
    'DELETE FROM ensino.turma WHERE id_turma = '|| id_turma || ';' 
FROM tc_para_adicionar;

DELETE FROM ensino.turma WHERE id_turma = 829794;
DELETE FROM ensino.turma WHERE id_turma = 829795;
DELETE FROM ensino.turma WHERE id_turma = 829796;
DELETE FROM ensino.turma WHERE id_turma = 829797;

--03 SOUÇÃO
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turno, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, processada, processada_rematricula
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), 1 , id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, FALSE, FALSE
FROM tc_para_adicionar;


--## PASSO 01
WITH turmas_e_curriculos_associados AS (
    SELECT ts.id_turma_serie AS id_turma_serie_agrupadora, ts.id_curriculo_medio AS id_curriculo_agrupador, cb.id_curriculo_basico AS id_curriculo_medio_associado, cb.tipo_diario AS tipo_diario_associado, ts.id_turno AS id_turno_turma_agrupadora, ts.id_turno AS id_turno_turma_agrupadora_novo, cb.id_serie AS id_serie_associada, ts.nome AS nome_turma_agrupadora, ts.ano AS ano_turma_agrupadora, ts.id_escola AS id_escola_turma_agrupadora, ts.capacidade_aluno AS capacidade_aluno_agrupadora, ts.data_cadastro AS data_cadastro_agrupadora, ts.descricao_horario AS descricao_horario_agrupadora, ts.numero_estudantes AS numero_estudantes_agrupadora, ts.regra_nao AS regra_nao_agrupadora
FROM basico.turma_serie ts
JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico = ts.id_curriculo_medio
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
WHERE ts.id_turma_serie = 84777071
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;

--- ## PASSO 02 - Unifica todas as Turmas Serie 
SELECT ts.id_turma_serie, ts.id_serie, ts.id_curriculo_medio, ts.tipo_diario, ts.id_turno, ts.id_escola, ts.id_turma_serie_agrupadora, ts.ano, ts.nome, ts.capacidade_aluno, ts.data_cadastro, ts.periodo
INTO TEMP turmas_serie_ativas_sub
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (84777071)
AND ts.ativo IS TRUE
AND ts.ano = (
	SELECT DISTINCT ano_turma_agrupadora
	FROM turmas_agrupadora_e_associadas_sub)
AND ts.id_escola IN (
	SELECT DISTINCT id_escola_turma_agrupadora
	FROM turmas_agrupadora_e_associadas_sub);


--## PASSO 03 - Select para Novas Matrículas Componentes (TURMA SERIE PRINCIPAL QUE FALTAVA)
SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente,
       CASE
           WHEN mes.id_situacao_matricula_serie = 1 THEN 2
           WHEN mes.id_situacao_matricula_serie = 2 THEN 5
           WHEN mes.id_situacao_matricula_serie = 3 THEN 6
           WHEN mes.id_situacao_matricula_serie = 4 OR mes.id_situacao_matricula_serie = 9 THEN 4
           WHEN mes.id_situacao_matricula_serie = 5 THEN 3
           WHEN mes.id_situacao_matricula_serie = 6 THEN 9
           ELSE 2
       END AS id_situacao_matricula,
       t.id_turma,
       t.id_disciplina AS id_componente_curricular,
       mes.id_estudante AS id_discente,
       tss.ano,
       1 AS periodo, -- Assumindo período 1
       tss.id_curriculo_medio AS id_curriculo_basico, -- Currículo da sub-turma
       tss.id_turma_serie
INTO TEMP novas_mc_sub
FROM turmas_serie_ativas_sub tss
JOIN ensino.turma t ON t.id_turma_serie IN (84777071,84777072, 84777073)
AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie_multisseriado = tss.id_turma_serie -- MES da turma agrupadora
AND mes.ano_calendario = tss.ano
AND mes.id_serie_multisseriado = tss.id_serie
AND NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = t.id_turma
AND mc.ano = tss.ano
);
                                            
--## PASSO 04 Geração de script SQL para backup dos DELETEs das novas matrículas componentes (TURMA PRINCIPAL)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub ;

DELETE from ensino.matricula_componente where id_matricula_componente IN ( 20965540,20965541,20965542,20965543,20965544,20965545,20965546,20965547,20965548,20965549,20965550,20965551,20965552,20965553,20965554,20965555,20965556,20965557,20965558,20965559,20965560,20965561,20965562,20965563,20965564,20965565,20965566,20965567,20965568,20965569,20965570,20965571,20965572,20965573,20965574,20965575,20965576,20965577,20965578,20965579,20965580,20965581,20965582,20965583,20965584,20965585,20965586,20965587,20965588,20965589,20965590,20965591,20965592,20965593,20965594,20965595,20965596,20965597,20965598,20965599,20965600,20965601,20965602,20965603,20965604,20965605,20965606,20965607,20965608,20965609,20965610,20965611,20965612,20965613,20965614,20965615,20965616,20965617,20965618,20965619,20965620,20965621,20965622,20965623,20965624,20965625,20965626,20965627,20965628,20965629,20965630,20965631,20965632,20965633,20965634,20965635,20965636,20965637,20965638,20965639,20965640,20965641,20965642,20965643,20965644,20965645,20965646,20965647,20965648,20965649,20965650,20965651,20965652,20965653,20965654,20965655,20965656,20965657,20965658,20965659,20965660,20965661,20965662,20965663,20965664,20965665,20965666,20965667,20965668,20965669,20965670,20965671,20965672,20965673,20965674,20965675,20965676,20965677,20965678,20965679,20965680,20965681,20965682,20965683,20965684,20965685,20965686,20965687,20965688,20965689,20965690,20965691,20965692,20965693,20965694,20965695,20965696,20965697,20965698,20965699,20965700,20965701,20965702,20965703,20965704,20965705,20965706,20965707,20965708,20965709,20965710,20965711,20965712,20965713,20965714,20965715);


--## PASSO 05 - Insere Novas Matrículas Componentes (TURMA PRINCIPAL)
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo
FROM novas_mc_sub tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma = tm.id_turma
      AND mc.ano = tm.ano
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);

SELECT * FROM novas_mc_sub;
-- rollback;

COMMIT;	

ROLLBACK;