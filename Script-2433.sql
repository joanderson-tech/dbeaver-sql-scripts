BEGIN;

ROLLBACK;

UPDATE basico.turma_serie 	SET id_curriculo_medio=61639524	WHERE id_turma_serie=84777072;
UPDATE basico.turma_serie 	SET id_curriculo_medio=61639553	WHERE id_turma_serie=84777073;

DROP TABLE tc_para_adicionar;

DROP TABLE novas_mc;

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
    (cbc.id_curriculo_basico = 87271650 AND tsa.id_turma_serie = 84777071) OR
    (cbc.id_curriculo_basico = 61639524 AND tsa.id_turma_serie = 84777072) OR
    (cbc.id_curriculo_basico = 61639553 AND tsa.id_turma_serie = 84777073)
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
    'DELETE FROM ensino.turma WHERE id_turma IN ( ' || string_agg(id_turma::TEXT,',') || ');' 
FROM tc_para_adicionar;



SELECT * FROM tc_para_adicionar;

--03 SOUÇÃO
INSERT INTO ensino.turma (
	id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, data_cadastro, id_turno, id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, processada, processada_rematricula
)
SELECT id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, observacao, tipo, now(), 1 , id_turma_serie, ordem, id_categoria_componente, id_turma_agrupadora, FALSE, FALSE
FROM tc_para_adicionar;


--## 04 Criação de Novas Matrículas Componentes (Para turmas Novas e Existentes)
WITH criar_MC AS (
    SELECT 
        nextval('ensino.matricula_componente_seq') AS id_matricula_componente, 
        CASE 
            WHEN mes.id_situacao_matricula_serie = 1 THEN 2
            WHEN mes.id_situacao_matricula_serie = 2 THEN 5
            WHEN mes.id_situacao_matricula_serie = 3 THEN 6
            WHEN mes.id_situacao_matricula_serie = 4 OR mes.id_situacao_matricula_serie = 9 THEN 4
            WHEN mes.id_situacao_matricula_serie = 5 THEN 3
            WHEN mes.id_situacao_matricula_serie = 6 THEN 9
            ELSE 2
        END AS id_situacao_matricula, 
        t.id_turma, -- Mudou aqui: pega o ID da tabela real de turmas
        t.id_disciplina AS id_componente_curricular, 
        mes.id_estudante AS id_discente, 
        t.ano, 
        t.periodo, 
        t.id_turma_serie, 
        mes.id_matricula_discente_serie AS id_matricula_estudante_serie
    FROM basico.matricula_estudante_serie mes
    -- Buscamos a turma na tabela real, seja ela antiga ou recém-criada
    JOIN ensino.turma t ON (
        t.id_turma_serie = mes.id_turma_serie 
        OR t.id_turma_serie = mes.id_turma_serie_multisseriado
    )
    -- Mantemos o filtro das séries específicas que você está processando
    WHERE mes.id_turma_serie IN (84777071, 84777072, 84777073)
      AND t.id_situacao_turma <> 4
)
SELECT DISTINCT *
INTO TEMP novas_mc
FROM criar_MC tm
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.matricula_componente mc
    WHERE mc.id_turma = tm.id_turma
      AND mc.id_discente = tm.id_discente
      AND mc.ano = tm.ano
);



-- 04 BACKUP
SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente IN ( ' || string_agg(id_matricula_componente::TEXT,',') || ');' 
FROM novas_mc sub;

DELETE from ensino.matricula_componente where id_matricula_componente IN ( 20967366,20967367,20967386,20967387,20967406,20967407,20967426,20967427,20967446,20967447,20967466,20967467,20967486,20967487,20967506,20967507,20967526,20967527,20967546,20967547,20967566,20967567,20967586,20967587,20967606,20967607,20967626,20967627,20967646,20967647,20967666,20967667);

-- 04 insert das Novas Matrículas Componentes
INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo, id_matricula_estudante_serie)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo, id_matricula_estudante_serie
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1
FROM ensino.matricula_componente mc
WHERE mc.id_turma = tm.id_turma
AND mc.ano = tm.ano
AND mc.id_situacao_matricula = tm.id_situacao_matricula
AND mc.id_discente = tm.id_discente);


SELECT * FROM novas_mc;


COMMIT;


-- Executa a inserção das matrículas que estavam faltando
INSERT INTO ensino.matricula_componente (
    id_matricula_componente, id_situacao_matricula, id_turma, 
    id_componente_curricular, id_discente, ano, periodo, 
    id_turma_serie, id_matricula_estudante_serie
)
SELECT * FROM novas_mc;

DROP TABLE IF EXISTS novas_mc;


ROLLBACK;

SELECT * FROM novas_mc;


SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico IN ( 87271650) ; ---87271650 -- G2E3-INT

