select * from basico.matricula_estudante_serie mes where mes.id_turma_serie = 52250892;

select * from basico.turma_serie ts where ts.id_turma_serie = 52250892; 

select * from basico.curriculo_basico_serie_multisseriada cbsm where cbsm.id_curriculo_basico=  52250893;

select * from ensino.turma; where cb.id_curriculo_basico = 52316589;


select * from 

--52250893 -- EIMSMP4E5A-M0

--52250894 --EIMSMP4E5A-M1

DELETE FROM ensino.turma
WHERE id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    WHERE t.id_disciplina IN (229, 230, 238)
      AND t.id_turma_serie = 52250892
);

BEGIN ;

rollback;

UPDATE basico.turma_serie SET id_curriculo_medio=52316598 WHERE id_turma_serie=52250893; 
UPDATE basico.turma_serie SET id_curriculo_medio=52316589 WHERE id_turma_serie=52250894; 

INSERT INTO ensino.turma (ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente, permite_multiplos_professores) VALUES(2025, 1, 1, 90, NULL, NULL, NULL, NULL, 229, NULL, nextval('ensino.turma_seq'), 'EIMSMP4E5A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-01-06 15:08:42.714', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 687290, false, NULL, 52250892, NULL, false, false, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, false);
INSERT INTO ensino.turma (ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente, permite_multiplos_professores) VALUES(2025, 1, 1, 90, NULL, NULL, NULL, NULL, 230, NULL, nextval('ensino.turma_seq'), 'EIMSMP4E5A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-01-06 15:08:42.714', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 687290, false, NULL, 52250892, NULL, false, false, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, 1, false);
INSERT INTO ensino.turma (ano, periodo, id_situacao_turma, capacidade_aluno, total_matriculados, "local", data_inicio, data_fim, id_disciplina, codmerg, id_turma, codigo, id_plano_curso, total_reservados, total_espera, status, vagas_reservadas, descricao_horario, repeticaohorario, id_convenio, id_especializacao_turma_entrada, id_turma_bloco, observacao, distancia, id_polo, id_curso, tipo, processada, total_solicitacoes, processamento_rematricula, id_registro_cadastro, data_cadastro, id_registro_atualizacao, data_alteracao, id_campus_ies, processada_rematricula, id_usuario_consolidacao, data_consolidacao, nome_professor, id_turma_agrupadora, agrupadora, id_turno, id_turma_serie, codigo_rh, nota, extra, numero_estudantes, grupo, categoria_esportiva, id_modulo, id_turma_auxiliar, ordem, execucao, execucao_parcial_qtd_unidades, motivo_exclusao, id_categoria_componente, permite_multiplos_professores) VALUES(2025, 1, 1, 90, NULL, NULL, NULL, NULL, 238, NULL, nextval('ensino.turma_seq'), 'EIMSMP4E5A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-01-06 15:08:42.714', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 687290, false, NULL, 52250892, NULL, false, false, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 1, false);

WITH turmas_e_curriculos_associados AS (
    SELECT
        ts.id_turma_serie AS id_turma_serie_agrupadora,
        ts.id_curriculo_medio AS id_curriculo_agrupador,
        cb.id_curriculo_basico AS id_curriculo_medio_associado,
        cb.tipo_diario AS tipo_diario_associado,
        ts.id_turno AS id_turno_turma_agrupadora,
        ts.id_turno AS id_turno_turma_agrupadora_novo, 
        cb.id_serie AS id_serie_associada,
        ts.nome AS nome_turma_agrupadora,
        ts.ano AS ano_turma_agrupadora,
        ts.id_escola AS id_escola_turma_agrupadora,
        ts.capacidade_aluno AS capacidade_aluno_agrupadora,
        ts.data_cadastro AS data_cadastro_agrupadora,
        ts.descricao_horario AS descricao_horario_agrupadora,
        ts.numero_estudantes AS numero_estudantes_agrupadora,
        ts.regra_nao AS regra_nao_agrupadora
    FROM basico.turma_serie ts
    JOIN basico.curriculo_basico_serie_multisseriada cbsm ON cbsm.id_curriculo_basico = ts.id_curriculo_medio
    JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada
    WHERE ts.id_turma_serie = 52250892
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;

---- ============================================
----- CRIAÇÃO/GERENCIAMENTO DE TURMA COMPONENTE PARA SUB-TURMAS
----- ============================================

--- ===========================================================================
--- #3.0 - Unifica todas as Turmas Serie de Sub-Turmas que estarão ativas
--- (existentes + novas) para as próximas etapas.
--- ===========================================================================
SELECT
    ts.id_turma_serie,
    ts.id_serie,
    ts.id_curriculo_medio,
    ts.tipo_diario,
    ts.id_turno,
    ts.id_escola,
    ts.id_turma_serie_agrupadora,
    ts.ano,
    ts.nome,
    ts.capacidade_aluno,
    ts.data_cadastro,
    ts.periodo
INTO TEMP turmas_serie_ativas_sub
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora = 52250892
  AND ts.ativo IS true
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);

select * from turmas_serie_ativas_sub;

-- drop table tc_para_adicionar_sub; -- Use com cautela!

-- # select das turmas para adicionar turma (para as sub-turmas ativas)
-- Inclui também a turma polivalente (disciplina 220)
SELECT DISTINCT
    nextval('ensino.turma_seq') id_turma,
    tss.ano,
     tss.periodo, 
    1 AS id_situacao_turma, -- ABERTA
    tss.capacidade_aluno,
    cbc.id_componente_curricular AS id_disciplina,
    tss.nome AS codigo, -- Nome da turma_serie como código
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    cbc.ordem,
    cbc.id_categoria_componente,
    FALSE AS is_polivalente -- Marcador para a turma polivalente
