-- Ajustes do horÃ¡rio turma 
UPDATE ensino.horario_turma SET data_inicio = '2024-03-04' WHERE id_horario_turma IN  (1421252,1421253,1421257,1420982,1420987);
DELETE FROM ensino.horario_turma WHERE id_turma IN (683102, 683309) AND id_horario_turma NOT  IN  (1421252,1421253,1421257,1420982,1420987);

-- =======
-- Atualizar os registros de frequÃªncia para o id_turma = 683309,683102
WITH
    -- Identificar os registros de segunda-feira e calcular nova data para quarta-feira posterior
    segunda_para_quarta AS (
        SELECT
            fa.id_frequencia,
            fa.data,
            fa.id_discente,
            fa.id_turma,
            CASE
                WHEN EXTRACT(DOW FROM fa.data) = 1 THEN fa.data + 2  -- Segunda para quarta-feira
            END AS nova_data
        FROM
            ensino.frequencia_aluno fa
        WHERE
            fa.id_turma = 683309
            AND EXTRACT(DOW FROM fa.data) = 1
            AND fa.ativo
    ),
    -- Identificar os registros de sexta-feira e calcular nova data para quinta-feira anterior
    sexta_para_quinta AS (
        SELECT
            fa.id_frequencia,
            fa.data,
            fa.id_discente,
            fa.id_turma,
            CASE
                WHEN EXTRACT(DOW FROM fa.data) = 5 THEN fa.data - 1  -- Sexta para quinta-feira
            END AS nova_data
        FROM
            ensino.frequencia_aluno fa
        WHERE
            fa.id_turma IN (683309,683102)
            AND EXTRACT(DOW FROM fa.data) = 5
            AND fa.ativo
    ),
    -- Combinar os resultados das duas alteraÃ§Ãµes
    registros_para_atualizar AS (
        SELECT * FROM segunda_para_quarta
        UNION ALL
        SELECT * FROM sexta_para_quinta
    ),
    -- Filtrar os conflitos de horÃ¡rio para nÃ£o permitir duplicidade
    horarios_validos AS (
        SELECT
            r.id_frequencia,
            r.nova_data,
            r.id_discente
        FROM
            registros_para_atualizar r
        WHERE NOT EXISTS (
            SELECT 1
            FROM ensino.frequencia_aluno fa
            WHERE
                fa.id_turma = r.id_turma
                AND fa.id_discente = r.id_discente
                AND fa.ativo = true
                AND fa.data = r.nova_data
        )
    )
-- Realizar o UPDATE
SELECT 
    'UPDATE ensino.frequencia_aluno SET data = '''|| hv.nova_data || ''' WHERE id_frequencia = ' || fa.id_frequencia || ';' solucao,
    'UPDATE ensino.frequencia_aluno SET data = ''' || fa.data || '''  WHERE id_frequencia = ' || fa.id_frequencia || ';' backup
FROM
    horarios_validos hv
    JOIN ensino.frequencia_aluno fa ON fa.id_frequencia = hv.id_frequencia
WHERE 1=1;

-- Ajuste frequÃªncia turma

SELECT 
ts.id_turma_serie ,
ts.nome ,
e.id_escola ,
e.nome,
t.id_turma ,
dt.id_docente_turma ,
dt.data_inicio || ' -> ' || dt.data_fim AS alocacao,
dt.ativo ,
dt.finalizada ,
t.id_situacao_turma, t.id_disciplina,
t.id_turma_agrupadora ,
t.id_categoria_componente ,
t.execucao 
FROM basico.turma_serie ts 
JOIN escola.escola e ON e.id_escola = ts.id_escola 
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
LEFT JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma 
WHERE  1=1 --ts.ativo 
AND ts.ano = 2024
AND ts.nome = 'EJAF1N2PB'
AND (ts.id_turma_serie = 51886293 )
--AND e.nome ILIKE '%ESCOLA PEDRO TENORIO RAPOSO%'
--AND dt.id_docente = 5
AND t.id_situacao_turma <> 4;

-- Criar um backup dos registros que serÃ£o alterados
WITH 
    backup_dados AS (
        SELECT *
        FROM ensino.frequencia_turma ft
        WHERE id_turma IN (683102, 683309)
          AND ativo = true
          AND (EXTRACT(DOW FROM ft.data) IN (1, 5)  -- Segunda-feira (1) e Sexta-feira (5)
               OR EXTRACT(DOW FROM ft.data) IN (3, 4)) -- Quartas-feiras (3) e Quintas-feiras (4)
    )
SELECT id_frequencia_turma, DATA, aulas, ativo
FROM backup_dados;

-- Script para desativar registros de segunda e sexta e ajustar o campo "aulas"

-- Desativar registros com datas de segunda-feira e sexta-feira
WITH 
    registros_para_desativar AS (
        SELECT
            ft.id_frequencia_turma
        FROM
            ensino.frequencia_turma ft
        WHERE
            id_turma IN (683102, 683309)
            AND ativo = true
            AND EXTRACT(DOW FROM ft.data) IN (1, 5)  -- Segunda-feira (1) e Sexta-feira (5)
    )
UPDATE ensino.frequencia_turma
SET ativo = false
WHERE id_frequencia_turma IN (SELECT id_frequencia_turma FROM registros_para_desativar);

-- Atualizar o campo "aulas" para 2 nas quartas e 1 nas quintas
UPDATE ensino.frequencia_turma
SET aulas = CASE
                WHEN EXTRACT(DOW FROM data) = 3 THEN 2  -- Quartas-feiras (DOW = 3)
                WHEN EXTRACT(DOW FROM data) = 4 THEN 1  -- Quintas-feiras (DOW = 4)
            END
WHERE id_turma IN (683102, 683309)
  AND ativo = true
  AND EXTRACT(DOW FROM data) IN (3, 4);



