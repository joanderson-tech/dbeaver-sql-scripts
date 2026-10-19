SELECT fa.*
-- COALESCE(sum(fa.frequencia), 0) AS faltasTotais, t.id_disciplina, t.id_turma 
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
JOIN ensino.frequencia_aluno fa ON
fa.id_turma = t.id_turma
LEFT  JOIN ensino.item_abono_frequencia iaf ON iaf.id_frequencia = fa.id_frequencia
AND fa.id_discente = d.id_discente
WHERE d.id_discente = 983266
--AND t.id_turma = 695746
--AND fa.frequencia = 0 
--AND fa.horarios = 2
AND t.ano = 2026;

SELECT *
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia in(138641643, 139021051, 139288785);


-- Auto-generated SQL script #202607221519
UPDATE ensino.abono_frequencia
    SET id_registro_entrada=null
    WHERE id_abono_frequencia=2953;
UPDATE ensino.abono_frequencia
    SET id_registro_entrada=null
    WHERE id_abono_frequencia=17785;




SELECT fa.DATA,
COALESCE(sum(fa.frequencia), 0) AS faltasTotais, 
COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono, CAST(COALESCE(SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 0) AS BIGINT) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia ) abonos ON
TRUE
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 983266
AND t.id_turma_serie = 53572835
--AND t.id_turma = 695746
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo)
GROUP BY fa.DATA;



GROUP BY t.id_disciplina, t.id_turma ;


SELECT p.nome, u.login, t.id_disciplina, t.codigo
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.id_turma IN (695746);

SELECT d.id_discente
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
WHERE p.nome ILIKE '%LARYSSA MARIA DA CONCEIÇÃO%';


--'%HUMBERTO BORBA DELMONDES%';;SELECT DISTINCT fa
FROM ensino.abono_frequencia af
--INNER JOIN COMUM.REGISTRO_ENTRADA re ON af.id_registro_entrada = re.ID_ENTRADA
INNER JOIN ensino.item_abono_frequencia iaf ON
af.id_abono_frequencia = iaf.id_abono_frequencia
INNER JOIN ensino.frequencia_aluno fa ON
iaf.id_frequencia = fa.id_frequencia
INNER JOIN ensino.turma t ON
fa.id_turma = t.id_turma
WHERE /*af.ativo = TRUE
AND */
af.id_estudante = 976633
AND t.ano = 2026
--AND fa.id_turma = t.id_turma
--AND (af.id_abono_frequencia_alterado IS NULL);
--ORDER BY re.DATA ASC;;SELECT *
FROM ensino.abono_frequencia af
INNER JOIN ensino.item_abono_frequencia iaf ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.id_estudante = 976723;

SELECT *
FROM ensino.abono_frequencia af
JOIN ensino.item_abono_frequencia iaf ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE iaf.id_frequencia = 40658
AND af.ativo;

SELECT *
FROM ensino.item_abono_frequencia iaf
WHERE iaf.id_frequencia IN (138036995, 138078932, 138105262);

SELECT fa.*
FROM ensino.frequencia_aluno AS fa
WHERE fa."data" = '2026-03-12'
AND fa.id_turma = 695746;

SELECT pessoa.id_pessoa, pessoa.nome, mes.num_chamada, mes.id_situacao_matricula_serie, CASE WHEN aet.data_entrada_escola IS NOT NULL THEN aet.data_entrada_escola
WHEN mes.data_matricula_turma IS NOT NULL THEN mes.data_matricula_turma
ELSE mes.data_cadastro END, pessoa.nome_social
FROM ensino.matricula_componente mc
INNER JOIN ensino.turma tc ON
tc.id_turma = mc.id_turma
INNER JOIN basico.turma_serie ts ON
ts.id_turma_serie = tc.id_turma_serie
INNER JOIN basico.serie s
    USING(id_serie)
INNER JOIN public.discente discente ON
discente.id_discente = mc.id_discente
INNER JOIN comum.pessoa pessoa ON
pessoa.id_pessoa = discente.id_pessoa
INNER JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = mc.id_discente
AND mes.periodo = tc.periodo
AND ( (mes.id_turma_serie = ts.id_turma_serie
    AND s.tipo_diario <> 16 )
OR s.tipo_diario = 16 )
AND mes.id_situacao_matricula_serie IN ( 1, 2, 3, 4, 6, 7, 8, 9, 10, 11 )
LEFT JOIN ensino.avaliacao_estudante_transferido aet ON
aet.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE tc.id_turma = :idTurma
AND mes.id_estudante = discente.id_discente
AND mc.id_situacao_matricula IN ( 5, 6, 2, 8, 9, 4 )
ORDER BY mes.num_chamada, pessoa.nome ASC, mc.id_discente;

