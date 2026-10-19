
BEGIN ;

--## 01 ATUALIZANDO PARA A CURRICULO CORRETO 
UPDATE basico.turma_serie 	SET id_curriculo_medio=61639524	WHERE id_turma_serie=84777072;
UPDATE basico.turma_serie 	SET id_curriculo_medio=61639553	WHERE id_turma_serie=84777073;

--## 02
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
    WHERE ts.id_turma_serie = 84777071
)
SELECT *
 INTO TEMP turmas_agrupadora_e_associadas_sub
FROM turmas_e_curriculos_associados;

--## 03 CRIAÇÃO/GERENCIAMENTO DE TURMA COMPONENTE PARA TURMA E SUB-TURMAS
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
WHERE ts.id_turma_serie_agrupadora = 84777071 OR ts.id_turma_serie =  84777071
  AND ts.ativo IS true
  AND ts.ano = (SELECT DISTINCT ano_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub) 
  AND ts.id_escola IN (SELECT DISTINCT id_escola_turma_agrupadora FROM turmas_agrupadora_e_associadas_sub);

--## 04 select das turmas para adicionar turma 
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


--## 05 backup para deletar as turmas componentes criadas (sub-turmas)
SELECT 'DELETE FROM ensino.turma WHERE id_turma IN ( ' || string_agg(id_turma::TEXT,', ') || ');' 
FROM tc_para_adicionar_sub;

--## 06 insert das turmas componentes (sub-turmas)
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


--## 07 Atualizar id_turma_agrupadora para turmas componentes 
WITH turma_agrupadora_sub_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM ensino.turma t
    JOIN turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE
        t.id_disciplina = 220 
        AND t.agrupadora IS TRUE
        AND t.id_situacao_turma <> 4
        AND t.ano = (SELECT DISTINCT ano FROM tc_para_adicionar_sub)
)
SELECT 
    -- SOLUCAO:
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || tais.turma_agrupadora_id || ' WHERE id_turma = ' || t_main.id_turma || ';' AS SOLUCAO,
    --  BACKUP: 
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || COALESCE(t_main.id_turma_agrupadora::text, 'NULL') || ' WHERE id_turma = ' || t_main.id_turma || ';' AS BACKUP
FROM 
    ensino.turma AS t_main
JOIN turma_agrupadora_sub_existente tais ON t_main.id_turma_serie = tais.id_turma_serie
WHERE t_main.id_categoria_componente <> 2
AND t_main.id_disciplina <> 220;

--## 08 - Select para Novas Matrículas Componentes (sub-turmas)
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
                                            AND mes.ano_calendario = tss.ano AND mes.id_serie_multisseriado = tss.id_serie
                                            
--## 09 Geração de script SQL para backup dos DELETEs das novas matrículas componentes (sub-turmas)
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');' 
FROM novas_mc_sub tm 
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma = tm.id_turma
      AND mc.ano = tm.ano
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);


--## 10 - Insere Novas Matrículas Componentes (sub-turmas)
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


COMMIT;

--ROLLBACK;
   
