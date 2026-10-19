BEGIN 

UPDATE basico.turma_serie SET id_tipo_turma_serie = 3 WHERE id_turma_serie = 51925127;

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
    WHERE ts.id_turma_serie = 51925127
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;


-- Cria a sequência de nomes para as sub-turmas
WITH sub_turmas_a_criar AS (
    SELECT
        taa.id_turma_serie_agrupadora,
        taa.id_curriculo_medio_associado,
        taa.tipo_diario_associado,
        taa.id_turno_turma_agrupadora_novo AS id_turno_novo, 
        taa.id_escola_turma_agrupadora,
        taa.id_serie_associada,
        taa.ano_turma_agrupadora,
        taa.capacidade_aluno_agrupadora,
        taa.data_cadastro_agrupadora,
        taa.descricao_horario_agrupadora,
        taa.numero_estudantes_agrupadora,
        taa.regra_nao_agrupadora,
        taa.nome_turma_agrupadora, 
        ROW_NUMBER() OVER (PARTITION BY taa.id_turma_serie_agrupadora ORDER BY taa.id_curriculo_medio_associado) - 1 AS sequencial_nome
    FROM
        turmas_agrupadora_e_associadas_sub taa
    LEFT JOIN
        basico.turma_serie ts_existente ON ts_existente.id_turma_serie_agrupadora = taa.id_turma_serie_agrupadora
                                       AND ts_existente.id_curriculo_medio = taa.id_curriculo_medio_associado
                                       AND ts_existente.ativo IS TRUE
    WHERE
        ts_existente.id_turma_serie IS NULL 
)
SELECT
    nextval('hibernate_sequence') AS id_turma_serie, 
    stac.ano_turma_agrupadora AS ano,
    stac.id_serie_associada AS id_serie,
    stac.id_turno_novo AS id_turno, 
    stac.id_escola_turma_agrupadora AS id_escola,
    stac.id_curriculo_medio_associado AS id_curriculo_medio,
    stac.id_turma_serie_agrupadora,
    stac.tipo_diario_associado AS tipo_diario,
    stac.nome_turma_agrupadora || '-M' || stac.sequencial_nome AS nome, 
    TRUE AS ativo,
    stac.capacidade_aluno_agrupadora AS capacidade_aluno,
    stac.data_cadastro_agrupadora AS data_cadastro,
    stac.descricao_horario_agrupadora AS descricao_horario,
    stac.numero_estudantes_agrupadora AS numero_estudantes,
    stac.regra_nao_agrupadora AS regra_nao,
    2 AS id_tipo_turma_serie 
INTO TEMP novas_turmas_serie_sub
FROM sub_turmas_a_criar stac;

-- Geração de script SQL para backup dos DELETEs das novas turmas_serie
SELECT
    'DELETE FROM basico.turma_serie WHERE id_turma_serie = ' || id_turma_serie || ';'
FROM novas_turmas_serie_sub;


-- #2.1 - Insert das novas basico.turma_serie
INSERT INTO basico.turma_serie (
    id_turma_serie, ano, id_serie, id_turno, id_escola, id_curriculo_medio,
    id_turma_serie_agrupadora, tipo_diario, nome, ativo, capacidade_aluno,
    data_cadastro, descricao_horario, numero_estudantes, regra_nao, id_tipo_turma_serie
)
SELECT
    id_turma_serie, ano, id_serie, id_turno, id_escola, id_curriculo_medio,
    id_turma_serie_agrupadora, tipo_diario, nome, ativo, capacidade_aluno,
    data_cadastro, descricao_horario, numero_estudantes, regra_nao, id_tipo_turma_serie
FROM novas_turmas_serie_sub;

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
WHERE ts.id_turma_serie_agrupadora IS NOT NULL
  AND ts.ativo IS TRUE
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);

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
    )
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

   
   COMMIT;