SELECT d.id_pessoa, d.id_discente, freq.id_frequencia, freq.data, freq.frequencia, freq.abonada, freq.horarios
FROM ensino.turma t
JOIN ensino.frequencia_aluno freq ON
freq.id_turma = t.id_turma
AND freq.ativo
JOIN discente d
    USING (id_discente)
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = freq.id_discente
AND mes.id_turma_serie = t.id_turma_serie
AND mes.id_estudante = 976633
LEFT JOIN LATERAL ( SELECT mee.id_matricula_estudante_serie, COALESCE(mee.data_solicitacao, mee.data) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
OR ts.id_turma_serie = mes.id_turma_serie_multisseriado
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
AND t.id_turma = :idTurma
WHERE mee.id_situacao_matricula_serie = 1
AND mee.ativo
AND mee.id_tipo_sol_transferencia IN (3, 5)
    AND NOT EXISTS ( SELECT 1
FROM matricula.movimentacao_estudante_escola estorno
WHERE estorno.id_matricula_estudante_serie = mee.id_matricula_estudante_serie
    AND estorno.data_cadastro > mee.data_cadastro
    AND estorno.id_situacao_matricula_serie = 6
    AND estorno.ativo ) ) mee_externa ON
mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
WHERE freq.id_turma = 695746
AND (mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10, 4 )
    OR (mes.id_situacao_matricula_serie = 6
        AND freq.data < mee_externa.ultima_data))
ORDER BY freq.frequencia DESC, freq.abonada;

SELECT d.id_pessoa, freq.id_frequencia, freq.data, freq.frequencia, freq.abonada,(CASE WHEN (freq.abonada = TRUE
    AND af.ativo = trueValue()) THEN TRUE
ELSE FALSE END) AS abonada_valida, freq.horarios
FROM ensino.turma t
JOIN ensino.frequencia_aluno freq ON
freq.id_turma = t.id_turma
AND freq.ativo
LEFT JOIN ensino.item_abono_frequencia iaf ON
iaf.id_frequencia = freq.id_frequencia
LEFT JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
JOIN discente d
    USING (id_discente)
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = freq.id_discente
AND mes.id_turma_serie = t.id_turma_serie
AND mes.id_estudante = 976633
LEFT JOIN LATERAL ( SELECT mee.id_matricula_estudante_serie, COALESCE(mee.data_solicitacao, mee.data) AS ultima_data, mes.id_estudante
FROM matricula.movimentacao_estudante_escola mee
JOIN basico.matricula_estudante_serie mes ON
mes.id_matricula_discente_serie = mee.id_matricula_estudante_serie
JOIN basico.turma_serie ts ON
ts.id_turma_serie = mes.id_turma_serie
OR ts.id_turma_serie = mes.id_turma_serie_multisseriado
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
AND t.id_turma = 695746
WHERE mee.id_situacao_matricula_serie = 1
AND mee.ativo
AND mee.id_tipo_sol_transferencia IN (3, 5)
    AND NOT EXISTS ( SELECT 1
FROM matricula.movimentacao_estudante_escola estorno
WHERE estorno.id_matricula_estudante_serie = mee.id_matricula_estudante_serie
    AND estorno.data_cadastro > mee.data_cadastro
    AND estorno.id_situacao_matricula_serie = 6
    AND estorno.ativo ) ) mee_externa ON
mee_externa.id_matricula_estudante_serie = mes.id_matricula_discente_serie
AND mes.id_situacao_matricula_serie = 6
WHERE freq.id_turma = 695746
AND (mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10, 4 )
    OR (mes.id_situacao_matricula_serie = 6
        AND freq.data < mee_externa.ultima_data))
ORDER BY freq.frequencia DESC, freq.abonada;

SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais, COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono, COALESCE(SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 0) AS faltasEfetivas
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia, fa.id_frequencia) abonos ON
TRUE
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 976633
AND t.id_turma_serie = 53572760
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo);

SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais, COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono, CAST(COALESCE(SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 0) AS BIGINT) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia ) abonos ON
TRUE
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 976633
AND t.id_turma_serie = 53572760
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo);

SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais, COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono, CAST(COALESCE(SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 0) AS BIGINT) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia ) abonos ON
TRUE
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 976633
--AND t.id_turma IN (695746)
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo);

