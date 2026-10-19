BEGIN;

---##00 - Atualiza tipo_diário no currículo e nas turmas_serie
UPDATE basico.curriculo_basico
SET tipo_diario = 24
WHERE id_curriculo_basico = 67491385;

UPDATE basico.turma_serie
SET tipo_diario = 24
WHERE id_turma_serie IN (67491392, 67743723);

---##TABELA 01 - Turmas série ativas do Berçário
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
WHERE ts.id_turma_serie IN (67491392, 67743723)
  AND ts.ativo IS TRUE;

---##TABELA 02 - Cria turma componente Polivalente (agrupadora)
SELECT DISTINCT
    nextval('ensino.turma_seq') AS id_turma,
    tss.ano,
    tss.periodo,
    1                           AS id_situacao_turma,
    tss.capacidade_aluno,
    220                         AS id_disciplina,
    tss.nome                    AS codigo,
    1                           AS observacao,
    1                           AS tipo,
    tss.data_cadastro,
    tss.id_turma_serie,
    0                           AS ordem,
    1                           AS id_categoria_componente,
    TRUE                        AS is_polivalente
INTO TEMP tc_para_adicionar_sub
FROM turmas_serie_ativas_sub tss
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.turma t
    WHERE t.id_turma_serie = tss.id_turma_serie
      AND t.id_disciplina = 220
      AND t.id_situacao_turma <> 4
);

---##BACKUP - DELETEs das turmas componentes que serão inseridas
SELECT 'DELETE FROM ensino.turma WHERE id_turma = ' || id_turma || ';'
FROM tc_para_adicionar_sub;

---##INSERT - Turma componente Polivalente
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
    agrupadora
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
    is_polivalente
FROM tc_para_adicionar_sub;

---##PASSO 03 - Gera UPDATEs para apontar id_turma_agrupadora nos componentes existentes
WITH turma_agrupadora AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM ensino.turma t
    JOIN turmas_serie_ativas_sub tss ON t.id_turma_serie = tss.id_turma_serie
    WHERE t.id_disciplina = 220
      AND t.agrupadora IS TRUE
      AND t.id_situacao_turma <> 4
      AND t.ano = 2026
)
SELECT
    'UPDATE ensino.turma SET id_turma_agrupadora = ' || ta.turma_agrupadora_id
        || ' WHERE id_turma = ' || t.id_turma || ';' AS SOLUCAO,
    'UPDATE ensino.turma SET id_turma_agrupadora = '
        || COALESCE(t.id_turma_agrupadora::text, 'NULL')
        || ' WHERE id_turma = ' || t.id_turma || ';' AS BACKUP
FROM ensino.turma t
JOIN turma_agrupadora ta ON t.id_turma_serie = ta.id_turma_serie
WHERE t.id_disciplina <> 220
  AND t.id_situacao_turma <> 4
  AND t.id_turma_serie IN (67491392, 67743723);



UPDATE ensino.turma SET id_turma_agrupadora = 749168 WHERE id_turma = 746549;
UPDATE ensino.turma SET id_turma_agrupadora = 749168 WHERE id_turma = 746550;
UPDATE ensino.turma SET id_turma_agrupadora = 749168 WHERE id_turma = 746551;
UPDATE ensino.turma SET id_turma_agrupadora = 749168 WHERE id_turma = 746552;
UPDATE ensino.turma SET id_turma_agrupadora = 749168 WHERE id_turma = 746548;
UPDATE ensino.turma SET id_turma_agrupadora = 749169 WHERE id_turma = 749077;
UPDATE ensino.turma SET id_turma_agrupadora = 749169 WHERE id_turma = 749078;
UPDATE ensino.turma SET id_turma_agrupadora = 749169 WHERE id_turma = 749079;
UPDATE ensino.turma SET id_turma_agrupadora = 749169 WHERE id_turma = 749080;
UPDATE ensino.turma SET id_turma_agrupadora = 749169 WHERE id_turma = 749081;


---##TABELA 04 - Gera as novas matrículas componentes para o Polivalente
SELECT
    nextval('ensino.matricula_componente_seq') AS id_matricula_componente,
    CASE
        WHEN mes.id_situacao_matricula_serie = 1 THEN 2
        WHEN mes.id_situacao_matricula_serie = 2 THEN 5
        WHEN mes.id_situacao_matricula_serie = 3 THEN 6
        WHEN mes.id_situacao_matricula_serie IN (4, 9) THEN 4
        WHEN mes.id_situacao_matricula_serie = 5 THEN 3
        WHEN mes.id_situacao_matricula_serie = 6 THEN 9
        ELSE 2
    END                         AS id_situacao_matricula,
    t.id_turma,
    t.id_disciplina             AS id_componente_curricular,
    mes.id_estudante            AS id_discente,
    tss.ano,
    1                           AS periodo,
    tss.id_curriculo_medio      AS id_curriculo_basico,
    tss.id_turma_serie
INTO TEMP novas_mc_sub
FROM turmas_serie_ativas_sub tss
JOIN ensino.turma t
    ON t.id_turma_serie = tss.id_turma_serie
   AND t.id_situacao_turma <> 4
JOIN basico.matricula_estudante_serie mes
    ON mes.id_turma_serie = tss.id_turma_serie
   AND mes.ano_calendario = tss.ano;

---##BACKUP - DELETEs das matrículas que serão inseridas
SELECT 'DELETE FROM ensino.matricula_componente WHERE id_matricula_componente IN ('
       || string_agg(id_matricula_componente::TEXT, ',')
       || ');'
FROM novas_mc_sub
WHERE id_componente_curricular = 220;

---##INSERT - Matrículas componentes no Polivalente
INSERT INTO ensino.matricula_componente (
    id_matricula_componente,
    id_situacao_matricula,
    id_turma,
    id_componente_curricular,
    id_discente,
    ano,
    periodo
)
SELECT
    tm.id_matricula_componente,
    tm.id_situacao_matricula,
    tm.id_turma,
    tm.id_componente_curricular,
    tm.id_discente,
    tm.ano,
    tm.periodo
FROM novas_mc_sub tm
WHERE tm.id_componente_curricular = 220
  AND NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma              = tm.id_turma
      AND mc.ano                   = tm.ano
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente           = tm.id_discente
);

-- rollback;
COMMIT;