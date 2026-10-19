BEGIN;

ROLLBACK;

UPDATE basico.curriculo_basico SET tipo_diario = 31 WHERE id_curriculo_basico = 67566418;
UPDATE basico.turma_serie SET tipo_diario = 31 WHERE id_turma_serie IN (67642073, 67928169, 70199566);
---##TABELA 01
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
WHERE ts.id_curriculo_medio  IN (67566418)
AND ts.ativo IS TRUE;

-- ---##TABELA 02 Adiciona a turma Polivalente 
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
    INTO TEMP tc_para_adicionar_sub
FROM
    turmas_serie_ativas_sub tss
WHERE 1=1 
    AND NOT EXISTS (
        SELECT 1 FROM ensino.turma t
        WHERE t.id_turma_serie = tss.id_turma_serie
          AND t.id_disciplina = 220
          AND t.id_situacao_turma <> 4 -- Já existe e não está inativa
    );

---##02 backup para deletar as turmas componentes criadas 
SELECT 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';' FROM tc_para_adicionar_sub;
---##02 Solução insert das turmas componentes 
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

---##03 Atualizar id_turma_agrupadora para turmas componentes 
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
        AND t.ano in (SELECT DISTINCT ano FROM tc_para_adicionar_sub)
)
SELECT 
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || COALESCE(t_main.id_turma_agrupadora::text, 'NULL') || ' WHERE id_turma = ' || t_main.id_turma || ';' AS BACKUP
FROM ensino.turma AS t_main
JOIN turma_agrupadora_sub_existente tais ON t_main.id_turma_serie = tais.id_turma_serie
WHERE t_main.id_categoria_componente <> 2
AND t_main.id_disciplina <> 220;

--Solução
---##03 Atualização Direta do id_turma_agrupadora
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
        AND t.ano IN (SELECT DISTINCT ano FROM tc_para_adicionar_sub)
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tais.turma_agrupadora_id
FROM turma_agrupadora_sub_existente tais
WHERE t_main.id_turma_serie = tais.id_turma_serie
  AND t_main.id_categoria_componente <> 2
  AND t_main.id_disciplina <> 220;

---##04 - Select para Novas Matrículas Componentes
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
JOIN ensino.turma t ON t.id_turma_serie = tss.id_turma_serie
AND t.id_situacao_turma <> 4 AND t.id_disciplina = 220
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = tss.id_turma_serie
AND mes.ano_calendario = tss.ano
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc
    WHERE mc.id_discente = mes.id_estudante
      AND mc.id_turma = t.id_turma
      AND mc.id_componente_curricular = 220
);
---##04 Geração de script SQL para backup dos DELETEs das novas matrículas componentes 
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente = ' || id_matricula_componente || ';'
FROM novas_mc_sub sub where sub.id_componente_curricular IN (220);

---##04 - Insere Novas Matrículas Componentes
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