SELECT COALESCE(sum(fa.frequencia), 0) AS faltasTotais, COALESCE(sum(abonos.quantidade_faltas_abonadas), 0) AS apenasAbono, CAST(COALESCE(SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 0) AS BIGINT) AS faltasSemAbono
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( SELECT iaf.id_frequencia, sum(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
FROM ensino.item_abono_frequencia iaf
JOIN ensino.abono_frequencia af ON
af.id_abono_frequencia = iaf.id_abono_frequencia
WHERE af.ativo
AND iaf.id_frequencia = fa.id_frequencia
GROUP BY iaf.id_frequencia ) abonos ON
TRUE
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE fa.ativo
AND fa.id_discente = 976633
AND t.id_turma = 695750
AND NOT EXISTS (SELECT 1
FROM ensino.interrupcao_escola ie
WHERE ie.id_escola = ts.id_escola
AND fa."data" BETWEEN ie.inicio AND ie.fim
AND ie.ativo);

SELECT mc.numero_faltas,*
FROM ensino.matricula_componente mc
WHERE mc.id_matricula_componente = 17253818;

SELECT t.id_disciplina, 
CAST(COALESCE(SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 0) AS BIGINT ) AS faltas,
(count(*) * (SELECT count(*)
FROM ensino.horario_turma ht
WHERE ht.id_turma = t.id_turma
AND ht.ativo))
FROM ensino.frequencia_aluno fa
LEFT JOIN LATERAL ( 
    SELECT 
        iaf.id_frequencia, 
        SUM(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
    FROM ensino.item_abono_frequencia iaf
    JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia
    WHERE af.ativo = TRUE 
      AND iaf.id_frequencia = fa.id_frequencia
    GROUP BY iaf.id_frequencia
) abonos ON TRUE
JOIN ensino.turma t USING (id_turma)
WHERE fa.ativo = trueValue()
AND t.id_situacao_turma <> 4
AND fa.id_discente = 976633
AND t.id_turma_serie = 53572760
/*  AND NOT EXISTS (
        SELECT 1
        FROM ensino.item_abono_frequencia iaf
        JOIN ensino.abono_frequencia af
            ON af.id_abono_frequencia = iaf.id_abono_frequencia
        WHERE iaf.id_frequencia = fa.id_frequencia
          AND af.ativo = TRUE
      )*/
AND fa.data BETWEEN '2026-02-06' AND '2026-04-30'
GROUP BY t.id_turma;


SELECT 
    t.id_disciplina, 
/*    CAST(
        COALESCE(
            SUM(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0)), 
            0
        ) AS BIGINT
    ) AS faltas,*/
    CAST(
        COALESCE(
            SUM(
                GREATEST(fa.frequencia - COALESCE(abonos.quantidade_faltas_abonadas, 0), 0)
            ), 
            0
        ) AS BIGINT
    ) AS faltas,
    CAST(
        (COUNT(*) * (
            SELECT COUNT(*) 
            FROM ensino.horario_turma ht 
            WHERE ht.id_turma = t.id_turma 
              AND ht.ativo
        )) AS BIGINT
    ) AS totalfrequenciaslancadas
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t USING (id_turma)
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
LEFT JOIN LATERAL ( 
    SELECT 
        iaf.id_frequencia, 
        SUM(iaf.quantidade_faltas_abonadas) AS quantidade_faltas_abonadas
    FROM ensino.item_abono_frequencia iaf
    JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia
    WHERE af.ativo = TRUE 
      AND iaf.id_frequencia = fa.id_frequencia
    GROUP BY iaf.id_frequencia
) abonos ON TRUE
WHERE fa.ativo = trueValue()
  AND t.id_situacao_turma <> 4
  AND fa.id_discente = 976633
  AND t.id_turma_serie = 53572760
  AND fa.data BETWEEN '2026-02-06' AND '2026-04-30'
  AND NOT EXISTS (
      SELECT 1
      FROM ensino.interrupcao_escola ie
      WHERE ie.id_escola = ts.id_escola
        AND fa."data" BETWEEN ie.inicio AND ie.fim
        AND ie.ativo = TRUE
  )
GROUP BY t.id_disciplina, t.id_turma;



SELECT COALESCE(sum(freq.frequencia), 0)
FROM ensino.frequencia_aluno freq
JOIN ensino.turma t ON
t.id_turma = freq.id_turma
AND t.id_disciplina = 221
WHERE freq.ativo
AND (freq.abonada IS NULL
    OR freq.abonada = FALSE)
AND freq.id_discente = 976633
AND NOT exiite (SELECT 1 FROM ensino.item_abono_frequencia iaf 
        JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia 
        WHERE iaf.id_frequencia = freq.id_frequencia 
          AND af.ativo = trueValue())
AND t.id_turma_serie = 53572760;-- ) AS numero_faltas;


SELECT COALESCE(SUM(freq.frequencia), 0)
FROM ensino.frequencia_aluno freq
JOIN ensino.turma t
    ON t.id_turma = freq.id_turma
   AND t.id_disciplina = 221
WHERE freq.ativo = TRUE
  --AND ( freq.abonada IS NULL OR freq.abonada = FALSE)
  AND freq.id_discente = 976633
  AND NOT EXISTS (
        SELECT 1 FROM ensino.item_abono_frequencia iaf
        JOIN ensino.abono_frequencia af ON af.id_abono_frequencia = iaf.id_abono_frequencia
        WHERE iaf.id_frequencia = freq.id_frequencia
          AND af.ativo = TRUE)
  AND t.id_turma_serie = 53572760;