INTO TEMP tc_para_adicionar_sub
FROM
    turmas_serie_ativas_sub tss
JOIN
    basico.curriculo_basico_componente cbc ON cbc.id_curriculo_basico = tss.id_curriculo_medio
WHERE
    NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = cbc.id_componente_curricular
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );
UNION ALL
-- Adiciona a turma Polivalente (id_disciplina = 220) para cada sub-turma com tipo_diario específico
SELECT DISTINCT
    nextval('ensino.turma_seq') id_turma,
    tss.ano,
    tss.periodo,
    1 AS id_situacao_turma,
    tss.capacidade_aluno,
    220 AS id_disciplina, -- Disciplina Polivalente
    tss.nome AS codigo, -- Apenas o nome da turma_serie como código, sem '-POLIVALENTE'
    1 AS observacao,
    1 AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    0 AS ordem, -- Ordem 0 para polivalente
    1 AS id_categoria_componente,
    TRUE AS is_polivalente
FROM
    turmas_serie_ativas_sub tss
WHERE 1=1 
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );


-- #5.1.0 backup para deletar as turmas componentes criadas (sub-turmas)
SELECT
    'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar_sub;

select * 
FROM tc_para_adicionar_sub;

-- #5.2 insert das turmas componentes (sub-turmas)
INSERT INTO ensino.turma (
    id_turma,
    ano,
    periodo,
    id_situacao_turma,
    capacidade_aluno,
    id_disciplina,
    codigo,
    observacao,
    tipo,
    data_cadastro,
    id_turma_serie,
    ordem,
    id_categoria_componente,
    agrupadora -- Polivalente geralmente é agrupadora
)
SELECT
    id_turma,
    ano,
    periodo,
    id_situacao_turma,
    capacidade_aluno,
    id_disciplina,
    codigo,
    observacao,
    tipo,
    data_cadastro::timestamp,
    id_turma_serie,
    ordem,
    id_categoria_componente,
    is_polivalente -- Define como agrupadora se for polivalente
FROM tc_para_adicionar_sub;


-- #7.0 Atualizar id_turma_agrupadora para turmas componentes das sub-turmas
WITH turma_agrupadora_sub_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    JOIN
        turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE
        t.id_disciplina = 220 -- A turma Polivalente da própria sub-turma
        AND t.agrupadora IS TRUE
        AND t.id_situacao_turma <> 4
        AND t.ano = (SELECT DISTINCT ano FROM tc_para_adicionar_sub)
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tais.turma_agrupadora_id
FROM
    turma_agrupadora_sub_existente tais
WHERE
    t_main.id_turma_serie = tais.id_turma_serie
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_disciplina <> 220 -- Apenas para as turmas componentes, não a Polivalente
    AND t_main.id_turma IN (SELECT id_turma FROM tc_para_adicionar_sub WHERE is_polivalente IS FALSE);

--- ## Criação de Novas Matrículas Componentes para Sub-Turmas Ativas

-- #8.0 - Select para Novas Matrículas Componentes (sub-turmas)
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
JOIN ensino.turma t ON t.id_turma_serie = tss.id_turma_serie AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie_multisseriado = tss.id_turma_serie -- MES da turma agrupadora
                                            AND mes.ano_calendario = tss.ano AND mes.id_serie_multisseriado = tss.id_serie;

-- Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');'
FROM novas_mc_sub sub where sub.id_componente_curricular IN (229, 230, 238);


-- #8.1 - Insere Novas Matrículas Componentes (sub-turmas)
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
-- rollback;

   COMMIT;
   
   DELETE from ensino.matricula_componente where id_matricula_componente IN ( 17097393,17097394,17097395,17097396,17097397,17097398,17097399,17097400,17097401,17097402,17097403,17097404,17097405,17097406,17097407,17097408,17097409,17097410,17097411,17097412,17097413,17097414,17097415,17097416,17097417,17097418,17097419,17097420,17097421,17097422,17097423,17097424,17097425,17097426,17097427,17097428,17097429,17097430,17097431,17097432,17097433,17097434,17097435,17097436,17097437,17097438,17097439,17097440,17097441,17097442,17097443,17097444,17097445,17097446,17097447,17097448,17097449,17097450,17097451,17097452,17097453,17097454,17097455,17097456,17097457,17097458,17097459,17097460,17097461,17097462,17097463,17097464,17097465,17097466,17097467,17097468,17097469,17097470,17097471,17097472,17097473,17097474,17097475,17097476,17097477,17097478,17097479,17097480,17097481,17097482,17097483,17097484,17097485,17097486,17097487,17097488,17097489,17097490,17097491,17097492,17097493,17097494,17097495,17097496,17097497,17097498,17097499,17097500,17097501,17097502,17097503,17097504,17097505,17097506,17097507,17097508,17097509,17097510,17097511,17097512,17097513,17097514,17097515,17097516,17097517,17097518,17097519,17097520,17097521,17097522,17097523,17097524,17097525,17097526,17097527,17097528,17097529,17097530,17097531,17097532,17097533,17097534,17097535,17097536,17097537,17097538,17097539,17097540,17097541,17097542,17097543,17097544,17097545,17097546,17097547,17097548,17097549,17097550,17097551,17097552,17097553,17097554,17097555,17097556,17097557,17097558,17097559,17097560,17097561,17097562,17097563,17097564,17097565,17097566,17097567,17097568,17097569,17097570,17097571,17097572,17097573,17097574,17097575,17097576,17097577,17097578,17097579,17097580,17097581,17097582,17097583,17097584,17097585,17097586,17097587,17097588,17097589,17097590,17097591,17097592,17097593,17097594,17097595,17097596,17097597,17097598,17097599);
   
